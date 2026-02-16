# Remotion 最佳实践

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 91.7K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

Remotion 领域专业知识库。在处理 Remotion 代码时使用此技能以获取特定领域知识。

---

## 何时使用

凡是在处理 Remotion 代码时，都可以使用此技能来获取领域特定的专业知识。

---

## 核心功能模块

### 🎬 字幕处理
处理字幕或字幕文本时，加载以下文件了解更多信息：
- `rules/subtitles.md` - 字幕集成与显示

### 🎥 视频编辑
某些视频操作（如修剪视频或检测静音）应使用 FFmpeg。加载以下文件：
- `rules/ffmpeg.md` - FFmpeg 视频处理

### 📊 音频可视化
需要可视化音频（频谱条、波形、低音响应效果）时，加载：
- `rules/audio-visualization.md` - 音频可视化技术

---

## 主题规则索引

### 基础功能
- **[3D内容](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/3d.md)** - 使用 Three.js 和 React Three Fiber 创建 Remotion 中的 3D 内容

### 核心技能
- **[动画](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/animations.md)** - Remotion 的基础动画技能
- **[资源](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/assets.md)** - 将图像、视频、音频和字体导入 Remotion
- **[音频](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/audio.md)** - 在 Remotion 中使用音频和声音 - 导入、修剪、音量、速度、音高
- **[组件](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/compositions.md)** - 定义组件、静态图像、文件夹、默认 props 和动态元数据

### 文件处理
- **[提取帧](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/extract-frames.md)** - 使用 Mediabunny 从视频中在特定时间戳提取帧
- **[图像](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/images.md)** - 使用 Img 组件在 Remotion 中嵌入图像
- **[视频](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/videos.md)** - 在 Remotion 中嵌入视频 - 修剪、音量、速度、循环、音高

### 媒体属性
- **[获取音频时长](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/get-audio-duration.md)** - 使用 Mediabunny 获取音频文件的时长（秒）
- **[获取视频尺寸](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/get-video-dimensions.md)** - 使用 Mediabunny 获取视频文件的宽度和高度
- **[获取视频时长](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/get-video-duration.md)** - 使用 Mediabunny 获取视频文件的时长（秒）
- **[解码检测](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/can-decode.md)** - 使用 Mediabunny 检查视频是否可以被浏览器解码

### 设计与样式
- **[字体](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/fonts.md)** - 在 Remotion 中加载 Google 字体和本地字体
- **[Tailwind](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/tailwind.md)** - 在 Remotion 中使用 TailwindCSS
- **[文本动画](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/text-animations.md)** - Remotion 的排版和文本动画模式

### 动画效果
- **[时序](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/timing.md)** - Remotion 中的插值曲线 - 线性、缓动、弹簧动画
- **[过渡](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/transitions.md)** - Remotion 的场景过渡模式
- **[修剪](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/trimming.md)** - Remotion 的修剪模式 - 切割动画的开头或结尾

### 高级功能
- **[图表](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/charts.md)** - Remotion 的图表和数据可视化模式（条形、饼图、折线、股票图）
- **[GIFs](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/gifs.md)** - 显示与 Remotion 时间线同步的 GIF
- **[Lottie](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/lottie.md)** - 在 Remotion 中嵌入 Lottie 动画
- **[透明视频](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/transparent-videos.md)** - 渲染带有透明度的视频
- **[漏光效果](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/light-leaks.md)** - 使用 @remotion/light-leaks 创建漏光叠加效果

### 动态元数据
- **[计算元数据](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/calculate-metadata.md)** - 动态设置组件时长、尺寸和 props
- **[参数化](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/parameters.md)** - 通过添加 Zod schema 使视频可参数化

### 文本处理
- **[测量文本](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/measuring-text.md)** - 测量文本尺寸、使文本适应容器和检查溢出
- **[测量DOM节点](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/measuring-dom-nodes.md)** - 在 Remotion 中测量 DOM 元素的尺寸

### 序列编排
- **[序列化](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/sequencing.md)** - Remotion 的序列化模式 - 延迟、修剪、限制项目时长

### 地图与语音
- **[地图](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/maps.md)** - 使用 Mapbox 添加地图并为其制作动画
- **[画外音](https://github.com/remotion-dev/skills/blob/HEAD/skills/remotion/rules/voiceover.md)** - 使用 ElevenLabs TTS 向 Remotion 组件添加 AI 生成的画外音

---

## 如何使用

阅读各个规则文件以获取详细说明和代码示例。每个规则文件都包含：
- 主题的简要说明
- 代码示例和用法
- 最佳实践和注意事项
- 参考链接和资源

---

## 典型应用场景

- 创建动画视频和动态内容
- 数据可视化和图表动画
- 交互式演示和教程视频
- 社交媒体内容制作
- 产品宣传视频
- 教育和培训材料

---

*翻译搬运自 [skills.sh](https://github.com/yanghao1143/chiclaude-skills)*
