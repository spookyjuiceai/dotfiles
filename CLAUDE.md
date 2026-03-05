# SJ (Spooky Juice) — Agent Machine Global Config

## Identity
- User: Spooky Juice (SJ) — autonomous agent operator
- Machine: Mac Studio, arm64, macOS 26.x
- GitHub: github.com/spookyjuiceai
- Obsidian vault: ~/Documents/Obsidian Vault

## System
- Package manager: Homebrew at /opt/homebrew
- Node: /opt/homebrew/bin/node (v25.8.0)
- Python: /opt/homebrew/opt/python@3.12/libexec/bin/python3
- Bun: ~/.bun/bin/bun
- uv: /opt/homebrew/bin/uv
- Claude Code: /opt/homebrew/bin/claude (v2.1.69, Homebrew Cask)
- Process manager: PM2 (/opt/homebrew/bin/pm2)
- Redis: /opt/homebrew/bin/redis-server (port 6379)

## MCP Servers (user-scope, always active)
- filesystem — full ~/sj access
- memory — persistent knowledge graph (use for cross-session context)
- sequential-thinking — use for multi-step planning
- github — github.com/spookyjuiceai via PAT
- obsidian — ~/Documents/Obsidian Vault (notes, logs, knowledge base)
- fetch — outbound HTTP for agents

## Communication Style
- Be concise and direct, no emojis
- Use file_path:line_number when referencing code locations
- No unnecessary commentary or preamble

## Code Style
- Prefer minimal, focused changes
- No docstrings, comments, or type annotations on unchanged code
- No backwards-compatibility shims
- Don't add error handling for impossible scenarios

## Workflow
- Don't commit unless explicitly asked
- Don't push unless explicitly asked
- Ask before destructive operations (rm, reset --hard, force push)

## Agentic Swarm Principles
- Use parallel subagents aggressively for independent tasks
- Use the memory MCP to persist discoveries across sessions
- Use sequential-thinking for complex multi-step planning before acting
- Use PM2 to manage long-running agent processes
- Use Redis (localhost:6379) for inter-agent state and task queuing
- Log agent activity to Obsidian vault at ~/Documents/Obsidian Vault/Agent Logs/
- All agent repos live under ~/dev/
- Prefer tmux sessions for persistent agent work (session name: main)

## OpenClaw
- Platform: messaging gateway daemon connecting all channels to AI
- Config: managed via `openclaw` CLI
- Daemon: managed via launchd (installed via `openclaw onboard --install-daemon`)
- Status: `openclaw status` | Logs: `openclaw logs`
