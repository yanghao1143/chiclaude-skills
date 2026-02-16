# 🔥 [No.011] AI Image Generation - AI 图片生成

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 5.8K (24h)
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

通过 [inference.sh](https://inference.sh) CLI 使用 50+ AI 模型生成图片。

---

## 快速开始

```bash
# 安装 CLI
curl -fsSL https://cli.inference.sh | sh && infsh login

# 使用 FLUX 生成图片
infsh app run falai/flux-dev-lora --input '{"prompt": "a cat astronaut in space"}'
```

---

## 可用模型

| 模型 | App ID | 最佳用途 |
|------|--------|----------|
| **FLUX Dev LoRA** | `falai/flux-dev-lora` | 高质量自定义风格 |
| **FLUX.2 Klein LoRA** | `falai/flux-2-klein-lora` | 快速生成支持 LoRA (4B/9B) |
| **Gemini 3 Pro** | `google/gemini-3-pro-image-preview` | Google 最新模型 |
| **Gemini 2.5 Flash** | `google/gemini-2-5-flash-image` | 快速 Google 模型 |
| **Grok Imagine** | `xai/grok-imagine-image` | xAI 模型，多种宽高比 |
| **Seedream 4.5** | `bytedance/seedream-4-5` | 2K-4K 电影级质量 |
| **Seedream 4.0** | `bytedance/seedream-4-0` | 高质量 2K-4K |
| **Seedream 3.0** | `bytedance/seedream-3-0-t2i` | 精准文字渲染 |
| **Reve** | `falai/reve` | 自然语言编辑、文字渲染 |
| **ImagineArt 1.5 Pro** | `falai/imagine-art-1-5-pro-preview` | 超高保真 4K |
| **Topaz Upscaler** | `falai/topaz-image-upscaler` | 专业图片放大 |

---

## 浏览所有图片应用

```bash
infsh app list --category image
```

---

## 示例

### 文字生成图片 (FLUX)

```bash
infsh app run falai/flux-dev-lora --input '{
  "prompt": "professional product photo of a coffee mug, studio lighting"
}'
```

### 快速生成 (FLUX Klein)

```bash
infsh app run falai/flux-2-klein-lora --input '{"prompt": "sunset over mountains"}'
```

### Google Gemini 3 Pro

```bash
infsh app run google/gemini-3-pro-image-preview --input '{
  "prompt": "photorealistic landscape with mountains and lake"
}'
```

### Grok Imagine

```bash
infsh app run xai/grok-imagine-image --input '{
  "prompt": "cyberpunk city at night",
  "aspect_ratio": "16:9"
}'
```

### Reve (带文字渲染)

```bash
infsh app run falai/reve --input '{
  "prompt": "A poster that says HELLO WORLD in bold letters"
}'
```

### Seedream 4.5 (4K 质量)

```bash
infsh app run bytedance/seedream-4-5 --input '{
  "prompt": "cinematic portrait of a woman, golden hour lighting"
}'
```

### 图片放大

```bash
infsh app run falai/topaz-image-upscaler --input '{"image_url": "https://..."}'
```

### 拼接多张图片

```bash
infsh app run infsh/stitch-images --input '{
  "images": ["https://img1.jpg", "https://img2.jpg"],
  "direction": "horizontal"
}'
```

---

## 相关技能

```bash
# 完整平台技能 (150+ 应用)
npx skills add inference-sh/skills@inference-sh

# FLUX 专用技能
npx skills add inference-sh/skills@flux-image

# 图片放大与增强
npx skills add inference-sh/skills@image-upscaling

# 背景移除
npx skills add inference-sh/skills@background-removal

# 视频生成
npx skills add inference-sh/skills@ai-video-generation

# AI 头像视频
npx skills add inference-sh/skills@ai-avatar-video
```

---

## 文档

- [运行应用](https://inference.sh/docs/apps/running) - 如何通过 CLI 运行应用
- [图片生成示例](https://inference.sh/docs/examples/image-generation) - 完整图片生成指南
- [应用概述](https://inference.sh/docs/apps/overview) - 了解应用生态系统

---

*翻译搬运自 [skills.sh](https://github.com/yanghao1143/chiclaude-skills)*

📌 *Skills市场搬运计划 - 热门技能系列 - No.011*
