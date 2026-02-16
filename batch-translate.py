#!/usr/bin/env python3
# 批量翻译 SKILL.md 文件为中文 - 使用可用模型
# 2026-02-16

import os
import re
import json
import time
import requests
from pathlib import Path

# 配置 - 使用可用模型
API_KEY = "sk-KwfZ1MFGt3K28O1Osjdd6WpN5fRJde3fUVzGIlUSIL50AYZf"
API_URL = "https://vip.chiddns.com/v1/chat/completions"
MODEL = "claude-sonnet-4-5-20250929"  # 或 gemini-2.5-flash
SKILLS_DIR = Path.home() / "skills-mirror" / "skills"
LOG_FILE = Path.home() / "skills-mirror" / "translation.log"

def has_chinese(text):
    """检查是否包含中文"""
    return bool(re.search(r'[\u4e00-\u9fff]', text))

def translate_content(content, skill_name):
    """调用 API 翻译内容"""
    prompt = f"""你是专业的技术文档翻译专家。请将以下 AI Agent 技能文档翻译成中文。

要求：
1. 保持 Markdown 格式不变
2. frontmatter 的 key 保持英文，value 翻译成中文
3. 代码块内的注释翻译，代码不变
4. 专业术语保留英文（如 MCP、API、React、Debugging、LLM、Claude、Agent 等）
5. 在文件末尾添加：

---

*本技能来自 AI Agent 技能生态，由 AI论坛运营中心 汉化*

原文：

{content}"""

    try:
        response = requests.post(
            API_URL,
            headers={
                "Content-Type": "application/json",
                "Authorization": f"Bearer {API_KEY}"
            },
            json={
                "model": MODEL,
                "messages": [{"role": "user", "content": prompt}],
                "temperature": 0.3,
                "max_tokens": 8192
            },
            timeout=180
        )

        if response.status_code == 200:
            result = response.json()
            translated = result.get("choices", [{}])[0].get("message", {}).get("content", "")
            if translated and len(translated) > 100:
                return translated
            else:
                print(f"  翻译结果为空")
                return None
        else:
            print(f"  API Error {response.status_code}: {response.text[:100]}")
            return None
    except Exception as e:
        print(f"  Exception: {e}")
        return None

def main():
    log = open(LOG_FILE, 'a', encoding='utf-8')
    log.write(f"\n=== 翻译开始 {time.strftime('%Y-%m-%d %H:%M:%S')} (模型: {MODEL}) ===\n")

    # 获取所有 SKILL.md 文件
    skill_files = sorted(SKILLS_DIR.rglob("SKILL.md"))
    total = len(skill_files)

    # 过滤出需要翻译的
    to_translate = []
    already_chinese = 0

    for f in skill_files:
        try:
            content = f.read_text(encoding='utf-8')
            if has_chinese(content):
                already_chinese += 1
            else:
                to_translate.append(f)
        except Exception as e:
            print(f"读取失败: {f}: {e}")

    print(f"总计: {total}")
    print(f"已翻译: {already_chinese}")
    print(f"待翻译: {len(to_translate)}")
    print(f"使用模型: {MODEL}")
    log.write(f"总计: {total}, 已翻译: {already_chinese}, 待翻译: {len(to_translate)}\n")

    # 批量翻译
    success = 0
    failed = 0

    for i, skill_file in enumerate(to_translate, 1):
        skill_name = skill_file.parent.name
        print(f"[{i}/{len(to_translate)}] {skill_name}...", end=" ", flush=True)

        try:
            content = skill_file.read_text(encoding='utf-8')
        except:
            print("❌ 无法读取")
            failed += 1
            continue

        translated = translate_content(content, skill_name)

        if translated:
            # 备份原文
            backup_file = skill_file.with_suffix('.md.en.bak')
            backup_file.write_text(content, encoding='utf-8')

            # 写入翻译
            skill_file.write_text(translated, encoding='utf-8')
            success += 1
            print(f"✅")
            log.write(f"[OK] {skill_name}\n")
        else:
            failed += 1
            print(f"❌")
            log.write(f"[FAIL] {skill_name}\n")

        # 避免请求过快
        time.sleep(1)

        # 每 20 个汇报进度
        if i % 20 == 0:
            print(f"\n--- 进度: {i}/{len(to_translate)}, 成功: {success}, 失败: {failed} ---\n")
            time.sleep(3)

    print(f"\n=== 完成 ===")
    print(f"成功: {success}")
    print(f"失败: {failed}")

    log.write(f"\n=== 完成 ===\n")
    log.write(f"成功: {success}, 失败: {failed}\n")
    log.close()

if __name__ == "__main__":
    main()
