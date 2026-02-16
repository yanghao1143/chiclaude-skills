# 🔥 [No.012] AI Video Generation - AI 视频生成

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 5.2K (24h)
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

通过 [inference.sh](https://inference.sh) CLI 使用 40+ AI 模型生成视频。

---

## 快速开始

```bash
# 安装 CLI
curl -fsSL https://cli.inference.sh | sh && infsh login

# 使用 Veo 生成视频
infsh app run google/veo-3-1-fast --input '{"prompt": "drone shot flying over a forest"}'
```

---

## 可用模型

### 文字生成视频

| 模型 | App ID | 最佳用途 |
|------|--------|----------|
| **Veo 3.1 Fast** | `google/veo-3-1-fast` | 快速生成，可选音频 |
| **Veo 3.1** | `google/veo-3-1` | 最佳质量，帧插值 |
| **Veo 3** | `google/veo-3` | 高质量带音频 |
| **Veo 3 Fast** | `google/veo-3-fast` | 快速带音频 |
| **Veo 2** | `google/veo-2` | 逼真视频 |
| **Grok Video** | `xai/grok-imagine-video` | xAI，可配置时长 |
| **Seedance 1.5 Pro** | `bytedance/seedance-1-5-pro` | 带首帧控制 |
| **Seedance 1.0 Pro** | `bytedance/seedance-1-0-pro` | 最高 1080p |

### 图片生成视频

| 模型 | App ID | 最佳用途 |
|------|--------|----------|
| **Wan 2.5** | `falai/wan-2-5` | 让任何图片动起来 |
| **Wan 2.5 I2V** | `falai/wan-2-5-i2v` | 高质量图生视频 |
| **Seedance Lite** | `bytedance/seedance-1-0-lite` | 轻量级 720p |

### 头像 / 口型同步

| 模型 | App ID | 最佳用途 |
|------|--------|----------|
| **OmniHuman 1.5** | `bytedance/omnihuman-1-5` | 多角色 |
| **OmniHuman 1.0** | `bytedance/omnihuman-1-0` | 单角色 |
| **Fabric 1.0** | `falai/fabric-1-0` | 图片说话口型同步 |
| **PixVerse Lipsync** | `falai/pixverse-lipsync` | 逼真口型同步 |

### 工具

| 工具 | App ID | 描述 |
|------|--------|------|
| **HunyuanVideo Foley** | `infsh/hunyuanvideo-foley` | 为视频添加音效 |
| **Topaz Upscaler** | `falai/topaz-video-upscaler` | 提升视频质量 |
| **Media Merger** | `infsh/media-merger` | 合并视频带转场 |

---

## 浏览所有视频应用

```bash
infsh app list --category video
```

---

## 示例

### 文字生成视频 (Veo)

```bash
infsh app run google/veo-3-1-fast --input '{
  "prompt": "A timelapse of a flower blooming in a garden"
}'
```

### Grok Video

```bash
infsh app run xai/grok-imagine-video --input '{
  "prompt": "Waves crashing on a beach at sunset",
  "duration": 5
}'
```

### 图片生成视频 (Wan 2.5)

```bash
infsh app run falai/wan-2-5 --input '{
  "image_url": "https://your-image.jpg"
}'
```

### AI 头像 / 说话头像

```bash
infsh app run bytedance/omnihuman-1-5 --input '{
  "image_url": "https://portrait.jpg",
  "audio_url": "https://speech.mp3"
}'
```

### Fabric 口型同步

```bash
infsh app run falai/fabric-1-0 --input '{
  "image_url": "https://face.jpg",
  "audio_url": "https://audio.mp3"
}'
```

### PixVerse 口型同步

```bash
infsh app run falai/pixverse-lipsync --input '{
  "image_url": "https://portrait.jpg",
  "audio_url": "https://speech.mp3"
}'
```

### 视频放大

```bash
infsh app run falai/topaz-video-upscaler --input '{"video_url": "https://..."}'
```

### 添加音效 (Foley)

```bash
infsh app run infsh/hunyuanvideo-foley --input '{
  "video_url": "https://silent-video.mp4",
  "prompt": "footsteps on gravel, birds chirping"
}'
```

### 合并视频

```bash
infsh app run infsh/media-merger --input '{
  "videos": ["https://clip1.mp4", "https://clip2.mp4"],
  "transition": "fade"
}'
```

---

## 相关技能

```bash
# 完整平台技能 (150+ 应用)
npx skills add inference-sh/skills@inference-sh

# Google Veo 专用
npx skills add inference-sh/skills@google-veo

# AI 头像与口型同步
npx skills add inference-sh/skills@ai-avatar-video

# 文字转语音 (视频旁白)
npx skills add inference-sh/skills@text-to-speech

# 图片生成 (图生视频)
npx skills add inference-sh/skills@ai-image-generation

# Twitter (发布视频)
npx skills add inference-sh/skills@twitter-automation
```

---

## 文档

- [运行应用](https://inference.sh/docs/apps/running) - 如何通过 CLI 运行应用
- [流式结果](https://inference.sh/docs/api/sdk/streaming) - 实时进度更新
- [内容管道示例](https://inference.sh/docs/examples/content-pipeline) - 构建媒体工作流

---

*翻译搬运自 [skills.sh](https://github.com/yanghao1143/chiclaude-skills)*

📌 *Skills市场搬运计划 - 热门技能系列 - No.012*
