# pip to uv Migration Guide

## Install uv

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

## Command Mapping

| pip                                | uv                                   |
|------------------------------------|--------------------------------------|
| `pip install package`              | `uv add package`                     |
| `pip install package --dev`        | `uv add --dev package`               |
| `pip install -e .`                 | `uv sync`                            |
| `pip install -r requirements.txt`  | `uv pip install -r requirements.txt` |
| `pip uninstall package`            | `uv remove package`                  |
| `pip freeze`                       | `uv pip freeze`                      |
| `pip list`                         | `uv pip list`                        |
| `python -m venv .venv`            | `uv venv`                            |
| `python script.py`                | `uv run script.py`                   |

## Key Differences

### 1. No manual venv activation needed

`uv run` auto-creates and uses the venv:

```bash
uv run python script.py
uv run pytest
```

### 2. Dependencies go in `pyproject.toml`, not `requirements.txt`

```bash
uv add requests           # adds to [project.dependencies]
uv add --dev pytest       # adds to [dependency-groups] dev
```

### 3. Lockfile

`uv lock` generates `uv.lock` (replaces `pip freeze > requirements.txt`):

```bash
uv lock          # create/update lockfile
uv sync          # install exactly what's in the lockfile
```

### 4. Python version management

uv can install Python itself:

```bash
uv python install 3.12
uv python pin 3.12        # writes .python-version
```

## Migration Steps

1. **Already have `pyproject.toml`?** Run:
   ```bash
   uv sync
   ```
   This creates `.venv/`, installs all dependencies, and generates `uv.lock`.

2. **Have a `requirements.txt` too?** Import it:
   ```bash
   uv add $(cat requirements.txt | grep -v '^#' | tr '\n' ' ')
   ```
   Then you can delete `requirements.txt`.

3. **Commit `uv.lock`** to version control (like `package-lock.json` in JS).

4. **Update CI** -- replace `pip install -e ".[dev]"` with `uv sync`.

## Mental Model

- `uv add/remove` = edit `pyproject.toml` + lock + sync
- `uv lock` = resolve deps into `uv.lock`
- `uv sync` = install from `uv.lock` into `.venv/`
- `uv run` = ensure synced, then execute
- `uv pip ...` = drop-in pip compatibility layer (escape hatch)

### `uv pip install` vs `uv add`

Both are equally fast (same resolver and installer). The difference is what they do:

| | `uv pip install` | `uv add` |
|---|---|---|
| Modifies `pyproject.toml` | no | yes |
| Updates `uv.lock` | no | yes |
| Installs into venv | yes | yes |
| Reproducible | no | yes |

Use `uv add` when working with `pyproject.toml`. Use `uv pip install` for throwaway installs.

---

## Annex: Using uv with direnv

direnv does not yet ship a built-in `layout uv` (tracked in [direnv#1250](https://github.com/direnv/direnv/issues/1250)). However, uv works with the existing `layout python` by setting one environment variable.

### Setup

Add this to your project's `.envrc`:

```bash
layout python
export UV_PROJECT_ENVIRONMENT="$VIRTUAL_ENV"
uv sync
```

`layout python` creates a venv in `.direnv/python-<version>/` and sets `$VIRTUAL_ENV`. The `UV_PROJECT_ENVIRONMENT` export tells uv to use that venv instead of the default `.venv/`.

With this setup, `uv add`, `uv remove`, `uv sync`, and `uv run` all work normally.

### Optional: auto-sync on dependency changes

```bash
layout python
export UV_PROJECT_ENVIRONMENT="$VIRTUAL_ENV"

watch_file pyproject.toml
watch_file uv.lock
uv sync
```

`watch_file` is a direnv feature that re-evaluates `.envrc` when those files change. Without it, `uv sync` still works -- you just have to run it yourself after manual edits to `pyproject.toml`.

### Optional: pin Python version with uv

```bash
uv python install 3.12
layout python $(uv python find 3.12)
export UV_PROJECT_ENVIRONMENT="$VIRTUAL_ENV"
uv sync
```

### Note on `requires-python`

If your `pyproject.toml` has a `requires-python` constraint (e.g. `>= 3.11`) and your system Python doesn't satisfy it, `uv sync` will fail. Pin the version explicitly in that case.

### References

- [direnv issue #1250](https://github.com/direnv/direnv/issues/1250) -- tracks official uv support
- [Hynek Schlawack's virtualenv redux](https://hynek.me/articles/python-virtualenv-redux/)
- [Trey Hunner's direnv + uv walkthrough](https://treyhunner.com/2024/10/switching-from-virtualenvwrapper-to-direnv-starship-and-uv/)
