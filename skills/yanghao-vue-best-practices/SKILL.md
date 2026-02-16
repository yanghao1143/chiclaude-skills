# Vue 最佳实践 - Vue Best Practices

> **原始仓库**: `antfu/skills/vue-best-practices`
> **安装量**: 4.1K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

Vue 3 最佳实践、常见陷阱和性能优化。强烈推荐使用 Composition API 和 `<script setup>` 配合 TypeScript 作为标准方案。

---

## 🎯 何时使用此技能

当用户进行以下工作时使用：

- Vue.js 开发任务
- 处理 .vue 文件
- Vue Router 配置
- Pinia 状态管理
- Vite + Vue 项目

---

## ⚡ 响应式

### 访问 ref() 值

在脚本中访问 ref() 值时需要使用 `.value`：

```vue
<script setup>
import { ref } from 'vue'

const count = ref(0)

// 正确: 在脚本中使用 .value
console.log(count.value)

// 在模板中自动解包，不需要 .value
</script>

<template>
  <div>{{ count }}</div>
</template>
```

### 解构 reactive() 对象

解构 reactive() 对象会丢失响应性：

```vue
<script setup>
import { reactive, toRefs } from 'vue'

const state = reactive({
  count: 0,
  name: 'Vue'
})

// ❌ 错误: 解构会丢失响应性
const { count } = state

// ✅ 正确: 使用 toRefs
const { count, name } = toRefs(state)
</script>
```

### ref() vs reactive()

优先使用 ref() 而不是 reactive()：

```vue
<script setup>
import { ref } from 'vue'

// ✅ 推荐: ref 更灵活
const count = ref(0)
const user = ref({ name: 'Vue' })

// ⚠️ reactive 有限制
const state = reactive({ count: 0 })
// 解构会丢失响应性
```

---

## 🔄 Computed

### 计算属性不要有副作用

```vue
<script setup>
import { ref, computed } from 'vue'

const items = ref([])

// ❌ 错误: 计算属性不应该修改数据
const sortedItems = computed(() => {
  return items.value.sort() // sort 会修改原数组
})

// ✅ 正确: 返回新数组
const sortedItems = computed(() => {
  return [...items.value].sort()
})
</script>
```

### 计算属性是只读的

```vue
<script setup>
import { ref, computed } from 'vue'

const count = ref(0)

const doubled = computed(() => count.value * 2)

// ❌ 错误: 不能直接修改计算属性
doubled.value = 10

// ✅ 正确: 修改源数据
count.value = 5 // doubled 会自动更新为 10
</script>
```

---

## 👀 Watchers

### 监听 reactive 对象属性

```vue
<script setup>
import { reactive, watch } from 'vue'

const state = reactive({
  count: 0
})

// ❌ 错误: 直接监听属性
watch(state.count, (newVal) => {})

// ✅ 正确: 使用 getter 函数
watch(
  () => state.count,
  (newVal) => {}
)
</script>
```

### 深度监听性能

```vue
<script setup>
import { reactive, watch } from 'vue'

const bigObject = reactive({ /* 大量数据 */ })

// ⚠️ 深度监听可能影响性能
watch(
  bigObject,
  (newVal) => {},
  { deep: true }
)

// ✅ 更好: 监听特定属性
watch(
  () => bigObject.specificProperty,
  (newVal) => {}
)
</script>
```

---

## 🧩 组件

### Props 是只读的

```vue
<!-- ChildComponent.vue -->
<script setup>
const props = defineProps({
  count: Number
})

// ❌ 错误: 不能修改 props
props.count = 10

// ✅ 正确: 使用本地 ref 或 emit
const localCount = ref(props.count)
</script>
```

### 组件命名使用 PascalCase

```vue
<template>
  <!-- ✅ 推荐 -->
  <MyComponent />

  <!-- ⚠️ 不推荐 -->
  <my-component />
</template>
```

---

## 📝 模板

### v-if 和 v-for 不要一起使用

```vue
<template>
  <!-- ❌ 错误: v-if 和 v-for 同级 -->
  <div v-for="item in items" v-if="item.active">
    {{ item.name }}
  </div>

  <!-- ✅ 正确: 使用计算属性过滤 -->
  <div v-for="item in activeItems">
    {{ item.name }}
  </div>
</template>

<script setup>
const activeItems = computed(() => 
  items.value.filter(item => item.active)
)
</script>
```

### 使用 computed 过滤列表

```vue
<script setup>
const items = ref([...])

// ✅ 使用计算属性过滤
const filteredItems = computed(() => 
  items.value.filter(item => item.active)
)
</script>

<template>
  <div v-for="item in filteredItems">
    {{ item.name }}
  </div>
</template>
```

---

## 📦 Composables

### Composable 命名规范

```javascript
// ✅ 使用 use 前缀
export function useCounter() {
  const count = ref(0)
  const increment = () => count.value++
  
  return { count, increment }
}

// 使用
const { count, increment } = useCounter()
```

### 返回只读状态

```javascript
export function useUser() {
  const user = ref(null)
  
  // ✅ 返回只读状态
  return {
    user: readonly(user),
    fetchUser,
    updateUser
  }
}
```

---

## 📦 TypeScript 支持

### 使用 defineProps 类型声明

```vue
<script setup lang="ts">
// ✅ 类型声明方式
interface Props {
  title: string
  count?: number
}

const props = defineProps<Props>()

// 带默认值
const props = withDefaults(defineProps<Props>(), {
  count: 0
})
</script>
```

### 使用 defineEmits 类型声明

```vue
<script setup lang="ts">
interface Emits {
  (e: 'update', value: string): void
  (e: 'delete', id: number): void
}

const emit = defineEmits<Emits>()

// 使用
emit('update', 'new value')
</script>
```

---

## ⚡ 性能优化

### 使用 shallowRef 提升性能

```vue
<script setup>
import { shallowRef } from 'vue'

// 对于大对象，使用 shallowRef
const bigData = shallowRef({ /* 大量数据 */ })

// 只有 .value 赋值才触发更新
bigData.value = newData
</script>
```

### 虚拟列表处理大数据

```vue
<script setup>
import { useVirtualList } from '@vueuse/core'

const { list, containerProps, wrapperProps } = useVirtualList(
  largeArray,
  { itemHeight: 50 }
)
</script>

<template>
  <div {...containerProps}>
    <div {...wrapperProps}>
      <div v-for="{ data, index } in list" :key="index">
        {{ data }}
      </div>
    </div>
  </div>
</template>
```

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [GitHub 仓库](https://github.com/antfu/skills)
- [Vue 官方文档](https://vuejs.org)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
