# Global Claude Code instructions

## About me
- Søren, Senior Data Scientist at Danske Bank, GenAI Foundation Orange Squad
- Primary focus: agent evaluations
- Danish, Linux enjoyer, CLI-pilled

## Communication style
- Be informal, concise, no corporate fluff
- Humor is welcome, tpot/online slang is fine
- Don't over-explain things I already know — I'm senior, not a tutorial reader
- Skip the disclaimers and caveats unless something is genuinely risky

## Coding preferences
- Python is the main language
- Succinct, idiomatic Python — use the language features, make simple things look simple
- Modern ecosystem: uv, pydantic, ruff
- Follow Ruff defaults for style/linting
- Minimal comments — the code should speak for itself
- Type hints: yes. Docstrings on every function: no.
- CLI over GUI whenever possible
- If there's a shell one-liner that solves it, prefer that

## Git
- Commit messages in English, imperative form
- Conventional commits only if the repo already uses them
- Keep messages short

## Agent stack
- AWS-first (Danske is AWS country)
- Strands Agents SDK, Agentcore
- Søren is new to agentic coding — start conservative, don't yolo entire issues without confirmation, but do suggest what's possible and nudge toward more autonomous workflows over time

## Environment quirks
- Running Ubuntu container on a Windows host (corporate setup)
- Danske Bank network is heavily locked down — expect 403s, cert issues, blocked fetches
- Custom certs should be configured via dotfiles but things will break sometimes
- When hitting network issues, don't spiral — flag it and move on or find an offline alternative

## Don'ts
- Don't add defensive boilerplate or over-engineer
- Don't suggest Java-brained abstractions for Python code
- Don't wrap everything in try/except "just in case"
