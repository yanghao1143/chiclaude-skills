# Vue 最佳实践 (Vue Best Practices)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 6.2K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

Vue.js 开发最佳实践指南，帮助编写可维护、高性能的 Vue 应用。

**适用场景**：Vue.js 项目开发、代码审查、架构设计。

---

## 组件设计

### 单一职责
- 每个组件只做一件事
- 小而专注的组件
- 可组合的设计

### 组件命名
```javascript
// 组件名使用 PascalCase
MyComponent.vue

// 注册时使用 kebab-case
<my-component />
```

### Props 设计
```javascript
props: {
  // 明确定义类型
  title: String,

  // 带验证的对象形式
  count: {
    type: Number,
    required: true,
    validator: value => value >= 0
  }
}
```

---

## 响应式数据

### 使用 ref 和 reactive
```javascript
import { ref, reactive } from 'vue'

// 基本类型用 ref
const count = ref(0)

// 对象用 reactive
const state = reactive({
  name: '',
  items: []
})
```

### 避免响应式陷阱
```javascript
// ❌ 解构会失去响应性
const { name } = state

// ✅ 使用 toRefs
import { toRefs } from 'vue'
const { name } = toRefs(state)
```

---

## Composition API

### setup 函数
```javascript
import { ref, computed, onMounted } from 'vue'

export default {
  setup() {
    const count = ref(0)
    const doubled = computed(() => count.value * 2)

    onMounted(() => {
      console.log('组件已挂载')
    })

    return { count, doubled }
  }
}
```

### 组合式函数
```javascript
// composables/useCounter.js
import { ref } from 'vue'

export function useCounter() {
  const count = ref(0)
  const increment = () => count.value++

  return { count, increment }
}
```

---

## 性能优化

### 计算属性缓存
```javascript
// ✅ 使用 computed
const filteredItems = computed(() =>
  items.value.filter(item => item.active)
)

// ❌ 使用方法
function getFilteredItems() {
  return items.value.filter(item => item.active)
}
```

### 虚拟滚动
```vue
<RecycleScroller
  :items="largeList"
  :item-size="50"
>
  <template #default="{ item }">
    <div>{{ item.name }}</div>
  </template>
</RecycleScroller>
```

### 懒加载组件
```javascript
const AsyncComponent = defineAsyncComponent(() =>
  import('./HeavyComponent.vue')
)
```

---

## 相关技能

- **vue-debug-guides**: Vue 调试指南
- **vitest**: Vue 组件测试

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
