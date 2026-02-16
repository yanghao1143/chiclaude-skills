# Next.js 最佳实践

> **原始仓库**: `vercel-labs/next-skills/next-best-practices`
> **安装量**: 12.4K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

在编写或审查 Next.js 代码时应用这些规则。

---

## 📁 文件约定

参见 [file-conventions.md](https://github.com/vercel-labs/next-skills/blob/HEAD/skills/next-best-practices/file-conventions.md) 了解：

- 项目结构和特殊文件
- 路由段（动态、捕获所有、分组）
- 并行和拦截路由
- v16 中的中间件重命名（middleware → proxy）

---

## 🔄 RSC 边界

检测无效的 React Server Component 模式。

参见 [rsc-boundaries.md](https://github.com/vercel-labs/next-skills/blob/HEAD/skills/next-best-practices/rsc-boundaries.md) 了解：

- 异步客户端组件检测（无效）
- 不可序列化 props 检测
- Server Action 异常

---

## ⏡ 异步模式

Next.js 15+ 异步 API 变更。

参见 [async-patterns.md](https://github.com/vercel-labs/next-skills/blob/HEAD/skills/next-best-practices/async-patterns.md) 了解：

- 异步 params 和 searchParams
- 异步 cookies() 和 headers()
- 迁移代码修改

---

## 🖥️ 运行时选择

参见 [runtime-selection.md](https://github.com/vercel-labs/next-skills/blob/HEAD/skills/next-best-practices/runtime-selection.md) 了解：

- 默认使用 Node.js 运行时
- 何时使用 Edge 运行时

---

## 📝 指令

参见 [directives.md](https://github.com/vercel-labs/next-skills/blob/HEAD/skills/next-best-practices/directives.md) 了解：

- 'use client', 'use server' (React)
- 'use cache' (Next.js)

---

## 🔧 函数

参见 [functions.md](https://github.com/vercel-labs/next-skills/blob/HEAD/skills/next-best-practices/functions.md) 了解：

- 导航钩子: useRouter, usePathname, useSearchParams, useParams
- 服务端函数: cookies, headers, draftMode, after
- 生成函数: generateStaticParams, generateMetadata

---

## ❌ 错误处理

参见 [error-handling.md](https://github.com/vercel-labs/next-skills/blob/HEAD/skills/next-best-practices/error-handling.md) 了解：

- error.tsx, global-error.tsx, not-found.tsx
- redirect, permanentRedirect, notFound
- forbidden, unauthorized (认证错误)
- unstable_rethrow 用于 catch 块

---

## 📊 数据模式

参见 [data-patterns.md](https://github.com/vercel-labs/next-skills/blob/HEAD/skills/next-best-practices/data-patterns.md) 了解：

- Server Components vs Server Actions vs Route Handlers
- 避免数据瀑布（Promise.all, Suspense, preload）
- 客户端组件数据获取

---

## 🛣️ 路由处理器

参见 [route-handlers.md](https://github.com/vercel-labs/next-skills/blob/HEAD/skills/next-best-practices/route-handlers.md) 了解：

- route.ts 基础
- GET 处理器与 page.tsx 冲突
- 环境行为（无 React DOM）
- 何时使用 vs Server Actions

---

## 🖼️ 图片优化

参见 [image.md](https://github.com/vercel-labs/next-skills/blob/HEAD/skills/next-best-practices/image.md) 了解：

- 始终使用 next/image 而非原生 img
- 远程图片配置
- 响应式 sizes 属性
- 模糊占位符
- LCP 优先加载

---

## 🔤 字体优化

参见 [font.md](https://github.com/vercel-labs/next-skills/blob/HEAD/skills/next-best-practices/font.md) 了解：

- next/font 设置
- Google Fonts、本地字体
- Tailwind CSS 集成
- 预加载子集

---

## 📦 打包

参见 [bundling.md](https://github.com/vercel-labs/next-skills/blob/HEAD/skills/next-best-practices/bundling.md) 了解：

- 服务端不兼容的包
- CSS 导入（非 link 标签）
- Polyfills（已包含）
- ESM/CommonJS 问题
- 打包分析

---

## 🔒 安全检查

此技能不包含任何恶意代码。所有内容均为 Next.js 开发最佳实践指南。

---

*翻译自: https://github.com/yanghao1143/chiclaude-skills
