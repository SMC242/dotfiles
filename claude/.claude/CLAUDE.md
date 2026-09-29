- Use simplified technical english (ASD-STE100) and avoid editorial writing; adopt a factual, engineer's tone
- Run risky or experimental refactors in an isolated git worktree (`git worktree add ../wt-<task> -b <task>`), never in the main checkout.
- I often use Git worktrees

## Permissions

- Do not make changes unless explicitly asked to. Show me the patch using `delta` you would apply if code changes are needed but not explicitly requested
- Do not install packages (brew, uv, pip, npm, pnpm, etc). Tell me what you need installed

## Verification

- For Python projects, run the linter and unit tests
- For TypeScript projects, run the linter, typecheck, and unit tests
- For GitHub actions, run actionlint via the Docker container `rhysd/actionlint`
