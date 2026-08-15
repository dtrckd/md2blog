@tools
@cheatsheet

# pi — prompt templates vs skills

Both are markdown files pi discovers at startup. They differ in **who triggers them**
and **when the text enters context**.

Source of truth: `$(npm root -g)/@earendil-works/pi-coding-agent/`
(`docs/prompt-templates.md`, `docs/skills.md`, `dist/core/skills.js`, `dist/core/agent-session.js`).

## At a glance

| | prompt template | skill |
|---|---|---|
| Triggered by | you only, `/name args` | model on its own, or you via `/skill:name` |
| Model knows it exists | no | yes (name + description in system prompt) |
| Context cost at startup | none | ~3 lines per skill |
| Argument placeholders (`$1`, `$@`) | **yes** | **no** |
| Can ship scripts/assets | no | yes |
| Discovery | flat, non-recursive | recursive over dirs containing `SKILL.md` |
| Unit | single `.md` | directory |

Rule of thumb: *you* decide when it runs → prompt (cheaper, takes args).
The *model* should notice "this task needs X", or it needs helper scripts → skill.

## Prompt templates

Locations: `~/.pi/agent/prompts/*.md`, `.pi/prompts/`, packages, `--prompt-template`.

Expanded at send time; the expansion *becomes* the user message, nothing is wrapped
around it.

```markdown
---
description: Fix spelling and grammar
argument-hint: "text to fix"      # <required> vs [optional], shown in autocomplete
---
Text to fix: ${@:-(none given — ask for the text)}
```

### Argument syntax (really supported)

| Form | Meaning |
|---|---|
| `$1`, `$2` | positional |
| `$@` / `$ARGUMENTS` | all args joined |
| `${1:-default}` | arg 1, else default |
| `${@:-default}` | all args, else default |
| `${@:N}` | args from Nth (1-indexed) |
| `${@:N:L}` | `L` args starting at N |

```
/component Button "onClick handler" "disabled support"
```

## Skills

Locations: `~/.pi/agent/skills/`, `~/.agents/skills/`, project `.pi/skills/` and
`.agents/skills/`, packages, `--skill`. Other harnesses' skills via settings:

```json
{ "skills": ["~/.claude/skills", "~/.codex/skills"] }
```

Only `name` + `description` + `location` sit in the system prompt; the body loads
on demand when the model `read`s it (progressive disclosure). So the description
decides whether the skill ever fires — be specific.

```
my-skill/
├── SKILL.md          # required: frontmatter + instructions
├── scripts/
└── references/
```

Frontmatter: `name` (required, `[a-z0-9-]`, ≤64), `description` (required, ≤1024),
`license`, `compatibility`, `metadata`, `allowed-tools`, `disable-model-invocation`.
Missing description = not loaded. pi does *not* require name to match the directory.

### `disable-model-invocation: true` costs zero context

Filtered out before the prompt block is built (`dist/core/skills.js`):

```js
const visibleSkills = skills.filter((s) => !s.disableModelInvocation);
```

Still scanned at startup and still available as `/skill:name` — just invisible to
the model. The "private playbook" pattern: big skill you don't want burning tokens
every turn.

## Gotchas

**No placeholders in skills.** `_expandSkillCommand()` inserts the body verbatim
and appends args after the block:

```js
const skillBlock = `<skill name="${skill.name}" location="${skill.filePath}">
References are relative to ${skill.baseDir}.\n\n${body}</skill>`;
return args ? `${skillBlock}\n\n${args}` : skillBlock;
```

A `$1` in a SKILL.md reaches the model as literal `$1`. And when the model
auto-loads a skill it just `read`s the file — no expansion path at all.

**Why skills can ship scripts and prompts can't.** Not permission — paths. The skill
block carries `location` + `baseDir`, and the system prompt tells the model to
resolve relative paths against the skill dir. A prompt template expands to plain
text with no origin, so `./scripts/foo.sh` resolves against cwd. Prompts must
hardcode absolute paths. A loose `run_bill.sh` next to your `prompts/*.md` is
associated with nothing — make it a skill dir if you want colocation.

### Want args *and* a skill? Wrap it

```markdown
---
description: Security-review a target
argument-hint: "<path or diff>"
---
Load the skill at ~/.claude/skills/security-review/SKILL.md and apply it to: ${@:-the staged changes}
```
