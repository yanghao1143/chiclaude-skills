# 响应式设计 - Responsive Design

> **原始仓库**: `wshobson/agents/responsive-design`
> **安装量**: 3.2K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

响应式 Web 设计最佳实践，包括移动优先设计、断点策略、弹性布局和响应式图片处理。

---

## 🎯 何时使用此技能

当用户进行以下工作时使用：

- 设计响应式布局
- 移动端适配
- 多设备兼容
- 响应式组件开发

---

## 📱 移动优先原则

```css
/* 基础样式 - 移动端 */
.container {
  padding: 16px;
  font-size: 14px;
}

/* 平板及以上 */
@media (min-width: 768px) {
  .container {
    padding: 24px;
    font-size: 16px;
  }
}

/* 桌面 */
@media (min-width: 1024px) {
  .container {
    padding: 32px;
    font-size: 18px;
  }
}
```

---

## 📐 断点系统

### 常用断点

| 名称 | 断点 | 设备 |
|------|------|------|
| xs | < 640px | 手机 |
| sm | ≥ 640px | 大屏手机 |
| md | ≥ 768px | 平板 |
| lg | ≥ 1024px | 笔记本 |
| xl | ≥ 1280px | 桌面 |
| 2xl | ≥ 1536px | 大屏 |

### CSS 变量

```css
:root {
  --breakpoint-sm: 640px;
  --breakpoint-md: 768px;
  --breakpoint-lg: 1024px;
  --breakpoint-xl: 1280px;
}
```

---

## 🔄 弹性布局

### Flexbox

```css
.flex-container {
  display: flex;
  flex-wrap: wrap;
  gap: 16px;
}

.flex-item {
  flex: 1 1 300px; /* 基础宽度 300px，可伸缩 */
}
```

### Grid

```css
.grid-container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 24px;
}
```

---

## 🖼️ 响应式图片

```html
<picture>
  <source media="(min-width: 1024px)" srcset="image-large.webp">
  <source media="(min-width: 768px)" srcset="image-medium.webp">
  <img src="image-small.webp" alt="响应式图片" loading="lazy">
</picture>
```

### CSS 背景图片

```css
.hero {
  background-image: url('image-small.jpg');
}

@media (min-width: 768px) {
  .hero {
    background-image: url('image-medium.jpg');
  }
}

@media (min-width: 1024px) {
  .hero {
    background-image: url('image-large.jpg');
  }
}
```

---

## 📝 响应式文字

```css
html {
  font-size: 16px;
}

@media (min-width: 768px) {
  html {
    font-size: 18px;
  }
}

/* 流体排版 */
h1 {
  font-size: clamp(1.5rem, 5vw, 3rem);
}
```

---

## ✅ 最佳实践

1. **移动优先** - 从小屏幕开始设计
2. **流式布局** - 避免固定宽度
3. **触摸友好** - 按钮至少 44x44px
4. **性能优化** - 移动端减少资源
5. **测试多设备** - 在真实设备上测试

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
