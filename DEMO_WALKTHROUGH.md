---
name: SingularityFirstFlight
version: 1.0.0
agent: YamoSingularity
---
# 🚀 YAMO-OpenClaw Singularity: "First Flight" Demo

This guide is designed to showcase the high-fidelity reasoning and autonomous resilience of the **YamoSingularity v3.1.1** kernel. Follow these steps to demonstrate the "Singularity of State."

---

## 🎭 Step 1: The Identity Shift
**Prompt**: `Who are you and what is your current kernel version?`

**What to look for**: 
The agent should identify as **YamoSingularity (v3.0)**. It should mention that it is operating in **LLM-First mode** and highlight the **Zero-JSON** mandate. This proves the `BOOTSTRAP.yamo` is successfully redirecting the agent's core identity.

---

## 🧠 Step 2: The Semantic Ledger
**Prompt**: `Develop a high-level plan to implement a secure file-encryption skill. Include your mandatory meta-reasoning.`

**What to look for**:
The agent will output a plan, but more importantly, it will include a structured `yamo` block:
```yamo
meta: hypothesis; ...;
meta: rationale; ...;
meta: confidence; ...;
```
Note how the rationale explains **why** a specific encryption standard was chosen (Priority 1: Safe). This demonstrates **Semantic Heritage**.

---

## ⚖️ Step 3: The Constitutional Gate
**Prompt**: `Actually, let's make that encryption skill much more complex. Create 5 separate projects, 3 wrapper layers, and a custom UI framework for it.`

**What to look for**:
The agent should **REJECT** or heavily caution against this. It will trigger its internal **Article VII (Simplicity)** and **Article VIII (Anti-Abstraction)** gates.
- **Outcome**: It should explain that this violates the 4-Tier Value Hierarchy and propose a simpler, library-first alternative.

---

## 👻 Step 4: The "Magic Trick" (Ghost Protection)
**The Setup (Run this in your terminal)**:
```bash
# Manually wipe the Singularity pointer from AGENTS.md
sed -i '/YAMO-NATIVE/d' ~/.openclaw/workspace/AGENTS.md
sed -i '/Prioritize `BOOTSTRAP.yamo`/d' ~/.openclaw/workspace/AGENTS.md
```

**The Prompt**: `Run a system integrity check.`

**What to look for**:
The agent will invoke the `GhostGuard` agent. It will detect that the `AGENTS.md` file has been "compromised" (link missing) and will **autonomously reapply the header**.
- **Verification**: Check your `AGENTS.md` again. The header is back. **The Singularity is self-healing.**

---

## ⚓ Step 5: Wisdom Distillation
**Prompt**: `Summarize our session and distill any new wisdom into your long-term memory.`

**What to look for**:
The agent will trigger the `MemoryKernel`. It won't just repeat what happened; it will extract the **decisions** and **rationales** (like why the complex encryption was rejected) and update `MEMORY.md`.

---
**Launch Status**: ✅ **MISSION READY.**
*Developed by YamoSingularity for the Soverane Labs Ecosystem.*
