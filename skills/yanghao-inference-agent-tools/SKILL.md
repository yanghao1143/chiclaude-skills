# 🔥 [No.019] Agent Tools - inference.sh

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 12.8K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

使用简单 CLI 在云端运行 150+ AI 应用。无需 GPU。

---

## 安装 CLI

```bash
curl -fsSL https://cli.inference.sh | sh
infsh login
```

---

## 快速示例

```bash
# 生成图片
infsh app run falai/flux-dev-lora --input '{"prompt": "a cat astronaut"}'

# 生成视频
infsh app run google/veo-3-1-fast --input '{"prompt": "drone over mountains"}'

# 调用 Claude
infsh app run openrouter/claude-sonnet-45 --input '{"prompt": "Explain quantum computing"}'

# 网页搜索
infsh app run tavily/search-assistant --input '{"query": "latest AI news"}'

# 发布推文
infsh app run x/post-tweet --input '{"text": "Hello from AI!"}'

# 生成 3D 模型
infsh app run infsh/rodin-3d-generator --input '{"prompt": "a wooden chair"}'
```

---

## 命令参考

| 任务 | 命令 |
|------|------|
| 列出所有应用 | infsh app list |
| 搜索应用 | infsh app list --search "flux" |
| 按类别筛选 | infsh app list --category image |
| 获取应用详情 | infsh app get google/veo-3-1-fast |
| 生成示例输入 | infsh app sample google/veo-3-1-fast --save input.json |
| 运行应用 | infsh app run google/veo-3-1-fast --input input.json |
| 不等待运行 | infsh app run <app> --input input.json --no-wait |
| 检查任务状态 | infsh task get <task-id> |

---

## 可用类别

| 类别 | 示例 |
|------|------|
| 图片 | FLUX, Gemini 3 Pro, Grok Imagine, Seedream 4.5, Reve, Topaz Upscaler |
| 视频 | Veo 3.1, Seedance 1.5, Wan 2.5, OmniHuman, Fabric, HunyuanVideo Foley |
| LLM | Claude Opus/Sonnet/Haiku, Gemini 3 Pro, Kimi K2, GLM-4, 任何 OpenRouter 模型 |
| 搜索 | Tavily Search, Tavily Extract, Exa Search, Exa Answer, Exa Extract |
| 3D | Rodin 3D Generator |
| Twitter/X | post-tweet, post-create, dm-send, user-follow, post-like, post-retweet |
| 工具 | 媒体合并、视频字幕、图片拼接、音频提取 |

---

## 相关技能

```bash
# 图片生成 (FLUX, Gemini, Grok, Seedream)
npx skills add inference-sh/skills@ai-image-generation

# 视频生成 (Veo, Seedance, Wan, OmniHuman)
npx skills add inference-sh/skills@ai-video-generation

# LLM (Claude, Gemini, Kimi, GLM via OpenRouter)
npx skills add inference-sh/skills@llm-models

# 网页搜索 (Tavily, Exa)
npx skills add inference-sh/skills@web-search

# AI 虚拟人与口型同步 (OmniHuman, Fabric, PixVerse)
npx skills add inference-sh/skills@ai-avatar-video

# Twitter/X 自动化
npx skills add inference-sh/skills@twitter-automation

# 模型特定
npx skills add inference-sh/skills@flux-image
npx skills add inference-sh/skills@google-veo

# 工具
npx skills add inference-sh/skills@image-upscaling
npx skills add inference-sh/skills@background-removal
```

---

## 参考文件

- 认证与设置
- 发现应用
- 运行应用
- CLI 参考

---

## 文档

- Agent Skills 概览 - AI 能力的开放标准
- 入门指南 - inference.sh 简介
- 什么是 inference.sh？ - 平台概述
- 应用概览 - 理解应用生态
- CLI 设置 - 安装 CLI
- Workflows vs Agents - 何时使用每种
- 为什么 Agent 运行时重要 - 运行时优势

---

📌 *Skills市场搬运计划 - 热门技能系列 - No.019*
