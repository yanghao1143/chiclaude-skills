# Vue 调试指南 (Vue Debug Guides)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 6.2K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

Vue.js 应用的调试技巧和工具指南，帮助快速定位和解决问题。

**适用场景**：Vue.js 应用调试、错误排查、性能问题定位。

---

## Vue Devtools

### 安装
- Chrome 扩展
- Firefox 扩展
- Edge 扩展

### 主要功能
- 组件树查看
- 状态检查
- 事件监控
- 路由追踪
- Pinia/Vuex 状态

---

## 常见调试场景

### 组件不渲染

**检查清单**：
1. 模板语法错误
2. 数据未正确初始化
3. 条件渲染逻辑
4. 组件导入路径

```javascript
// 检查组件是否正确注册
import MyComponent from './MyComponent.vue'

export default {
  components: { MyComponent }, // 确保注册
}
```

### 响应性丢失

**常见原因**：
1. 直接修改数组索引
2. 添加新属性
3. 解构响应式对象

```javascript
// 错误：直接修改
this.items[0] = newItem

// 正确：使用 Vue.set 或 splice
this.$set(this.items, 0, newItem)
// 或
this.items.splice(0, 1, newItem)
```

### Props 问题

**检查**：
1. 类型验证
2. 必需属性
3. 默认值
4. 大小写匹配

```javascript
props: {
  title: {
    type: String,
    required: true,
    default: ''
  }
}
```

### 事件不触发

**常见问题**：
1. 事件名称大小写
2. 修饰符使用错误
3. 阻止了事件传播

```vue
<!-- 发射事件 -->
this.$emit('update-value', newValue)

<!-- 监听事件 -->
<ChildComponent @update-value="handleUpdate" />
```

---

## 性能调试

### 使用 Chrome DevTools
1. Performance 面板录制
2. 分析渲染时间
3. 识别瓶颈

### Vue 特定优化
1. computed vs methods
2. v-if vs v-show
3. 列表 key 的正确使用
4. 避免不必要的响应式

---

## 错误处理

### 全局错误处理
```javascript
// main.js
app.config.errorHandler = (err, vm, info) => {
  console.error('Vue Error:', err)
  console.error('Component:', vm)
  console.error('Info:', info)
}
```

### 组件错误捕获
```javascript
export default {
  errorCaptured(err, vm, info) {
    // 处理子组件错误
    return false // 阻止错误继续传播
  }
}
```

---

## 相关技能

- **vue-best-practices**: Vue 最佳实践
- **systematic-debugging**: 系统调试方法

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
