# Next.js 缓存组件 - Cache Components

> **原始仓库**: `vercel-labs/next-skills/next-cache-components`
> **安装量**: 3.7K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

缓存组件支持部分预渲染（PPR）- 在单个路由中混合静态、缓存和动态内容。

---

## 🎯 何时使用此技能

当用户进行以下工作时使用：

- Next.js 16+ 应用开发
- 实现部分预渲染（PPR）
- 优化页面性能
- 缓存策略配置

---

## ⚙️ 启用缓存组件

```ts
// next.config.ts
import type { NextConfig } from 'next'

const nextConfig: NextConfig = {
  cacheComponents: true,
}

export default nextConfig
```

---

## 📦 三种内容类型

### 1. 静态（自动预渲染）

同步代码、导入、纯计算 - 在构建时预渲染：

```tsx
export default function Page() {
  return (
    <header>
      <h1>我们的博客</h1>  {/* 静态 - 即时显示 */}
      <nav>...</nav>
    </header>
  )
}
```

### 2. 缓存（`use cache`）

不需要每次请求都刷新的异步数据：

```tsx
async function BlogPosts() {
  'use cache'
  cacheLife('hours')

  const posts = await db.posts.findMany()
  return <PostList posts={posts} />
}
```

### 3. 动态（Suspense）

必须保持新鲜的运行时数据 - 包装在 Suspense 中：

```tsx
import { Suspense } from 'react'

export default function Page() {
  return (
    <>
      <BlogPosts />  {/* 缓存 */}

      <Suspense fallback={<p>加载中...</p>}>
        <UserPreferences />  {/* 动态 - 流式加载 */}
      </Suspense>
    </>
  )
}
```

---

## 🔧 `use cache` 指令

### 文件级别

```tsx
'use cache'

export default async function Page() {
  // 整个页面被缓存
  const data = await fetchData()
  return <div>{data}</div>
}
```

### 组件级别

```tsx
export async function CachedComponent() {
  'use cache'
  const data = await fetchData()
  return <div>{data}</div>
}
```

### 函数级别

```tsx
export async function getData() {
  'use cache'
  return db.query('SELECT * FROM posts')
}
```

---

## ⏱️ 缓存配置

### cacheLife()

```tsx
import { cacheLife } from 'next/cache'

async function getData() {
  'use cache'
  cacheLife('hours')  // 内置配置
  return fetch('/api/data')
}
```

内置配置：`'default'`、`'minutes'`、`'hours'`、`'days'`、`'weeks'`、`'max'`

### 内联配置

```tsx
async function getData() {
  'use cache'
  cacheLife({
    stale: 3600,      // 1 小时 - 过期期间提供旧数据
    revalidate: 7200, // 2 小时 - 后台重新验证间隔
    expire: 86400,    // 1 天 - 硬过期
  })
  return fetch('/api/data')
}
```

---

## 🏷️ 缓存标签

### cacheTag()

```tsx
import { cacheTag } from 'next/cache'

async function getProducts() {
  'use cache'
  cacheTag('products')
  return db.products.findMany()
}
```

### updateTag() - 立即失效

```tsx
'use server'

import { updateTag } from 'next/cache'

export async function updateProduct(id: string, data: FormData) {
  await db.products.update({ where: { id }, data })
  updateTag(`product-${id}`)  // 立即 - 同一请求看到新数据
}
```

### revalidateTag() - 后台重新验证

```tsx
'use server'

import { revalidateTag } from 'next/cache'

export async function createPost(data: FormData) {
  await db.posts.create({ data })
  revalidateTag('posts')  // 后台 - 下次请求看到新数据
}
```

---

## ⚠️ 运行时数据约束

**不能**在 `use cache` 内访问 `cookies()`、`headers()` 或 `searchParams`。

### 解决方案：作为参数传递

```tsx
// 正确 - 在外部提取，作为参数传递
async function ProfilePage() {
  const session = (await cookies()).get('session')?.value
  return <CachedProfile sessionId={session} />
}

async function CachedProfile({ sessionId }: { sessionId: string }) {
  'use cache'
  // sessionId 自动成为缓存键的一部分
  const data = await fetchUserData(sessionId)
  return <div>{data.name}</div>
}
```

---

## 📋 完整示例

```tsx
import { Suspense } from 'react'
import { cookies } from 'next/headers'
import { cacheLife, cacheTag } from 'next/cache'

export default function DashboardPage() {
  return (
    <>
      {/* 静态外壳 - CDN 即时显示 */}
      <header><h1>仪表盘</h1></header>

      {/* 缓存 - 快速，每小时重新验证 */}
      <Stats />

      {/* 动态 - 流式加载新鲜数据 */}
      <Suspense fallback={<NotificationsSkeleton />}>
        <Notifications />
      </Suspense>
    </>
  )
}

async function Stats() {
  'use cache'
  cacheLife('hours')
  cacheTag('dashboard-stats')

  const stats = await db.stats.aggregate()
  return <StatsDisplay stats={stats} />
}
```

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [Next.js 官方文档](https://nextjs.org/docs)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
