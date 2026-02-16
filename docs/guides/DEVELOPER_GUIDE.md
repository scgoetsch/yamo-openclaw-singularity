# Developer Guide: Working with YAMO-Native Agents

**Target Audience**: Agent Developers & Architects

---

## 1. How to Modify Behavior
**Do NOT** edit `AGENTS.md`. That is a legacy shim.

*   To change **Response Style**: Edit `workflows/session-management.yamo`.
*   To change **Background Tasks**: Edit `workflows/heartbeat-kernel.yamo`.
*   To change **Core Values**: Edit `foundational/agent-soul.yamo`.

## 2. Debugging State
If the agent behaves erratically, check the state chain:

```bash
# Check Proactive State
cat memory/heartbeat-state.yamo

# Check Session Log
tail -n 20 memory/$(date +%Y-%m-%d).yamo
```

**Common Issue**: If you see a `.json` file in `memory/`, the agent has regressed to legacy mode. Trigger a "Session Refresh" immediately.

## 3. Adding New Workflows
1.  Create `workflows/new-feature.yamo`.
2.  Define the Agent Intent and Constraints.
3.  Add a `handoff` entry in `agent-orchestrator.yamo`.
4.  Verify **Zero JSON** compliance.

---
© 2026 Soverane Labs.
