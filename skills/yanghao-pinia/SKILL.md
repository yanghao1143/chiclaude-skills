# Pinia 状态管理 - Vue State Management

> **原始仓库**: `antfu/skills/pinia`
> **安装量**: 3.6K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

Pinia 是 Vue 的官方状态管理库，设计直观且类型安全。支持 Options API 和 Composition API 两种风格，提供一流的 TypeScript 支持和开发者工具集成。

---

## 🎯 何时使用此技能

当用户进行以下工作时使用：

- 定义 stores
- 处理 state/getters/actions
- 实现 store 模式

---

## 🚀 快速入门

### 安装

```bash
pnpm add pinia
# 或
npm install pinia
```

### 基本设置

```typescript
// main.ts
import { createPinia } from 'pinia'

const app = createApp(App)
app.use(createPinia())
```

---

## 📦 定义 Store

### Setup Store (推荐)

```typescript
// stores/counter.ts
import { ref, computed } from 'pinia'

export const useCounterStore = defineStore('counter', () => {
  // state
  const count = ref(0)
  
  // getter
  const doubleCount = computed(() => count.value * 2)
  
  // action
  function increment() {
    count.value++
  }
  
  return { count, doubleCount, increment }
})
```

### Options Store

```typescript
export const useCounterStore = defineStore('counter', {
  state: () => ({
    count: 0
  }),
  
  getters: {
    doubleCount: (state) => state.count * 2
  },
  
  actions: {
    increment() {
      this.count++
    }
  }
})
```

---

## 📖 使用 Store

### 在组件中使用

```vue
<script setup>
import { useCounterStore } from '@/stores/counter'
import { storeToRefs } from 'pinia'

const store = useCounterStore()

// ✅ 解构 state 和 getters - 使用 storeToRefs
const { count, doubleCount } = storeToRefs(store)

// ✅ actions 可以直接解构
const { increment } = store
</script>

<template>
  <div>{{ count }}</div>
  <div>{{ doubleCount }}</div>
  <button @click="increment">增加</button>
</template>
```

### 修改 State

```typescript
const store = useCounterStore()

// 直接修改
store.count++

// $patch 批量修改
store.$patch({
  count: store.count + 1,
  name: '新名称'
})

// $patch 函数式
store.$patch((state) => {
  state.count++
  state.items.push({ id: 1 })
})

// 重置 state
store.$reset()
```

---

## 🔄 Getters

### 定义 Getters

```typescript
export const useUserStore = defineStore('user', () => {
  const users = ref<User[]>([])
  
  // 基本 getter
  const userCount = computed(() => users.value.length)
  
  // 带参数 getter (返回函数)
  const getUserById = computed(() => {
    return (id: number) => users.value.find(u => u.id === id)
  })
  
  return { users, userCount, getUserById }
})
```

### 使用 Getters

```vue
<script setup>
const store = useUserStore()

// 基本 getter
const count = store.userCount

// 带参数 getter
const user = store.getUserById(1)
</script>
```

---

## ⚡ Actions

### 异步 Actions

```typescript
export const useUserStore = defineStore('user', () => {
  const users = ref<User[]>([])
  const loading = ref(false)
  
  async function fetchUsers() {
    loading.value = true
    try {
      const response = await fetch('/api/users')
      users.value = await response.json()
    } finally {
      loading.value = false
    }
  }
  
  return { users, loading, fetchUsers }
})
```

### 调用其他 Store

```typescript
const useUserStore = defineStore('user', () => {
  const authStore = useAuthStore()
  
  async function fetchUsers() {
    // 使用其他 store
    if (!authStore.isLoggedIn) {
      throw new Error('未登录')
    }
    // ...
  }
  
  return { fetchUsers }
})
```

---

## 🔧 插件

### 创建插件

```typescript
// stores/plugins/persist.ts
import type { PiniaPluginContext } from 'pinia'

export function persistPlugin({ store }: PiniaPluginContext) {
  // 从 localStorage 恢复
  const saved = localStorage.getItem(store.$id)
  if (saved) {
    store.$patch(JSON.parse(saved))
  }
  
  // 监听变化并保存
  store.$subscribe((mutation, state) => {
    localStorage.setItem(store.$id, JSON.stringify(state))
  })
}
```

### 注册插件

```typescript
// main.ts
const pinia = createPinia()
pinia.use(persistPlugin)

app.use(pinia)
```

---

## 🧪 测试

### 使用 @pinia/testing

```typescript
import { setActivePinia, createPinia } from 'pinia'
import { useCounterStore } from '@/stores/counter'

describe('Counter Store', () => {
  beforeEach(() => {
    setActivePinia(createPinia())
  })
  
  it('increments', () => {
    const store = useCounterStore()
    store.increment()
    expect(store.count).toBe(1)
  })
})
```

### Mock Store

```typescript
import { createTestingPinia } from '@pinia/testing'

const wrapper = mount(Component, {
  global: {
    plugins: [
      createTestingPinia({
        initialState: {
          counter: { count: 10 }
        },
        stubActions: false
      })
    ]
  }
})
```

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [GitHub 仓库](https://github.com/vuejs/pinia)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
