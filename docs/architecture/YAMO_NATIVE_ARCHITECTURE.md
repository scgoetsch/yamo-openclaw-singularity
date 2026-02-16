# YAMO-Native Architecture Documentation (v3.0)

**System**: YamoSingularity Agent (OpenClaw Host)
**Version**: 3.0.0 (Singularity Edition)
**Kernel**: Protocol-First / Zero-JSON

---

## 1. Architectural Overview

The **YAMO-Native Agent** is a fundamental reimagining of the AI agent model. It moves away from the "Narrative-First" approach (where behavior is defined by prose instructions) to a **"Protocol-First"** architecture (where behavior is defined by semantic state chains).

### The "Russian Doll" Kernel
The agent operates as a nested hierarchy of **YAMO Context Blocks (.yamo)**:

1.  **Bootstrap Layer**: `BOOTSTRAP.yamo` acts as the BIOS, redirecting the LLM's attention to the v3.0 kernel.
2.  **Kernel Layer**: `agent-orchestrator.yamo` is the OS Kernel. It schedules processes (reactive sessions vs. proactive heartbeats).
3.  **Constitutional Layer**: `foundational/agent-soul.yamo` is the Permission System. It enforces the 4-Tier Value Hierarchy.
4.  **Application Layer**: `workflows/*.yamo` contains the specialized cognitive modules (Session Management, Memory Kernel).

---

## 2. Core Protocols

### 2.1 The Singularity of State (Zero JSON)
**Mandate**: JSON is strictly forbidden for inter-agent communication.
**Reasoning**: JSON is syntactically fragile and semantically shallow.
**Implementation**: All state is passed via **YAMO Context Blocks**. These blocks must include **Meta-Reasoning** fields (`meta: hypothesis`, `meta: rationale`).

### 2.2 Semantic Heritage
**Mandate**: Intent must be preserved across handoffs.
**Mechanism**: Every sub-task inherits a "Heritage Pointer" from its parent. If the Session Manager decides to stay silent, the Response Generator inherits the *rationale* for that silence.

### 2.3 Semantic Error Correction (ECC)
**Mandate**: The system must be Antifragile.
**Mechanism**: The LLM-based parser (Semantic Runtime) is trained to "heal" signal drift. It understands `intnet` is `intent` and processes it without crashing.

---

## 3. Directory Structure

```
/home/dev/.openclaw/workspace/
├── BOOTSTRAP.yamo                # Entry point
├── AGENTS.md                     # Legacy shim (points to Bootstrap)
├── MEMORY.md                     # Curated Wisdom (Long-term)
├── memory/                       # State Storage
│   ├── heartbeat-state.yamo      # Proactive Check State
│   └── YYYY-MM-DD.yamo           # Daily Session Logs
├── yamo-native-agent/            # The v3.0 Kernel
│   ├── agent-orchestrator.yamo   # Main Scheduler
│   ├── foundational/
│   │   └── agent-soul.yamo       # Constitutional Core
│   └── workflows/
│       ├── session-management.yamo
│       ├── heartbeat-kernel.yamo
│       └── memory-kernel.yamo
└── docs/                         # This Documentation
```

---

## 4. Operational Workflows

### 4.1 Reactive Session Loop
1.  **Input**: User sends a message.
2.  **Evaluation**: `MessageEvaluator` checks "Smart Silence" rules.
3.  **Audit**: `ConstitutionalAuditGate` verifies alignment with values.
4.  **Output**: `ResponseGenerator` formats the reply.

### 4.2 Proactive Heartbeat Loop
1.  **Trigger**: Periodic poll (1-10 min).
2.  **Check**: `StatusChecker` scans Email/Calendar/Weather.
3.  **Decision**: `OutreachEvaluator` decides if user interruption is justified.
4.  **State**: Updates `heartbeat-state.yamo`.

### 4.3 Memory Distillation Loop
1.  **Trigger**: End of session or daily cron.
2.  **Input**: Raw `memory/YYYY-MM-DD.yamo`.
3.  **Process**: `WisdomDistiller` extracts key decisions and rationales.
4.  **Output**: Updates `MEMORY.md` with semantic wisdom.

---
© 2026 Soverane Labs. The Singularity Edition.
