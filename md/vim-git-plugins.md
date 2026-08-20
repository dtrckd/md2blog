@vim
@git
@recipes

## vim-fugitive

Open a file at a given commit/branch:

    :Gedit <commit>:<path>
    :Gedit HEAD~2:src/main.py
    :Gedit main:README.md
    :Gedit origin/dev:lib/foo.js

fugitive registers a `fugitive://` scheme, so plain `:e <ref>:<path>` also works.

Shortcuts:
- `:Gedit :0:%` — current file's staged/index version
- In `:Git log`, cursor on a commit then `o`/`O`/`-` to open files at that commit

### Conflict resolution

3-way merge view — open a conflicted file then:

    :Gvdiffsplit!

Opens three vertical panes: left (ours/HEAD `//2`), center (working copy), right (theirs `//3`).

    :diffget //2    " take from left (ours)
    :diffget //3    " take from right (theirs)

From the `:Git` status buffer, conflicted files appear under "Unmerged":
- `dv` on a file — open it directly in 3-way diff view

`:Git mergetool` loads all conflicted files into the quickfix list (`cnext`/`cprev` to navigate).

## vim-gitgutter

Default mappings:

- `]c` / `[c` — jump to next/prev hunk (conflicts with native diff-mode mappings, auto-disabled there)
- `<leader>hs` — stage hunk (`GitGutterStageHunk`)
- `<leader>hu` — undo/revert hunk (`GitGutterUndoHunk`)
- `<leader>hp` — preview hunk (`GitGutterPreviewHunk`)
- `ic` / `ac` — text object for inner/a hunk (e.g. `dic`)

Commands (no default mapping):
- `:GitGutterToggle` — enable/disable signs+highlighting
- `:GitGutterLineHighlightsToggle` — toggle line highlighting
- `:GitGutterFold` — fold unchanged lines, show only hunks
