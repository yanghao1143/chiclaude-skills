# VitePress 文档站 - Static Site Generator

> **原始仓库**: `antfu/skills/vitepress`
> **安装量**: 3.1K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

VitePress 是 Vue 驱动的静态站点生成器，专为技术文档设计。基于 Vite 构建，提供极致的开发体验和快速的构建速度。

---

## 🎯 何时使用此技能

当用户进行以下工作时使用：

- 构建文档站点
- 创建技术博客
- Vue 驱动的静态站点
- Markdown 内容管理

---

## 🚀 快速入门

### 安装

```bash
pnpm add -D vitepress
```

### 初始化

```bash
npx vitepress init
```

### 开发命令

```bash
# 启动开发服务器
pnpm docs:dev

# 构建
pnpm docs:build

# 预览
pnpm docs:preview
```

---

## 📁 目录结构

```
docs/
├── .vitepress/
│   ├── config.ts      # 配置文件
│   ├── theme/         # 主题定制
│   └── cache/         # 缓存
├── public/            # 静态资源
├── index.md           # 首页
├── guide/
│   ├── index.md
│   └── getting-started.md
└── api/
    └── index.md
```

---

## ⚙️ 配置

```typescript
// .vitepress/config.ts
import { defineConfig } from 'vitepress'

export default defineConfig({
  title: '我的文档',
  description: '项目描述',
  
  // 主题配置
  themeConfig: {
    logo: '/logo.svg',
    nav: [
      { text: '指南', link: '/guide/' },
      { text: 'API', link: '/api/' },
    ],
    sidebar: {
      '/guide/': [
        {
          text: '开始',
          items: [
            { text: '介绍', link: '/guide/' },
            { text: '快速开始', link: '/guide/getting-started' },
          ]
        }
      ]
    },
    socialLinks: [
      { icon: 'github', link: 'https://github.com/...' }
    ],
    search: {
      provider: 'local'
    }
  },
  
  // Markdown 配置
  markdown: {
    lineNumbers: true
  }
})
```

---

## 📝 Markdown 扩展

### Frontmatter

```yaml
---
title: 页面标题
description: 页面描述
layout: doc
---
```

### 自定义容器

```markdown
::: tip 提示
这是一个提示信息
:::

::: warning 警告
这是一个警告信息
:::

::: danger 危险
这是一个危险警告
:::

::: details 点击展开
隐藏的内容
:::
```

### 代码组

```markdown
::: code-group

```bash
pnpm install
```

```bash
npm install
```

```bash
yarn install
```

:::
```

### 在 Markdown 中使用 Vue

```vue
<script setup>
import { ref } from 'vue'

const count = ref(0)
</script>

# 标题

当前计数：{{ count }}

<button @click="count++">增加</button>
```

---

## 🎨 主题定制

### 自定义主题

```typescript
// .vitepress/theme/index.ts
import DefaultTheme from 'vitepress/theme'
import './custom.css'

export default {
  extends: DefaultTheme,
  enhanceApp({ app }) {
    // 注册全局组件
    app.component('MyComponent', MyComponent)
  }
}
```

### 自定义 CSS

```css
/* .vitepress/theme/custom.css */
:root {
  --vp-c-brand-1: #2563eb;
  --vp-c-brand-2: #1d4ed8;
  --vp-c-brand-3: #1e40af;
}

/* 深色模式 */
.dark {
  --vp-c-brand-1: #3b82f6;
}
```

---

## 🔍 搜索

### 本地搜索

```typescript
export default defineConfig({
  themeConfig: {
    search: {
      provider: 'local'
    }
  }
})
```

### Algolia 搜索

```typescript
export default defineConfig({
  themeConfig: {
    search: {
      provider: 'algolia',
      options: {
        appId: '...',
        apiKey: '...',
        indexName: '...'
      }
    }
  }
})
```

---

## 🚀 部署

### GitHub Pages

```yaml
# .github/workflows/deploy.yml
name: Deploy VitePress site to Pages

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v2
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: pnpm
      - run: pnpm install
      - run: pnpm docs:build
      - uses: actions/upload-pages-artifact@v3
        with:
          path: docs/.vitepress/dist

  deploy:
    needs: build
    runs-on: ubuntu-latest
    permissions:
      pages: write
      id-token: write
    steps:
      - uses: actions/deploy-pages@v4
```

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [VitePress 官方文档](https://vitepress.dev)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
