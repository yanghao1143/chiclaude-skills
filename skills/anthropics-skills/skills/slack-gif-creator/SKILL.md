# Slack GIF 创建器 (Slack GIF Creator)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 5.1K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

创建为 Slack 优化的动画 GIF 的知识和工具。

**适用场景**：用户请求为 Slack 创建动画 GIF。

---

## Slack 要求

### 尺寸
- Emoji GIFs: 128x128（推荐）
- 消息 GIFs: 480x480

### 参数
- FPS: 10-30（越低文件越小）
- 颜色: 48-128（越少越小）
- 时长: Emoji GIF 保持在 3 秒以下

---

## 核心工作流

```python
from core.gif_builder import GIFBuilder
from PIL import Image, ImageDraw

# 1. 创建构建器
builder = GIFBuilder(width=128, height=128, fps=10)

# 2. 生成帧
for i in range(12):
    frame = Image.new('RGB', (128, 128), (240, 248, 255))
    draw = ImageDraw.Draw(frame)
    # 绘制动画
    builder.add_frame(frame)

# 3. 保存并优化
builder.save('output.gif', num_colors=48, optimize_for_emoji=True)
```

---

## 动画概念

### 抖动/振动
使用 `math.sin()` 或 `math.cos()` 偏移位置

### 脉冲/心跳
使用正弦波缩放大小

### 弹跳
使用缓动函数实现落体效果

### 旋转
使用 `image.rotate()` 实现旋转

### 淡入/淡出
调整 alpha 通道

---

## 优化策略

1. **减少帧数** - 降低 FPS
2. **减少颜色** - num_colors=48
3. **缩小尺寸** - 128x128
4. **移除重复帧** - remove_duplicates=True
5. **Emoji 模式** - optimize_for_emoji=True

---

## 依赖

```bash
pip install pillow imageio numpy
```

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
