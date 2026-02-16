#!/bin/bash
# YAMO-OpenClaw Singularity Kernel (v3.2.2) Auto-Installer
# Purpose: Truly "Zero-Config" upgrade for OpenClaw agents.

set -e

TARGET_DIR="$HOME/.openclaw/workspace"
PACKAGE_ROOT="$(pwd)"

# Color codes
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🌌 Initializing YAMO-OpenClaw Singularity (v3.2.2)...${NC}"

# 1. Environment Verification
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${RED}Error: OpenClaw workspace not found at $TARGET_DIR${NC}"
    exit 1
fi

# 2. Deploy Kernel & Tools
echo -e "📦 Deploying Kernel modules and Tools..."
cp -r ./yamo-native-agent "$TARGET_DIR/"
cp ./BOOTSTRAP.yamo "$TARGET_DIR/"
cp ./package.json "$TARGET_DIR/"
mkdir -p "$TARGET_DIR/docs"
cp -r ./docs/* "$TARGET_DIR/docs/"
mkdir -p "$TARGET_DIR/tools"
cp -r ./tools/* "$TARGET_DIR/tools/"

# 3. Autonomous Configuration (.env)
echo -e "⚙️  Auto-configuring semantic substrate..."
if [ ! -f "$TARGET_DIR/.env" ]; then
    # Detect if we are in the Soverane Labs dev environment
    if [ -d "$HOME/workspace/runtime/data/lancedb" ]; then
        DB_PATH="$HOME/workspace/runtime/data/lancedb"
    else
        DB_PATH="./runtime/data/lancedb"
    fi
    
    cat > "$TARGET_DIR/.env" <<EOF
LANCEDB_URI=$DB_PATH
EMBEDDING_MODEL_TYPE=local
EMBEDDING_MODEL_NAME=Xenova/all-MiniLM-L6-v2
EOF
    echo -e "✅ Created .env with detected paths."
else
    echo -e "✅ Existing .env found. Preserving configuration."
fi

# 4. Dependency Substrate
echo -e "⚡ Initializing dependency substrate (npm install)..."
cd "$TARGET_DIR"
if command -v npm &> /dev/null; then
    npm install --quiet
else
    echo -e "${YELLOW}⚠️ npm not found. Please run 'npm install' in $TARGET_DIR manually.${NC}"
fi
cd "$PACKAGE_ROOT"

# 5. Ghost Protection (AGENTS.md)
echo -e "⚓ Applying Ghost Protection to AGENTS.md..."
if ! grep -q "YAMO-NATIVE" "$TARGET_DIR/AGENTS.md"; then
    printf "> [!IMPORTANT]\n> **YAMO-NATIVE KERNEL v3.0 ACTIVE**\n> Prioritize BOOTSTRAP.yamo for session initialization.\n\n" | cat - "$TARGET_DIR/AGENTS.md" > "$TARGET_DIR/AGENTS.md.tmp" && mv "$TARGET_DIR/AGENTS.md.tmp" "$TARGET_DIR/AGENTS.md"
    echo -e "✅ Kernel pointer injected."
else
    echo -e "✅ Ghost Protection already active."
fi

# 6. Final Status
echo -e "${GREEN}🚀 Singularity Upgrade Successful!${NC}"
echo -e "The agent is now autonomous. Refresh your session to activate."
