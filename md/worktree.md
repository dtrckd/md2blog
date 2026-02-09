# Git Worktree + Claude Code: Parallel Development Guide

> Work on multiple features simultaneously using separate directories and Claude sessions.

---

## TL;DR

Git worktree lets you checkout multiple branches in separate folders. Run Claude Code in each = parallel development.

---

## Quick Setup (5 min)

### 1. Create worktrees for each feature

```bash
# From your main project directory
mkdir ../my-features
git worktree add ../my-features/feature-a -b feature-a
git worktree add ../my-features/feature-b -b feature-b
git worktree add ../my-features/feature-c -b feature-c
```

### 2. Open a terminal per feature and start Claude

```bash
# Terminal 1
cd ../my-features/feature-a && claude

# Terminal 2
cd ../my-features/feature-b && claude

# Terminal 3
cd ../my-features/feature-c && claude
```

### 3. Work in parallel

Each Claude session works independently on its own branch. No conflicts, no context switching.


## Structure Overview

```
parent-folder/
├── my-project/          # main branch (your base)
└── my-features/
    ├── feature-a/       # branch: feature-a
    ├── feature-b/       # branch: feature-b
    └── feature-c/       # branch: feature-c
```

Each folder = independent workspace = separate Claude session = parallel work.


---

## Useful Commands

| Action | Command |
|--------|--------|
| List worktrees | `git worktree list` |
| Check status | `cd ../my-features/feature-a && git status` |
| Remove worktree | `git worktree remove ../my-features/feature-a` |

---

## Merge When Done

```bash
# Back to main project
cd ../my-project
git checkout main

# Merge each feature
git merge feature-a
git merge feature-b
git merge feature-c

# Test
```

---

## Test Integration (Optional)

Preview combined features without committing:

```bash
git merge feature-a --no-commit
git merge feature-b --no-commit
# test
git reset --hard HEAD  # Undo if issues
```

---

## Cleanup

```bash
git worktree remove ../my-features/feature-a
git worktree remove ../my-features/feature-b
git worktree remove ../my-features/feature-c
rm -rf ../my-features
```

---

## When to Use

✅ **Good for:**
- Multiple independent features
- Tight deadlines
- Avoiding context switching

❌ **Skip if:**
- Features modify same files heavily
- Small project (overhead not worth it)
- Limited system resources

---


