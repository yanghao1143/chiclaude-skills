# 🔥 [No.018] Next.js 最佳实践

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 13.5K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

编写或审查 Next.js 代码时应用的规则集合。

---

## 文件约定

- 项目结构和特殊文件
- 路由段（动态、捕获所有、分组）
- 并行和拦截路由
- v16 中间件重命名（middleware → proxy）

---

## RSC 边界

检测无效的 React Server Component 模式：

- 异步客户端组件检测（无效）
- 不可序列化 props 检测
- Server Action 异常

---

## 异步模式

Next.js 15+ 异步 API 变更：

- 异步 params 和 searchParams
- 异步 cookies() 和 headers()
- 迁移代码修改

---

## 运行时选择

- 默认使用 Node.js 运行时
- 何时适合使用 Edge 运行时

---

## 指令

- `'use client'`, `'use server'` (React)
- `'use cache'` (Next.js)

---

## 函数

### 导航钩子
- useRouter, usePathname, useSearchParams, useParams

### 服务端函数
- cookies, headers, draftMode, after

### 生成函数
- generateStaticParams, generateMetadata

---

## 错误处理

- error.tsx, global-error.tsx, not-found.tsx
- redirect, permanentRedirect, notFound
- forbidden, unauthorized（认证错误）
- unstable_rethrow 用于 catch 块

---

## 数据模式

- Server Components vs Server Actions vs Route Handlers
- 避免数据瀑布（Promise.all, Suspense, preload）
- 客户端组件数据获取

---

## 路由处理程序

- route.ts 基础
- GET 处理程序与 page.tsx 冲突
- 环境行为（无 React DOM）
- 何时使用 vs Server Actions

---

## 元数据与 OG 图片

- 静态和动态元数据
- generateMetadata 函数
- 使用 next/og 生成 OG 图片
- 基于文件的元数据约定

---

## 图片优化

- 始终使用 next/image 而非原生 img
- 远程图片配置
- 响应式 sizes 属性
- 模糊占位符
- LCP 优先加载

---

## 字体优化

- next/font 设置
- Google Fonts、本地字体
- Tailwind CSS 集成
- 预加载子集

---

## 打包

- 与服务端不兼容的包
- CSS 导入（不是 link 标签）
- Polyfills（已包含）
- ESM/CommonJS 问题
- 包分析

---

## 脚本

- next/script vs 原生 script 标签
- 内联脚本需要 id
- 加载策略
- 使用 @next/third-parties 集成 Google Analytics

---

## 水合错误

- 常见原因（浏览器 API、日期、无效 HTML）
- 使用错误覆盖层调试
- 每种原因的修复方法

---

## Suspense 边界

- 使用 useSearchParams 和 usePathname 时的 CSR 退出
- 哪些钩子需要 Suspense 边界

---

## 并行与拦截路由

- 使用 @slot 和 (.) 拦截器的模态框模式
- default.tsx 作为回退
- 使用 router.back() 正确关闭模态框

---

## 自托管

- output: 'standalone' 用于 Docker
- 多实例 ISR 的缓存处理器
- 哪些功能正常工作 vs 需要额外设置

---

## 调试技巧

- 用于 AI 辅助调试的 MCP 端点
- 使用 --debug-build-paths 重建特定路由

---

📌 *Skills市场搬运计划 - 热门技能系列 - No.018*
