# UnoCSS 原子 CSS - Instant Atomic CSS

> **原始仓库**: `antfu/skills/unocss`
> **安装量**: 2.8K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

UnoCSS 是即时原子 CSS 引擎，设计灵活且可扩展。核心是无预设的 - 所有 CSS 工具类通过预设提供。它是 Tailwind CSS 的超集，可以复用 Tailwind 知识。

---

## 🎯 何时使用此技能

当用户进行以下工作时使用：

- 配置 UnoCSS
- 编写工具类规则
- 创建快捷方式
- 使用预设（Wind、Icons、Attributify）

---

## 🚀 快速入门

### 安装

```bash
pnpm add -D unocss
```

### 配置

```typescript
// uno.config.ts
import { defineConfig, presetUno, presetAttributify, presetIcons } from 'unocss'

export default defineConfig({
  presets: [
    presetUno(),           // Tailwind 兼容
    presetAttributify(),   // 属性化模式
    presetIcons(),         // 图标
  ],
})
```

### Vite 集成

```typescript
// vite.config.ts
import UnoCSS from 'unocss/vite'

export default defineConfig({
  plugins: [
    UnoCSS(),
  ],
})
```

---

## 🎨 基本用法

### 工具类

```html
<!-- 类似 Tailwind -->
<div class="flex items-center justify-center p-4 bg-blue-500 text-white">
  内容
</div>

<!-- 任意值 -->
<div class="w-[100px] h-[50px] bg-[#ff0000]">
  自定义尺寸和颜色
</div>
```

### 属性化模式

```html
<!-- 使用属性而不是 class -->
<div 
  flex="~ items-center justify-center"
  p="4"
  bg="blue-500"
  text="white"
>
  属性化模式
</div>
```

---

## 🔧 自定义规则

### 静态规则

```typescript
// uno.config.ts
export default defineConfig({
  rules: [
    ['m-1', { margin: '0.25rem' }],
    ['p-1', { padding: '0.25rem' }],
  ],
})
```

### 动态规则

```typescript
export default defineConfig({
  rules: [
    // m-{数值}
    [/^m-(\d+)$/, ([, d]) => ({ margin: `${d}px` })],
    
    // text-{颜色}
    [/^text-(.+)$/, ([, c]) => ({ color: c })],
  ],
})
```

---

## ⚡ 快捷方式

```typescript
export default defineConfig({
  shortcuts: {
    // 组合多个类
    'btn': 'px-4 py-2 rounded bg-blue-500 text-white hover:bg-blue-600',
    'btn-primary': 'btn bg-primary-500 hover:bg-primary-600',
    'btn-secondary': 'btn bg-gray-500 hover:bg-gray-600',
    
    // 动态快捷方式
    'btn-lg': 'btn px-6 py-3 text-lg',
  },
})
```

使用：

```html
<button class="btn">默认按钮</button>
<button class="btn-primary">主要按钮</button>
<button class="btn-lg btn-primary">大按钮</button>
```

---

## 🎭 图标

### 使用 presetIcons

```typescript
// uno.config.ts
import { defineConfig, presetIcons } from 'unocss'

export default defineConfig({
  presets: [
    presetIcons({
      scale: 1.2,
      cdn: 'https://esm.sh/',
    }),
  ],
})
```

### 图标用法

```html
<!-- Iconify 图标 -->
<div class="i-carbon-logo-github"></div>
<div class="i-mdi-home text-2xl"></div>

<!-- 颜色 -->
<div class="i-carbon-logo-twitter text-blue-500"></div>
```

---

## 🎨 主题配置

```typescript
export default defineConfig({
  theme: {
    colors: {
      primary: {
        50: '#f0f9ff',
        100: '#e0f2fe',
        500: '#0ea5e9',
        900: '#0c4a6e',
      },
    },
    breakpoints: {
      sm: '640px',
      md: '768px',
      lg: '1024px',
      xl: '1280px',
    },
  },
})
```

---

## 🔌 预设

### presetUno (推荐)

```typescript
import { presetUno } from 'unocss'

// Tailwind CSS 兼容
presetUno()
```

### presetWind3

```typescript
import { presetWind3 } from 'unocss'

// Tailwind CSS v3 / Windi CSS 兼容
presetWind3()
```

### presetTypography

```typescript
import { presetTypography } from 'unocss'

// 排版类
presetTypography()
```

用法：

```html
<article class="prose">
  <h1>标题</h1>
  <p>段落内容...</p>
</article>
```

---

## 🔄 变体

```html
<!-- 状态变体 -->
<button class="hover:bg-blue-600 active:bg-blue-700">
  悬停和激活
</button>

<!-- 响应式 -->
<div class="sm:text-lg md:text-xl lg:text-2xl">
  响应式文本
</div>

<!-- 深色模式 -->
<div class="bg-white dark:bg-gray-900">
  自动深色模式
</div>

<!-- 分组 -->
<div class="group">
  <span class="group-hover:text-red-500">分组悬停</span>
</div>
```

---

## 🛡️ 安全列表

```typescript
export default defineConfig({
  safelist: [
    // 总是包含的类
    'bg-red-500',
    'text-white',
    
    // 动态生成的类
    ...['red', 'blue', 'green'].map(c => `bg-${c}-500`),
  ],
})
```

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [GitHub 仓库](https://github.com/unocss/unocss)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
