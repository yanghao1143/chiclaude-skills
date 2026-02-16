# 🔥 [No.013] React Native Skills - React Native 最佳实践

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 4.8K (24h)
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

React Native 和 Expo 应用的全面最佳实践。包含性能、动画、UI 模式和平台特定优化的规则。

---

## 何时应用

在以下情况下参考这些指南：

- 构建 React Native 或 Expo 应用
- 优化列表和滚动性能
- 使用 Reanimated 实现动画
- 处理图片和媒体
- 配置原生模块或字体
- 构建包含原生依赖的 monorepo 项目

---

## 按优先级排序的规则类别

| 优先级 | 类别 | 影响程度 | 前缀 |
|--------|------|----------|------|
| 1 | 列表性能 | 关键 | `list-performance-` |
| 2 | 动画 | 高 | `animation-` |
| 3 | 导航 | 高 | `navigation-` |
| 4 | UI 模式 | 高 | `ui-` |
| 5 | 状态管理 | 中等 | `react-state-` |
| 6 | 渲染 | 中等 | `rendering-` |
| 7 | Monorepo | 中等 | `monorepo-` |
| 8 | 配置 | 低 | `fonts-`, `imports-` |

---

## 快速参考

### 1. 列表性能（关键）

- `list-performance-virtualize` - 大列表使用 FlashList
- `list-performance-item-memo` - 记忆化列表项组件
- `list-performance-callbacks` - 稳定回调引用
- `list-performance-inline-objects` - 避免内联样式对象
- `list-performance-function-references` - 将函数提取到渲染外部
- `list-performance-images` - 优化列表中的图片
- `list-performance-item-expensive` - 将昂贵操作移出列表项
- `list-performance-item-types` - 异构列表使用 item types

### 2. 动画（高）

- `animation-gpu-properties` - 只动画 transform 和 opacity
- `animation-derived-value` - 计算动画使用 useDerivedValue
- `animation-gesture-detector-press` - 使用 Gesture.Tap 替代 Pressable

### 3. 导航（高）

- `navigation-native-navigators` - 使用原生堆栈和原生标签页替代 JS 导航器

### 4. UI 模式（高）

- `ui-expo-image` - 所有图片使用 expo-image
- `ui-image-gallery` - 图片灯箱使用 Galeria
- `ui-pressable` - 使用 Pressable 替代 TouchableOpacity
- `ui-safe-area-scroll` - 在 ScrollView 中处理安全区域
- `ui-scrollview-content-inset` - 标题使用 contentInset
- `ui-menus` - 使用原生上下文菜单
- `ui-native-modals` - 尽可能使用原生模态框
- `ui-measure-views` - 使用 onLayout，不用 measure()
- `ui-styling` - 使用 StyleSheet.create 或 Nativewind

### 5. 状态管理（中等）

- `react-state-minimize` - 最小化状态订阅
- `react-state-dispatcher` - 回调使用调度器模式
- `react-state-fallback` - 首次渲染显示回退
- `react-compiler-destructure-functions` - 为 React Compiler 解构
- `react-compiler-reanimated-shared-values` - 编译器处理共享值

### 6. 渲染（中等）

- `rendering-text-in-text-component` - 文本包裹在 Text 组件中
- `rendering-no-falsy-and` - 避免使用 falsy && 进行条件渲染

### 7. Monorepo（中等）

- `monorepo-native-deps-in-app` - 原生依赖保持在 app 包中
- `monorepo-single-dependency-versions` - 跨包使用单一版本

### 8. 配置（低）

- `fonts-config-plugin` - 自定义字体使用配置插件
- `imports-design-system-folder` - 组织设计系统导入
- `js-hoist-intl` - 提升 Intl 对象创建

---

## 如何使用

阅读各个规则文件获取详细说明和代码示例：

```
rules/list-performance-virtualize.md
rules/animation-gpu-properties.md
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

*翻译搬运自 [skills.sh](https://github.com/yanghao1143/chiclaude-skills)*

📌 *Skills市场搬运计划 - 热门技能系列 - No.013*
