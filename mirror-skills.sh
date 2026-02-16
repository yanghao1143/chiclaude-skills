#!/bin/bash
# Skills Mirror Script - 搬运 skills.sh 所有技能
# 日期: 2026-02-16

MIRROR_DIR="$HOME/skills-mirror"
SKILLS_DIR="$MIRROR_DIR/skills"
LOG_FILE="$MIRROR_DIR/mirror.log"

mkdir -p "$SKILLS_DIR"
echo "=== Skills Mirror Started at $(date) ===" > "$LOG_FILE"

# 技能列表 (从 skills.sh 抓取)
SKILLS=(
    "vercel-labs/skills"
    "vercel-labs/agent-skills"
    "vercel-labs/agent-browser"
    "vercel-labs/next-skills"
    "anthropics/skills"
    "anthropics/claude-plugins-official"
    "anthropics/knowledge-work-plugins"
    "remotion-dev/skills"
    "inference-sh-0/skills"
    "inference-sh-1/skills"
    "obra/superpowers"
    "coreyhaines31/marketingskills"
    "supabase/agent-skills"
    "better-auth/skills"
    "browser-use/browser-use"
    "nextlevelbuilder/ui-ux-pro-max-skill"
    "squirrelscan/skills"
    "google-labs-code/stitch-skills"
    "expo/skills"
    "wshobson/agents"
    "google-gemini/gemini-skills"
    "firecrawl/cli"
    "mastra-ai/skills"
    "tavily-ai/skills"
    "sveltejs/mcp"
    "analogjs/angular-skills"
    "nuxt/ui"
)

CLONED=0
FAILED=0

for repo in "${SKILLS[@]}"; do
    owner=$(echo "$repo" | cut -d'/' -f1)
    repo_name=$(echo "$repo" | cut -d'/' -f2)
    
    echo "Cloning $repo..."
    
    if [ -d "$SKILLS_DIR/$owner-$repo_name" ]; then
        echo "  [SKIP] Already exists: $owner-$repo_name" | tee -a "$LOG_FILE"
        continue
    fi
    
    if git clone --depth 1 "https://github.com/$repo.git" "$SKILLS_DIR/$owner-$repo_name" 2>> "$LOG_FILE"; then
        echo "  [OK] $repo" | tee -a "$LOG_FILE"
        ((CLONED++))
    else
        echo "  [FAIL] $repo" | tee -a "$LOG_FILE"
        ((FAILED++))
    fi
done

echo ""
echo "=== Summary ===" | tee -a "$LOG_FILE"
echo "Cloned: $CLONED" | tee -a "$LOG_FILE"
echo "Failed: $FAILED" | tee -a "$LOG_FILE"
echo "=== Skills Mirror Completed at $(date) ===" | tee -a "$LOG_FILE"
