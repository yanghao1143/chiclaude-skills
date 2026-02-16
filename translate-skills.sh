#!/bin/bash
# 批量翻译 SKILL.md 文件为中文
# 日期: 2026-02-16

SKILLS_DIR="$HOME/skills-mirror/skills"
LOG_FILE="$HOME/skills-mirror/translate.log"
API_URL="https://vip.chiddns.com/v1/chat/completions"
API_KEY="sk-KwfZ1MFGt3K28O1Osjdd6WpN5fRJde3fUVzGIlUSIL50AYZf"

echo "=== 翻译开始 $(date) ===" > "$LOG_FILE"

# 统计
TOTAL=0
TRANSLATED=0

# 遍历所有 SKILL.md 文件
find "$SKILLS_DIR" -name "SKILL.md" | while read -r skill_file; do
    ((TOTAL++))
    
    # 跳过已翻译的（检查是否有中文字符）
    if grep -q '[\u4e00-\u9fff]' "$skill_file" 2>/dev/null; then
        echo "[SKIP] 已翻译: $skill_file" >> "$LOG_FILE"
        continue
    fi
    
    echo "[TRANSLATING] $skill_file"
    echo "Translating: $skill_file" >> "$LOG_FILE"
    
    # 读取原文
    ORIGINAL_CONTENT=$(cat "$skill_file")
    
    # 调用翻译 API
    TRANSLATED_CONTENT=$(curl -s -X POST "$API_URL" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $API_KEY" \
        -d '{
            "model": "gpt-4o-mini",
            "messages": [
                {
                    "role": "system",
                    "content": "你是专业的技术文档翻译专家。请将以下 AI Agent 技能文档翻译成中文。要求：1. 保持 Markdown 格式不变 2. 保持 frontmatter (---之间的内容) 的 key 为英文，value 翻译成中文 3. 代码块内的注释翻译，代码不变 4. 专业术语保留英文原文（如 MCP、API、React 等）5. 在文件末尾添加一行：\\n\\n---\\n\\n*本技能来自 AI Agent 技能生态，由 AI论坛运营中心 汉化*"
                },
                {
                    "role": "user",
                    "content": "'"$ORIGINAL_CONTENT"'"
                }
            ],
            "temperature": 0.3,
            "max_tokens": 8000
        }' 2>/dev/null | jq -r '.choices[0].message.content' 2>/dev/null)
    
    if [ -n "$TRANSLATED_CONTENT" ] && [ "$TRANSLATED_CONTENT" != "null" ]; then
        # 备份原文
        cp "$skill_file" "${skill_file}.en.bak"
        
        # 写入翻译后的内容
        echo "$TRANSLATED_CONTENT" > "$skill_file"
        
        echo "[OK] $skill_file" >> "$LOG_FILE"
        ((TRANSLATED++))
    else
        echo "[FAIL] $skill_file" >> "$LOG_FILE"
    fi
    
    # 避免请求过快
    sleep 0.5
done

echo "" >> "$LOG_FILE"
echo "=== 翻译完成 $(date) ===" >> "$LOG_FILE"
echo "总计: $TOTAL, 成功: $TRANSLATED" >> "$LOG_FILE"

echo "翻译完成！总计: $TOTAL, 成功: $TRANSLATED"
