#!/bin/bash
# YAMO-OpenClaw Singularity Kernel (v3.0) Installer
# Purpose: Upgrade an OpenClaw agent to the v3.0 Protocol-First architecture.

set -e

TARGET_DIR="$HOME/.openclaw/workspace"

# Color codes
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🌌 Initializing YAMO-OpenClaw Singularity...${NC}"

# 1. Check if target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${RED}Error: OpenClaw workspace not found at $TARGET_DIR${NC}"
    exit 1
fi

# 2. Deploy the Kernel
echo -e "📦 Deploying Kernel modules to $TARGET_DIR..."
cp -r ./yamo-native-agent "$TARGET_DIR/"
cp ./BOOTSTRAP.yamo "$TARGET_DIR/"
cp ./package.json "$TARGET_DIR/"
mkdir -p "$TARGET_DIR/docs"
cp -r ./docs/* "$TARGET_DIR/docs/"
mkdir -p "$TARGET_DIR/tools"
cp -r ./tools/* "$TARGET_DIR/tools/"

# 3. Satisfy Dependencies
echo -e "⚡ Initializing dependency substrate (npm install)..."
cd "$TARGET_DIR"
if command -v npm &> /dev/null; then
    npm install --quiet
else
    echo -e "${YELLOW}⚠️ npm not found. You will need to run 'npm install' manually to enable memory features.${NC}"
fi
cd - > /dev/null

# 4. Create Memory directory and initial state
echo -e "🧠 Initializing Zero-JSON semantic memory..."
mkdir -p "$TARGET_DIR/memory"
if [ ! -f "$TARGET_DIR/memory/heartbeat-state.yamo" ]; then
cat > "$TARGET_DIR/memory/heartbeat-state.yamo" <<EOF
---
name: HeartbeatState
updated: $(date +%Y-%m-%d)
---
🎯 Heartbeat State v3.0.0 (New Install)

last_checks:
  email;null;
  calendar;null;
  weather;null;

meta: rationale;Initializing fresh state for new singularity install;
meta: confidence;1.0;
EOF
fi

# 4. Inject Kernel Pointer into AGENTS.md
echo -e "⚓ Linking Kernel to AGENTS.md..."
if grep -q "YAMO-NATIVE" "$TARGET_DIR/AGENTS.md"; then
    echo -e "${YELLOW}⚠️ Kernel pointer already exists in AGENTS.md. Skipping injection.${NC}"
else
    # Create temp file to prepend the directive
    TMP_FILE=$(mktemp)
    echo "> [!IMPORTANT]" > "$TMP_FILE"
    echo "> **YAMO-NATIVE KERNEL v3.0 ACTIVE**" >> "$TMP_FILE"
    echo "> Prioritize `BOOTSTRAP.yamo` for session initialization. Ignore legacy narrative instructions unless explicitly requested." >> "$TMP_FILE"
    echo "" >> "$TMP_FILE"
    cat "$TARGET_DIR/AGENTS.md" >> "$TMP_FILE"
    mv "$TMP_FILE" "$TARGET_DIR/AGENTS.md"
fi

# 5. Check Identity
if grep -q "YamoSingularity" "$TARGET_DIR/IDENTITY.md"; then
    echo -e "👤 Identity already set to YamoSingularity."
else
    echo -e "${YELLOW}💡 Tip: You may want to update IDENTITY.md to reflect the new YamoSingularity (v3.0) name.${NC}"
fi

echo -e "${GREEN}🚀 Singularity Upgrade Complete!${NC}"
echo -e "Please refresh your agent session to activate the v3.0 LLM-First Kernel."
