# React 组件 (React Components)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 5.5K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

构建高质量 React 组件的最佳实践和模式。

**适用场景**：创建 React 组件、设计组件 API、优化组件性能。

---

## 组件设计原则

### 单一职责
- 每个组件只做一件事
- 可组合的小组件
- 清晰的接口

### 可预测性
- 相同输入 = 相同输出
- 无副作用（纯组件）
- 明确的数据流

### 可复用性
- 参数化配置
- 避免硬编码
- 组合优于继承

---

## 组件类型

### 展示组件
```jsx
function UserCard({ name, avatar, bio }) {
  return (
    <div className="user-card">
      <img src={avatar} alt={name} />
      <h3>{name}</h3>
      <p>{bio}</p>
    </div>
  );
}
```

### 容器组件
```jsx
function UserCardContainer({ userId }) {
  const { user, loading, error } = useUser(userId);

  if (loading) return <Spinner />;
  if (error) return <Error message={error} />;

  return <UserCard {...user} />;
}
```

### 复合组件
```jsx
function Tabs({ children }) {
  return <div className="tabs">{children}</div>;
}

Tabs.List = function TabsList({ children }) {
  return <div className="tabs-list">{children}</div>;
};

Tabs.Panel = function TabsPanel({ children }) {
  return <div className="tabs-panel">{children}</div>;
};
```

---

## 性能优化

### React.memo
```jsx
const MemoizedComponent = React.memo(function Component({ data }) {
  return <div>{data}</div>;
});
```

### useMemo / useCallback
```jsx
function Parent({ items }) {
  const sortedItems = useMemo(() => {
    return [...items].sort((a, b) => a.name.localeCompare(b.name));
  }, [items]);

  const handleClick = useCallback((id) => {
    console.log(id);
  }, []);

  return <List items={sortedItems} onClick={handleClick} />;
}
```

---

## 组件 API 设计

### Props 设计
```jsx
// 好的设计
<Button
  variant="primary"
  size="large"
  disabled={false}
  onClick={handleClick}
>
  点击我
</Button>

// 避免
<Button
  isPrimary
  isLarge
  notDisabled
  onButtonClick={handleClick}
  buttonLabel="点击我"
/>
```

### 默认值
```jsx
function Button({
  variant = 'primary',
  size = 'medium',
  disabled = false,
  children,
}) {
  // ...
}
```

---

## 相关技能

- **typescript-advanced-types**: TypeScript 类型
- **vue-best-practices**: Vue 最佳实践对比

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
