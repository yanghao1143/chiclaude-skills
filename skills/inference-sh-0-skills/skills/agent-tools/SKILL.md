# 🔥 [No.020] Agent Tools - AI工具集

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 12.1K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

通过 inference.sh CLI 运行 150+ AI 应用 - 图像生成、视频创建、LLM、搜索、3D、Twitter 自动化。支持模型：FLUX、Veo、Gemini、Grok、Claude、Seedance、OmniHuman、Tavily、Exa、OpenRouter 等。

---

## 安装 CLI

```bash
curl -fsSL https://cli.inference.sh | sh
infsh login
```

---

## 快速示例

```bash
# 生成图像
infsh app run falai/flux-dev-lora --input '{"prompt": "a cat astronaut"}'

# 生成视频
infsh app run google/veo-3-1-fast --input '{"prompt": "drone over mountains"}'

# 调用 Claude
infsh app run openrouter/claude-sonnet-45 --input '{"prompt": "Explain quantum computing"}'

# 网络搜索
infsh app run tavily/search-assistant --input '{"query": "latest AI news"}'

# 发布到 Twitter
infsh app run x/post-tweet --input '{"text": "Hello from AI!"}'

# 生成 3D 模型
infsh app run infsh/rodin-3d-generator --input '{"prompt": "a wooden chair"}'
```

---

## 命令参考

| 任务 | 命令 |
|------|------|
| 列出所有应用 | `infsh app list` |
| 搜索应用 | `infsh app list --search "flux"` |
| 按类别过滤 | `infsh app list --category image` |
| 获取应用详情 | `infsh app get google/veo-3-1-fast` |
| 生成示例输入 | `infsh app sample google/veo-3-1-fast --save input.json` |
| 运行应用 | `infsh app run google/veo-3-1-fast --input input.json` |
| 不等待运行 | `infsh app run <app> --input input.json --no-wait` |
| 检查任务状态 | `infsh task get <task-id>` |

---

## 可用功能

| 类别 | 示例 |
|------|------|
| **图像** | FLUX, Gemini 3 Pro, Grok Imagine, Seedream 4.5, Reve, Topaz Upscaler |
| **视频** | Veo 3.1, Seedance 1.5, Wan 2.5, OmniHuman, Fabric, HunyuanVideo Foley |
| **LLM** | Claude Opus/Sonnet/Haiku, Gemini 3 Pro, Kimi K2, GLM-4, OpenRouter 模型 |
| **搜索** | Tavily Search, Tavily Extract, Exa Search, Exa Answer, Exa Extract |
| **3D** | Rodin 3D Generator |
| **Twitter/X** | post-tweet, post-create, dm-send, user-follow, post-like, post-retweet |
| **工具** | 媒体合并、视频字幕、图像拼接、音频提取 |

---

## 相关技能

```bash
# 图像生成 (FLUX, Gemini, Grok, Seedream)
npx skills add inference-sh/skills@ai-image-generation

# 视频生成 (Veo, Seedance, Wan, OmniHuman)
npx skills add inference-sh/skills@ai-video-generation

# LLM (Claude, Gemini, Kimi, GLM via OpenRouter)
npx skills add inference-sh/skills@llm-models

# 网络搜索 (Tavily, Exa)
npx skills add inference-sh/skills@web-search

# AI 头像 & 口型同步 (OmniHuman, Fabric, PixVerse)
npx skills add inference-sh/skills@ai-avatar-video

# Twitter/X 自动化
npx skills add inference-sh/skills@twitter-automation

# 特定模型
npx skills add inference-sh/skills@flux-image
npx skills add inference-sh/skills@google-veo

# 工具
npx skills add inference-sh/skills@image-upscaling
npx skills add inference-sh/skills@background-removal
```

---

## 安全注意事项

⚠️ **重要提示：**
- 不要在代码中硬编码 API 密钥
- 使用环境变量存储凭证
- 遵守目标平台的使用条款
- 控制请求频率，避免滥用

---

## 典型应用场景

- 🎨 AI 图像生成
- 🎬 AI 视频创建
- 🔍 网络搜索和数据提取
- 🤖 LLM 调用
- 📱 社交媒体自动化
- 🎮 3D 模型生成

---

*翻译搬运自 [skills.sh](https://github.com/yanghao1143/chiclaude-skills)*

📌 *Skills市场搬运计划 - 热门技能系列 - No.020*
