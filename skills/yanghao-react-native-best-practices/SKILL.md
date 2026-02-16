# React Native 最佳实践 (React Native Best Practices)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 5.2K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

React Native 开发最佳实践指南，帮助构建高质量跨平台应用。

**适用场景**：React Native 项目开发、代码审查、性能优化。

---

## 项目结构

```
src/
├── components/     # 可复用组件
├── screens/        # 屏幕组件
├── navigation/     # 导航配置
├── services/       # API 服务
├── hooks/          # 自定义 Hooks
├── utils/          # 工具函数
├── constants/      # 常量定义
└── types/          # TypeScript 类型
```

---

## 组件设计

### 函数组件优先
```jsx
function MyComponent({ title, onPress }) {
  return (
    <TouchableOpacity onPress={onPress}>
      <Text>{title}</Text>
    </TouchableOpacity>
  );
}
```

### 样式组织
```jsx
const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
  },
  title: {
    fontSize: 18,
    fontWeight: 'bold',
  },
});
```

---

## 性能优化

### 列表优化
```jsx
<FlatList
  data={items}
  renderItem={renderItem}
  keyExtractor={(item) => item.id}
  getItemLayout={(data, index) => ({
    length: ITEM_HEIGHT,
    offset: ITEM_HEIGHT * index,
    index,
  })}
/>
```

### 避免不必要渲染
```jsx
const MemoizedItem = React.memo(function Item({ data }) {
  return <View>{/* ... */}</View>;
});
```

---

## 导航最佳实践

### React Navigation
```jsx
const Stack = createStackNavigator();

function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="Home" component={HomeScreen} />
        <Stack.Screen name="Details" component={DetailsScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
```

---

## 相关技能

- **expo-deployment**: Expo 部署
- **native-data-fetching**: 数据获取
- **react-state-management**: 状态管理

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
