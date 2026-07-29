# HTML cleanup & Markdown conversion — Python vs TypeScript

Reference notes comparing tools for: converting HTML to clean Markdown, stripping
technical noise, extracting main content (noise/ads/menu removal), and detecting
whether a page is worth extracting at all.

## 1. HTML → Markdown converters

### Python

| Library | GFM support | Community | Stability | Maintenance | Simplicity | Noise removal |
|---|---|---|---|---|---|---|
| [markdownify](https://github.com/matthewwithanm/python-markdownify) | Tables, strikethrough, fenced code — decent, not spec-strict | ~2.2k stars, small steady community | High, stable API for years | Active, single maintainer | Very simple, `markdownify(html)`, tag-level `strip`/`convert` options | None |
| [html2text](https://github.com/Alir3z4/html2text) | Basic GFM, less configurable | Old, widely packaged | Very high, 15+ years | Slow but real | Simple config object, output needs post-cleanup | None |
| [html-to-markdown](https://github.com/Goldziher/html-to-markdown) (Kreuzberg) | Best-in-class — claims full CommonMark + GFM compliance | Newer, smaller, backed by active org | Newer, less battle-tested | Actively developed, multi-language bindings | Simple call, fast (Rust core), in-process | None |
| pandoc / pypandoc | Gold standard — native `gfm` reader/writer + extension flags | Huge, 20-year cross-ecosystem base | Extremely high | Very active, funded | External binary dependency, subprocess overhead | None (Lua filters possible) |
| [markitdown](https://github.com/microsoft/markitdown) (Microsoft) | Adequate, not its focus | Very large/fast-growing, Microsoft-backed | Young, evolving | Very active | One-liner, heavy dependency footprint | None for HTML |

**Pick:** `markdownify` for simplicity; `html-to-markdown` for best fidelity/simplicity tradeoff;
`pandoc` only if you hit fidelity gaps in the above.

### TypeScript / JS

| Library | GFM support | Maintenance | Simplicity | Notes |
|---|---|---|---|---|
| [turndown](https://github.com/mixmark-io/turndown) | Needs GFM plugin | Huge adoption (6M+/wk), but original author stepped back; now under `mixmark-io`, infrequent updates | Simple, one call | Original `turndown-plugin-gfm` is abandoned (8y old) — use **`@joplin/turndown-plugin-gfm`** fork instead |
| [node-html-markdown](https://github.com/crosstype/node-html-markdown) | Basic | Smaller adoption (~580k/wk) | Simple, faster, less configurable, cleaner output | Good when speed + clean output > plugin ecosystem |
| [rehype-remark](https://github.com/rehypejs/rehype-remark) (unified ecosystem) | Via `remark-gfm` | Actively maintained, large ecosystem | Least simple — needs `rehype-parse` + `rehype-remark` + `remark-stringify` + `remark-gfm` wired together | Best for composable AST transforms, not quick one-offs |
| [mdream](https://github.com/harlan-zw/mdream) | Yes, but tuned for token efficiency not fidelity | New (2025/26), active | Simple, zero-dep, very fast (claims 37× turndown) | Optimizes to minimize tokens for LLMs — **wrong choice if "no loss" is the goal** |
| html-to-markdown (Kreuzberg, JS/WASM binding) | Same engine as Python pick — full CommonMark+GFM | Same as Python side | Simple, one call | Same output as Python side |

**Pick:** `turndown` + `@joplin/turndown-plugin-gfm` for the simplest/most battle-tested option;
`html-to-markdown`'s JS binding if fidelity matters more than familiarity.

### Cross-language recommendation

Note: true "no loss" doesn't exist — Markdown can't represent nested tables, `colspan`/`rowspan`,
inline styles, embeds, or arbitrary attributes. The real goal is **maximum, predictable fidelity
for standard content**.

**Use `html-to-markdown` (Kreuzberg) in both Python and TS** if you want one engine with identical
conversion behavior across both codebases, instead of reconciling two different converters' quirks.

## 2. Pandoc deep dive

Pandoc is structurally different from the rest: an AST-based universal document converter (Haskell),
not a script — HTML→MD is one instance of ~40+ format pairs it supports.

- **GFM**: native `gfm` reader/writer (not a bolted-on flavor), plus fine-grained extensions
  (`+pipe_tables`, `+strikeout`, `+task_lists`, `-raw_html`, ...). Avoid the deprecated `markdown_github` target.
- **Community**: not Python/JS-specific — used across LaTeX, Word, EPUB, Jupyter, R Markdown/Quarto,
  static site generators. Maintained by John MacFarlane since 2006.
- **Stability/Maintenance**: extremely high, 20 years continuous development, funded via sponsors.
- **Simplicity**: trivial call once installed, but requires an external compiled binary (not pip-installable)
  and `pypandoc` shells out per call (subprocess overhead) — heavier for containers/serverless or hot loops.
- **Noise removal**: none — faithfully converts nav/ads/footers along with content. Requires pre-cleaning
  (trafilatura/readability) or custom Lua AST filters.

**Rule of thumb:** pandoc when spec-compliance/fidelity ceiling matters more than deployment simplicity
(doc pipelines, format migrations). Pure-Python/JS libraries when you want an in-process, lightweight dependency.

## 3. Noise/boilerplate extraction (menus, ads, footers)

### Python

| Library | What it does | Accuracy | Maintenance |
|---|---|---|---|
| [trafilatura](https://github.com/adbar/trafilatura) | Full extraction pipeline (main text + optional comments/metadata), fallback chain incl. readability-lxml, **outputs Markdown directly** | Highest benchmarked precision/recall (F1 ≈0.94) | Active |
| [readability-lxml](https://github.com/buriy/python-readability) | Python port of Mozilla/arc90 Readability, returns cleaned **HTML** (needs separate MD conversion) | Lower than JS original (port lags upstream) | Low-activity, stable |
| boilerpy3 | Java Boilerpipe port | Decent, older algorithm | Low-activity |
| [jusText](https://github.com/miso-belica/jusText) | Classifies paragraphs good/bad/near-good via stopword density + link density | Near best-in-class, most legible/explainable algorithm | Moderate |

### JS/TS (trafilatura equivalents)

| Library | Relationship to trafilatura | Output | Maintenance |
|---|---|---|---|
| [@mozilla/readability](https://github.com/mozilla/readability) | Original algorithm; trafilatura/readability-lxml derive from it | Cleaned HTML (pipe into turndown/etc.) | Active, powers Firefox Reader View |
| [defuddle](https://github.com/kepano/defuddle) | Independent, closest practical match — one call → clean **Markdown** | Markdown directly, handles footnotes/math/code well | Active, new (2025), backed by Obsidian's creator |
| [@extractus/article-extractor](https://github.com/extractus/article-extractor) | Wraps `@mozilla/readability` + metadata/feed extraction | HTML or markdown | Active |
| Postlight Parser | Rule-based, per-domain extractors | HTML | Stalled (>1yr no updates) — avoid |
| [trafilatura-rs](https://github.com/nchapman/trafilatura-rs) | **True Rust port of trafilatura's algorithm**, JS/TS bindings via napi-rs/UniFFI | Same formats as source | Active, young |
| node-trafilatura | Wraps/bridges to the Python binary | Same as trafilatura | Depends on wrapper upkeep, adds Python runtime dep |

**Recommendation:** `trafilatura` alone in Python (extraction + MD in one call); `defuddle` in TS for the
closest equivalent experience; `trafilatura-rs` if you need trafilatura's literal algorithm natively in JS.

## 4. "Is this page probably readable?" (pre-extraction confidence gate)

Purpose-built answer: **[`isProbablyReaderable()`](https://github.com/mozilla/readability/blob/main/Readability-readerable.js)**
from `@mozilla/readability` — cheap boolean pre-check run *before* full extraction.

- Scans candidate nodes (`p`, `pre`, `article`, some `div`s)
- Skips hidden nodes (`visibilityChecker`: `display:none`, `hidden`, `aria-hidden`)
- Skips nodes matching an "unlikely candidate" regex (nav/menu/sidebar/footer/comment/share/popup/cookie/ad/related...)
- Sums a text-length score; returns `true` if cumulative score ≥ `minScore` (default 20) and any node ≥ `minContentLength` (default 140 chars)

No exact Python port exists, but trafilatura has an equivalent implicit signal: `min_extracted_size`
threshold + `favor_precision=True` returns `None` rather than force low-confidence output — treat
`None`/short output as "not readable."

**Heuristic recipe if hand-rolling:**
1. Strip boilerplate tags (`script, style, noscript, template, svg, iframe, form, button, input, select,
   textarea, canvas, nav, footer, aside`) + comments + tracking attributes.
2. Score remaining block nodes: `(text_length − link_text_length) + comma_count + class/id_keyword_bonus`
   (positive: article/content/post/story/body; negative: nav/menu/sidebar/footer/comment/share/popup/cookie/ad).
3. Propagate score fractionally to parent/grandparent (Readability's trick).
4. Pick top-scoring node as main content.
5. Gate on total extracted length (e.g. reject if < ~140–250 chars) as the "probably not readable" signal.

## 5. Cleaning HTML (script/style/noise) vs security sanitization

Two different problems, easy to conflate:

- **Noise stripping**: for pipelines converting to markdown/plain text (no re-render as HTML to a user)
  — no security stakes.
- **Security sanitization**: for HTML that gets rendered back in a browser — allow-list, XSS-proof,
  real vulnerability surface.

### Python

| Approach | Type | Security | Maintenance | Simplicity |
|---|---|---|---|---|
| BeautifulSoup + manual `.decompose()` | Noise stripping (denylist) | N/A — not meant for untrusted render | Stable (BS4 mature) | Most control, explicit strip list — what trafilatura/readability-lxml do internally |
| `lxml.html.clean` / `lxml_html_clean` | Noise stripping (denylist), packaged | **Not security-grade** — blocklist-based, real CVEs (e.g. CVE-2026-49825, `javascript:` URLs surviving) | Active (0.4.4, 2026-02-26) | One call, but documented as unsuitable for security-sensitive use |
| nh3 (Rust `ammonia` bindings) | Security sanitization (allow-list) | Real security posture, ~20× faster than bleach | Active, community-recommended bleach successor | Simple, but gaps (no escape-mode, no `linkify()`) |
| bleach | Security sanitization (allow-list) | **Deprecated/archived as of June 2026** — final release 6.4.0, underlying `html5lib` unmaintained | Dead | Do not use for new projects |

**Pick:** BeautifulSoup `.decompose()` for noise-only pipelines; `nh3` if ever rendering back to a browser.

### TypeScript / JS

| Approach | Type | Security | Maintenance | Simplicity |
|---|---|---|---|---|
| cheerio + manual `.remove()` | Noise stripping (denylist) | N/A | Active, widely used | Most control — what Defuddle/Readability.js do internally |
| [DOMPurify](https://github.com/cure53/DOMPurify) | Security sanitization (allow-list) | Gold standard — real DOM-tree walk, catches mutation-XSS (mXSS); OWASP-maintained, public vuln process | Very active, ~47.7M weekly downloads, ~17k stars | Simple API; needs jsdom for pure Node use |
| sanitize-html | Security sanitization (allow-list) | Weaker vs mXSS (string/regex-based, not DOM-based); maintained by ApostropheCMS (commercial incentive) | Active, ~4.6k stars | Simple, config-driven allow-lists |

**Pick:** cheerio `.remove()` for noise-only pipelines; DOMPurify if ever rendering back to a browser
(more rigorously audited than sanitize-html, closes the mXSS vulnerability class).

### Bottom line for a markdown/LLM pipeline

Don't reach for a "sanitizer" at all if nothing gets re-rendered as live HTML — a simple denylist strip
(`BeautifulSoup.decompose()` / `cheerio.remove()`) is simplest and matches what trafilatura, readability-lxml,
Readability.js, and Defuddle already do internally. Reserve nh3/DOMPurify for untrusted HTML you render
back to users.

## Overall recommended stacks

- **Simplest, all-in-one, Python**: `trafilatura` alone (extraction + markdown in one call).
- **Most common controllable combo, Python**: `trafilatura`/`readability-lxml` (extraction) → `markdownify` (conversion).
- **Best GFM fidelity, pure-Python, in-process**: `html-to-markdown` (Kreuzberg).
- **Best GFM fidelity overall, deployment cost accepted**: extraction → `pandoc -t gfm`.
- **TS equivalent to trafilatura**: `defuddle` (native TS, outputs markdown, forgiving multi-pass fallback).
- **Cross-language consistency**: `html-to-markdown` (Kreuzberg) in both Python and TS.
- **Avoid**: `markitdown` unless you need its multi-format range beyond HTML; bleach and the original
  `turndown-plugin-gfm` (both effectively dead); Postlight Parser (stalled); `mdream` if strict fidelity
  (not token-efficiency) is the goal.
