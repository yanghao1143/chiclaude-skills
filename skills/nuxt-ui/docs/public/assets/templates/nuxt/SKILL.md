# Nuxt 全栈框架 - Full-stack Vue Framework

> **原始仓库**: `antfu/skills/nuxt`
> **安装量**: 3.2K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

Nuxt 是一个全栈 Vue 框架，提供服务端渲染、基于文件的路由、自动导入和强大的模块系统。它使用 Nitro 作为服务器引擎，可在 Node.js、serverless 和边缘平台部署。

---

## 🎯 何时使用此技能

当用户进行以下工作时使用：

- Nuxt 应用开发
- 服务器路由
- useFetch 数据获取
- 中间件配置
- 混合渲染

---

## 📁 目录结构

```
nuxt-app/
├── .nuxt/              # 构建产物
├── assets/             # 需要构建的资源
├── components/         # 自动导入的组件
├── composables/        # 自动导入的组合函数
├── layouts/            # 布局组件
├── middleware/         # 路由中间件
├── modules/            # 本地模块
├── pages/              # 基于文件的路由
├── plugins/            # 插件
├── public/             # 静态资源
├── server/             # 服务器代码
│   ├── api/           # API 路由
│   ├── middleware/    # 服务器中间件
│   └── routes/        # 服务器路由
├── utils/              # 工具函数
├── app.vue             # 主应用组件
├── nuxt.config.ts      # Nuxt 配置
└── app.config.ts       # 应用配置
```

---

## ⚙️ 配置

### nuxt.config.ts

```typescript
// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  
  modules: [
    '@pinia/nuxt',
    '@nuxtjs/tailwindcss'
  ],
  
  runtimeConfig: {
    // 服务端私有
    apiSecret: process.env.API_SECRET,
    // 公开
    public: {
      apiBase: process.env.API_BASE || '/api'
    }
  },
  
  app: {
    head: {
      title: '我的 Nuxt 应用',
      meta: [
        { name: 'description', content: '应用描述' }
      ]
    }
  }
})
```

---

## 🛣️ 路由

### 基于文件的路由

```
pages/
├── index.vue           → /
├── about.vue           → /about
├── users/
│   ├── index.vue       → /users
│   └── [id].vue        → /users/:id
└── posts/
    └── [...slug].vue   → /posts/*
```

### 动态路由

```vue
<!-- pages/users/[id].vue -->
<script setup>
const route = useRoute()
const id = route.params.id
</script>
```

### 编程式导航

```vue
<script setup>
const router = useRouter()

function navigate() {
  router.push('/users/1')
}
</script>
```

---

## 📊 数据获取

### useFetch

```vue
<script setup>
// 自动处理响应式和缓存
const { data, pending, error, refresh } = await useFetch('/api/users')

// 带选项
const { data: user } = await useFetch('/api/user', {
  query: { id: 1 },
  headers: { Authorization: 'Bearer token' },
  // 仅在客户端执行
  server: false,
  // 响应式键
  key: 'user-1'
})
</script>
```

### useAsyncData

```vue
<script setup>
const { data, refresh } = await useAsyncData(
  'users',
  () => $fetch('/api/users'),
  {
    lazy: true, // 不阻塞导航
    default: () => [], // 默认值
    transform: (data) => data.users // 转换数据
  }
)
</script>
```

---

## 🔌 组合函数

### 内置组合函数

```typescript
// 路由
const route = useRoute()
const router = useRouter()

// 状态
const state = useState('key', () => initialValue)

// 运行时配置
const config = useRuntimeConfig()
const appConfig = useAppConfig()

// 头部管理
useHead({
  title: '页面标题',
  meta: [{ name: 'description', content: '描述' }]
})

// Cookie
const cookie = useCookie('token')

// Fetch
const { data } = await useFetch('/api/data')

// SSE
const event = useEvent()
```

### 自定义组合函数

```typescript
// composables/useUser.ts
export const useUser = () => {
  const user = useState<User | null>('user', () => null)
  
  async function login(credentials: Credentials) {
    user.value = await $fetch('/api/login', {
      method: 'POST',
      body: credentials
    })
  }
  
  function logout() {
    user.value = null
    navigateTo('/login')
  }
  
  return { user, login, logout }
}
```

---

## 🖥️ 服务器路由

### API 路由

```typescript
// server/api/users.ts
export default defineEventHandler(async (event) => {
  const method = getMethod(event)
  
  if (method === 'GET') {
    return await getUsers()
  }
  
  if (method === 'POST') {
    const body = await readBody(event)
    return await createUser(body)
  }
})
```

### 带参数的 API

```typescript
// server/api/users/[id].ts
export default defineEventHandler(async (event) => {
  const id = getRouterParam(event, 'id')
  
  return await getUserById(id)
})
```

---

## 🎨 组件

### 内置组件

```vue
<template>
  <!-- 路由出口 -->
  <NuxtPage />
  
  <!-- 链接 -->
  <NuxtLink to="/about">关于</NuxtLink>
  
  <!-- 布局 -->
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
  
  <!-- 仅客户端渲染 -->
  <ClientOnly>
    <ClientComponent />
  </ClientOnly>
</template>
```

---

## 🚀 部署

### 构建命令

```bash
# 开发
pnpm dev

# 构建
pnpm build

# 生成静态站点
pnpm generate

# 预览
pnpm preview
```

### 平台部署

```typescript
// nuxt.config.ts
export default defineNuxtConfig({
  nitro: {
    preset: 'vercel' // 或 'netlify', 'cloudflare', 'node-server'
  }
})
```

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [GitHub 仓库](https://github.com/nuxt/nuxt)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
