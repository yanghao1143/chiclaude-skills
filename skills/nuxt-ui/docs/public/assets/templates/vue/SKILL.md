# Vue.js (Vue)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 4.7K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

Vue.js 框架开发指南和最佳实践。

**适用场景**：Vue.js 项目开发、组件设计、状态管理。

---

## Composition API

### setup 函数
```vue
<script setup>
import { ref, computed } from 'vue'

const count = ref(0)
const doubled = computed(() => count.value * 2)

function increment() {
  count.value++
}
</script>

<template>
  <button @click="increment">{{ count }}</button>
  <p>Doubled: {{ doubled }}</p>
</template>
```

---

## 响应式

### ref vs reactive
```javascript
// 基本类型用 ref
const count = ref(0)

// 对象用 reactive
const state = reactive({
  name: '',
  items: []
})
```

---

## 组件通信

### Props / Emits
```vue
<!-- Parent -->
<Child :data="value" @update="handleUpdate" />

<!-- Child -->
<script setup>
const props = defineProps(['data'])
const emit = defineEmits(['update'])
</script>
```

### Provide / Inject
```javascript
// 祖先组件
provide('theme', 'dark')

// 后代组件
const theme = inject('theme')
```

---

## 相关技能

- **vue-best-practices**: Vue 最佳实践
- **vue-debug-guides**: Vue 调试指南
- **vitest**: Vue 组件测试

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
