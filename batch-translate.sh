#!/bin/bash
# 批量翻译 SKILL.md 文件为中文
# 日期: 2026-02-16

SKILLS_DIR="$HOME/skills-mirror/skills"
LOG_FILE="$HOME/skills-mirror/translation.log"
TRANSLATED_COUNT=0
FAILED_COUNT=0

echo "=== 翻译开始 $(date) ===" | tee "$LOG_FILE"

# 获取所有 SKILL.md 文件
SKILL_FILES=$(find "$SKILLS_DIR" -name "SKILL.md" | sort)
TOTAL=$(echo "$SKILL_FILES" | wc -l)

echo "总计: $TOTAL 个技能文件" | tee -a "$LOG_FILE"

# 翻译函数
translate_skill() {
    local skill_file="$1"
    local skill_name=$(basename $(dirname "$skill_file"))

    # 检查是否已翻译（包含中文）
    if grep -qP '[\x{4e00}-\x{9fff}]' "$skill_file" 2>/dev/null; then
        echo "[SKIP] 已是中文: $skill_name"
        return 0
    fi

    echo "[TRANS] 正在翻译: $skill_name"

    # 读取原文
    local content=$(cat "$skill_file")

    # 使用 Claude API 翻译
    local translated=$(curl -s -X POST "https://api.anthropic.com/v1/messages" \
        -H "Content-Type: application/json" \
        -H "x-api-key: $ANTHROPIC_API_KEY" \
        -H "anthropic-version: 2023-06-01" \
        -d '{
            "model": "claude-sonnet-4-20250514",
            "max_tokens": 8192,
            "messages": [{
                "role": "user",
                "content": "你是专业的技术文档翻译专家。请将以下 AI Agent 技能文档翻译成中文。\n\n要求：\n1. 保持 Markdown 格式不变\n2. frontmatter 的 key 保持英文，value 翻译成中文\n3. 代码块内的注释翻译，代码不变\n4. 专业术语保留英文（如 MCP、API、React、Debugging、LLM 等）\n5. 在文件末尾添加：\\n\\n---\\n\\n*本技能来自 AI Agent 技能生态，由 AI论坛运营中心 汉化*\n\n原文：\n\n'"$content"'"
            }]
        }' 2>/dev/null)

    # 提取翻译结果
    local result=$(echo "$translated" | jq -r '.content[0].text' 2>/dev/null)

    if [ -n "$result" ] && [ "$result" != "null" ] && [ ${#result} -gt 100 ]; then
        # 备份原文
        cp "$skill_file" "${skill_file}.en.bak"

        # 写入翻译
        echo "$result" > "$skill_file"

        echo "[OK] $skill_name"
        return 0
    else
        echo "[FAIL] $skill_name - API 返回为空"
        return 1
    fi
}

# 批量处理
COUNT=0
for skill_file in $SKILL_FILES; do
    ((COUNT++))
    echo "" | tee -a "$LOG_FILE"
    echo "进度: $COUNT/$TOTAL" | tee -a "$LOG_FILE"

    if translate_skill "$skill_file"; then
        ((TRANSLATED_COUNT++))
    else
        ((FAILED_COUNT++))
    fi

    # 避免请求过快（每 3 个暂停一下）
    if [ $((COUNT % 3)) -eq 0 ]; then
        sleep 2
    fi
done

echo "" | tee -a "$LOG_FILE"
echo "=== 翻译完成 $(date) ===" | tee -a "$LOG_FILE"
echo "成功: $TRANSLATED_COUNT" | tee -a "$LOG_FILE"
echo "失败: $FAILED_COUNT" | tee -a "$LOG_FILE"
