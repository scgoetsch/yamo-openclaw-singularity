#!/bin/bash
# YAMO MemoryMesh Bridge
# Bridges agent requests to the local or global YAMO semantic memory backend.

if [ -f "/home/dev/workspace/yamo-os/lib/brain/brain.ts" ]; then
    # Use workspace YAMO-OS if available (Primary)
    npx tsx /home/dev/workspace/yamo-os/lib/brain/brain.ts "$@"
elif command -v memory-mesh &> /dev/null; then
    # Use global binary if available
    memory-mesh "$@"
else
    echo "❌ Error: YAMO MemoryMesh backend not found."
    echo "Please install yamo-os or memory-mesh to enable semantic persistence."
    exit 1
fi
