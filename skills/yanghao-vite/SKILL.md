# Vite - 前端构建工具

> **原始仓库**: `antfu/skills/vite`
> **安装量**: 5.5K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

Vite 构建工具配置、插件 API、SSR 和 Vite 8 Rolldown 迁移。在处理 Vite 项目、vite.config.ts、Vite 插件或使用 Vite 构建库/SSR 应用时使用。

---

## 📋 核心功能

| 主题 | 描述 |
|------|------|
| 配置 | `vite.config.ts`, `defineConfig`, 条件配置, `loadEnv` |
| 特性 | `import.meta.glob`, 资源查询 (`?raw`, `?url`), `import.meta.env`, HMR API |
| 插件 API | Vite 特定钩子, 虚拟模块, 插件顺序 |

---

## ⚡ CLI 命令

```bash
vite              # 启动开发服务器
vite build        # 生产构建
vite preview      # 预览生产构建
vite build --ssr  # SSR 构建
```

---

## 🔧 常用配置

```ts
import { defineConfig } from 'vite'

export default defineConfig({
  plugins: [],
  resolve: { alias: { '@': '/src' } },
  server: { port: 3000, proxy: { '/api': 'http://localhost:8080' } },
  build: { target: 'esnext', outDir: 'dist' },
})
```

---

## 📦 官方插件

- `@vitejs/plugin-vue` - Vue 3 SFC 支持
- `@vitejs/plugin-vue-jsx` - Vue 3 JSX
- `@vitejs/plugin-react` - React (Oxc/Babel)
- `@vitejs/plugin-react-swc` - React (SWC)
- `@vitejs/plugin-legacy` - 旧版浏览器支持

---

## 🚀 Vite 8 特性

> 基于 Vite 8 beta (Rolldown 驱动)。Vite 8 使用 Rolldown 打包器和 Oxc 转换器。

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [GitHub 仓库](https://github.com/antfu/skills)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
