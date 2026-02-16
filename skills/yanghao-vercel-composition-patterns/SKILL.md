# Vercel React 组合模式

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 41.1K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

用于构建灵活、可维护的 React 组件的组合模式。通过使用复合组件、状态提升和组合内部逻辑来避免布尔属性的泛滥。这些模式使代码库无论对人类还是AI代理来说，在扩展时都更易于使用。

---

## 何时应用

在以下情况下参考这些指南：

- 重构具有大量布尔属性的组件
- 构建可重用的组件库
- 设计灵活的组件 API
- 审查组件架构
- 使用复合组件或 Context 提供程序

---

## 按优先级排序的规则类别

| 优先级 | 类别 | 影响 | 前缀 |
|--------|------|------|------|
| 1 | 组件架构 🟠 | 高 | architecture- |
| 2 | 状态管理 🟡 | 中 | state- |
| 3 | 实现模式 🟡 | 中 | patterns- |
| 4 | React 19 API 🟡 | 中 | react19- |

---

## 快速参考

### 1. 组件架构 (高) 🟠

- `architecture-avoid-boolean-props` - 不要添加布尔属性来自定义行为；使用组合
- `architecture-compound-components` - 使用共享上下文构建复杂组件

### 2. 状态管理 (中) 🟡

- `state-decouple-implementation` - Provider 是唯一知道如何管理状态的地方
- `state-context-interface` - 定义包含状态、操作、元数据的通用接口以实现依赖注入
- `state-lift-state` - 将状态移动到 Provider 组件中以便兄弟元素访问

### 3. 实现模式 (中) 🟡

- `patterns-explicit-variants` - 创建显式的变体组件而非布尔模式
- `patterns-children-over-render-props` - 使用子元素进行组合而非 renderX 属性

### 4. React 19 API (中) 🟡

⚠️ **仅限 React 19+**。如果使用 React 18 或更早版本，请跳过此部分。

- `react19-no-forwardref` - 不要使用 forwardRef；使用 use() 替代 useContext()

---

## 如何使用

阅读各个规则文件以获取详细说明和代码示例：

```
rules/architecture-avoid-boolean-props.md
rules/state-context-interface.md
```

每个规则文件包含：
- 为什么重要的简要说明
- 带说明的错误代码示例
- 带说明的正确代码示例
- 额外上下文和参考

---

## 完整文档

查看包含所有规则扩展说明的完整指南：`AGENTS.md`

---

## 核心原则

### 避免布尔属性泛滥

当组件需要多种变体或行为时，不要使用布尔开关：

**❌ 错误示例：**
```jsx
<Button primary secondary outline disabled large small />
```

**✅ 正确示例：**
```jsx
<Button variant="primary" size="large" />
<Button variant="outline" disabled />
```

### 使用复合组件

对于复杂组件，使用复合模式：

```jsx
<Card>
  <Card.Header>标题</Card.Header>
  <Card.Body>内容</Card.Body>
  <Card.Footer>页脚</Card.Footer>
</Card>
```

### 状态提升与解耦

将共享状态提升到适当的组件层级，并通过 Context 传递：

```jsx
// Provider 是状态管理的唯一来源
const MyContext = createContext();

function Provider({ children }) {
  const [state, setState] = useState(/* ... */);
  const actions = useMemo(() => ({
    // 操作
  }), []);

  return (
    <MyContext.Provider value={{ state, actions, meta }}>
      {children}
    </MyContext.Provider>
  );
}
```

---

*翻译搬运自 [skills.sh](https://github.com/yanghao1143/chiclaude-skills)*
