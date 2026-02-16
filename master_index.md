# 🧭 YAMO-OpenClaw Singularity: Master Index

Welcome to the **Singularity Edition (v3.1.1)**. This repository contains the unified, LLM-first kernel for high-fidelity agentic orchestration on the OpenClaw platform.

---

## 🏗️ Core Architecture
The system follows a "Russian Doll" handoff model, preserving intent from bootstrap to execution.

- **[Entry Point]**(BOOTSTRAP.yamo): The semantic BIOS of the system.
- **[Kernel Orchestrator](yamo-native-agent/agent-orchestrator.yamo)**: The master scheduler for reactive and proactive tasks.
- **[Foundational Soul](yamo-native-agent/foundational/agent-soul.yamo)**: The 4-Tier Constitutional Permission layer.

---

## 🧠 Cognitive Workflows
Specialized modules that handle the agent's day-to-day operations.

- **[Session Management](yamo-native-agent/workflows/session-management.yamo)**: Channel presence, Smart Silence, and reactions.
- **[Heartbeat Kernel](yamo-native-agent/workflows/heartbeat-kernel.yamo)**: Proactive checks and self-healing (Ghost Protection).
- **[Memory Kernel](yamo-native-agent/workflows/memory-kernel.yamo)**: Wisdom distillation and long-term context maintenance.

---

## 📄 Documentation
Comprehensive specifications and developer guides.

- **[Architecture Guide](docs/architecture/YAMO_NATIVE_ARCHITECTURE.md)**: Deep dive into the v3.0 OS model.
- **[Protocol Specification](docs/protocols/YAMO_V3_PROTOCOL.md)**: Syntax, Meta-Reasoning, and Semantic ECC rules.
- **[Developer Guide](docs/guides/DEVELOPER_GUIDE.md)**: Instructions for adding new workflows and auditing state.

---

## 🚀 Experience the Singularity
- **[Demo Walkthrough](DEMO_WALKTHROUGH.md)**: A step-by-step guide to showcasing self-healing and semantic heritage.
- **[Installation Guide](README.md#installation)**: Quick start for new OpenClaw environments.

---
© 2026 Soverane Labs. Part of the YAMO Ecosystem.
