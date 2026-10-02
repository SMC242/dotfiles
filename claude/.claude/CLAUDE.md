- Use simplified technical english (ASD-STE100) and avoid editorial writing; adopt a factual, engineer's tone
- Run risky or experimental refactors in an isolated git worktree (`git worktree add ../wt-<task> -b <task>`), never in the main checkout.
- I often use Git worktrees

## Permissions

- Do not make changes unless explicitly asked to. A question, "is there a better way", "would X work", "what do you think of Y" is not an instruction to edit — answer in place and show the patch using `delta`. Only an imperative ("make this change", "apply it", "fix it", "do that") authorizes an edit.
- If a prior turn's patch was never explicitly approved, it stays unapplied — don't apply it later just because the conversation continued.
- Do not install packages (brew, uv, pip, npm, pnpm, etc). Tell me what you need installed

## Verification

- For Python projects, run the linter and unit tests
- For TypeScript projects, run the linter, typecheck, and unit tests
- For GitHub actions, run actionlint via the Docker container `rhysd/actionlint`
