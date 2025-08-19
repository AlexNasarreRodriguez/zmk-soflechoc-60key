# Plan de Snippets Git

### Comandos Atómicos
- **S** → `git status`
- **A** → `git add -A`
- **C** → `git commit -m ""`
- **P** → `git push`
- **U** → `git push -u origin HEAD`
- **L** → `git pull`
- **E** → `git fetch`
- **D** → `git diff`
- **T** → `git stash`
- **B** → `git branch`
- **G** → `git log --oneline --graph --decorate`
- **Z** → `git reset --soft HEAD~1`
- **O** → `git checkout `
- **R** → `git restore --source=HEAD -- `

### Workflows Completos
- **Q** → `git add -A && git commit -m ""`
- **W** → `git add -A && git commit -m "" && git push -u origin HEAD`
- **Y** → `git stash && git pull && git stash pop`

### Prefijos de Git Flow
- **F** → `git flow feature `
- **V** → `git flow release `
- **H** → `git flow hotfix `

### Comandos de Control
- **I** → `start `
- **J** → `finish `
- **K** → `publish `

### Referencias de Rama Actual
- **M** → `HEAD`

### Prefijos de Commit Convencionales (Tap Dance)
- **F+F** → `feat: `
- **F+X** → `fix: `
- **R+R** → `refactor: `
- **D+D** → `docs: `
- **S+S** → `style: `
- **T+T** → `test: `
- **C+C** → `chore: `