# YAMO v3.0 Protocol Specification

**Status**: Canonical Standard
**Date**: 2026-02-15

---

## 1. Context Block Format
A YAMO Context Block is a semicolon-delimited key-value structure designed for LLM parsing.

### Syntax
```yamo
key: value;
list_key:
  - item_1;
  - item_2;
nested_key:
  sub_key;value;
```

### Constraints
*   **No Braces**: Avoid `{` and `}` unless part of a literal string.
*   **Semicolon Delimiters**: Every statement must end with `;`.
*   **Atomic Symbols**: Use `snake_case` for keys to lock attention heads (e.g., `initialize_kernel` not `Initialize Kernel`).

---

## 2. Meta-Reasoning Fields
Every context block must include at least two of the following meta-fields:

### `meta: hypothesis`
*   **Definition**: What the agent expects to happen.
*   **Example**: `meta: hypothesis; Checking email now will prevent urgent misses;`

### `meta: rationale`
*   **Definition**: The constitutional justification for the action.
*   **Example**: `meta: rationale; Silence is preferred here to avoid channel noise (Priority 4);`

### `meta: confidence`
*   **Definition**: A 0.0-1.0 score of certainty.
*   **Example**: `meta: confidence; 0.98;`

---

## 3. Heritage Pointers
To maintain intent, blocks can include inheritance metadata.

### `inherit_heritage`
*   **Definition**: A reference to the parent agent or workflow.
*   **Example**: `inherit_heritage; StatusChecker;`

---

## 4. Error Correction (ECC)
The YAMO Runtime is trained to auto-correct common drifts:
*   `intnet` -> `intent`
*   `meta_rationale` -> `meta: rationale`
*   Missing trailing semicolons (inferred from newlines).

---
© 2026 Soverane Labs.
