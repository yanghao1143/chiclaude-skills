# 使用 DOM (Use DOM)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 4.4K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

在 Expo 应用中使用 Web DOM 组件。

**适用场景**：在 React Native 中使用 Web 组件、复用 Web 代码。

---

## 核心概念

### DOM 组件
- 在 React Native 中渲染 Web 组件
- 跨平台复用代码
- 渐进式迁移

---

## 使用方式

### 基本用法
```jsx
import { useDOM } from 'expo-dom';

function MyComponent() {
  const { ref, DOMComponent } = useDOM();

  return (
    <DOMComponent>
      <div ref={ref}>
        Web 内容
      </div>
    </DOMComponent>
  );
}
```

---

## 适用场景

### 复用 Web 库
- 使用仅 Web 端的库
- 迁移现有 Web 应用
- 原型开发

### 混合开发
- 部分 Web 视图
- 逐步原生化
- 跨平台一致性

---

## 注意事项

- 性能考虑
- 样式兼容性
- 事件处理差异

---

## 相关技能

- **expo-deployment**: Expo 部署
- **react-native-best-practices**: React Native 最佳实践

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
