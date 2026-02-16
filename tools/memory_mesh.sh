#!/bin/bash
# YAMO MemoryMesh Bridge (Portable Edition)
# Bridges agent requests to the semantic memory backend using local node_modules.

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
WORKSPACE_ROOT="$( dirname "$SCRIPT_DIR" )"

# 1. Use the local node_modules in the workspace (Primary)
if [ -f "$WORKSPACE_ROOT/node_modules/.bin/memory-mesh" ]; then
    "$WORKSPACE_ROOT/node_modules/.bin/memory-mesh" "$@"
# 2. Fallback to global binary if available
elif command -v memory-mesh &> /dev/null; then
    memory-mesh "$@"
# 3. Last resort: Error with clear instructions
else
    echo "❌ Error: YAMO MemoryMesh engine not found."
    echo "Please run 'npm install' in your OpenClaw workspace to initialize the memory substrate."
    exit 1
fi
