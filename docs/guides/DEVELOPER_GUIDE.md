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

## 4. Handling Platform Updates
OpenClaw updates (via `openclaw update`) often trigger the `openclaw doctor` command. This command may attempt to "repair" or reset your `AGENTS.md` file to factory defaults.

### Autonomous Recovery
The YAMO Singularity Kernel includes **Ghost Protection**. It is pre-configured to:
1.  Check the integrity of `AGENTS.md` upon every session boot.
2.  Automatically re-apply the `BOOTSTRAP.yamo` pointer if it has been removed by the platform.

### Manual Verification
If you suspect the agent has regressed to "Legacy Mode" after an update:
1.  Check the top of `AGENTS.md`. If the `YAMO-NATIVE KERNEL` header is missing, the platform has overwritten it.
2.  Trigger a heartbeat or restart the chat. The `AgentBootstrapper` will attempt to fix the link immediately.
3.  If the kernel directory itself was deleted (rare), restore from your `v3_singularity_shield` backup.

---
© 2026 Soverane Labs.
