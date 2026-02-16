# Building Native UI - 构建原生 UI (Expo)

> **原始仓库**: `expo/skills/building-native-ui`
> **安装量**: 10.0K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

Expo 原生 UI 开发指南，包含动画、控件、表单、图标、媒体、导航等最佳实践。

---

## 📚 参考资源

根据需要查阅以下资源：

| 文件 | 内容 |
|------|------|
| animations.md | Reanimated: 进入、退出、布局、滚动驱动、手势 |
| controls.md | 原生 iOS: Switch, Slider, SegmentedControl, DateTimePicker, Picker |
| form-sheet.md | 通过 Stack 和 react-native-screens 实现带页脚的表单 |
| gradients.md | 通过 experimental_backgroundImage 实现 CSS 渐变（仅新架构） |
| icons.md | 通过 expo-image 的 SF Symbols (sf: source)、名称、动画、权重 |
| media.md | 相机、音频、视频和文件保存 |
| route-structure.md | 路由约定、动态路由、分组、文件夹组织 |
| search.md | 带标题的搜索栏、useSearch 钩子、过滤模式 |
| storage.md | SQLite, AsyncStorage, SecureStore |
| tabs.md | NativeTabs、从 JS tabs 迁移、iOS 26 功能 |
| toolbar-and-headers.md | Stack 标题和工具栏按钮、菜单、搜索（仅 iOS） |
| visual-effects.md | 模糊 (expo-blur) 和液态玻璃 (expo-glass-effect) |
| webgpu-three.md | 使用 WebGPU 和 Three.js 的 3D 图形、游戏、GPU 可视化 |
| zoom-transitions.md | Apple Zoom: 通过 Link.AppleZoom 实现流畅缩放过渡（iOS 18+） |

---

## 🚀 运行应用

**关键**：在创建自定义构建之前，始终先尝试 Expo Go。

大多数 Expo 应用无需任何自定义原生代码即可在 Expo Go 中运行。在运行 `npx expo run:ios` 或 `npx expo run:android` 之前：

- 从 Expo Go 开始：运行 `npx expo start` 并用 Expo Go 扫描二维码
- 检查功能是否工作：在 Expo Go 中彻底测试你的应用
- 只在需要时创建自定义构建 - 见下文

### 何时需要自定义构建

只有在使用以下内容时才需要 `npx expo run:ios/android` 或 `eas build`：

- 本地 Expo 模块（modules/ 中的自定义原生代码）
- Apple targets（通过 @bacons/apple-targets 的 widgets、app clips、extensions）
- Expo Go 中未包含的第三方原生模块
- 无法在 app.json 中表达的自定义原生配置

---

## 💻 代码风格

- 注意未终止的字符串。确保嵌套反引号已转义
- 始终在文件顶部使用 import 语句
- 始终对文件名使用 kebab-case，如 comment-card.tsx
- 移动或重构导航时始终删除旧路由文件
- 文件名中不要使用特殊字符
- 配置 tsconfig.json 使用路径别名，重构时优先使用别名而非相对导入

---

## 🛣️ 路由

参见 ./references/route-structure.md 了解详细路由约定。

- 路由属于 app 目录
- 永远不要在 app 目录中共置组件、类型或工具。这是反模式
- 确保应用始终有匹配 "/" 的路由，它可能在分组路由内

---

## 📦 库偏好

- 不要使用已从 React Native 移除的模块如 Picker, WebView, SafeAreaView, AsyncStorage
- 不要使用旧版 expo-permissions
- expo-audio 而非 expo-av
- expo-video 而非 expo-av
- expo-image 配合 source="sf:name" 用于 SF Symbols，而非 expo-symbols 或 @expo/vector-icons
- react-native-safe-area-context 而非 react-native SafeAreaView
- process.env.EXPO_OS 而非 Platform.OS
- React.use 而非 React.useContext
- expo-image Image 组件而非固有元素 img
- expo-glass-effect 用于液态玻璃背景

---

## 📱 响应式

- 始终在滚动视图中包装根组件以实现响应式
- 使用 <Screen> 而非 <ScrollView> 以获得更智能的安全区域插入
- contentInsetAdjustmentBehavior="automatic" 也应应用于 FlatList 和 SectionList
- 使用 flexbox 而非 Dimensions API
- 始终优先使用 useWindowDimensions 而非 Dimensions.get() 来测量屏幕尺寸

---

## 🎨 样式

遵循 Apple 人机界面指南。

### 通用样式规则

- 优先使用 flex gap 而非 margin 和 padding 样式
- 尽可能使用 padding 而非 margin
- 始终考虑安全区域
- 内联样式而非 StyleSheet.create，除非重用样式更快
- 为状态变化添加进入和退出动画
- 使用 { borderCurve: 'continuous' } 用于圆角
- 始终使用导航堆栈标题而非页面上的自定义文本元素
- CSS 和 Tailwind 不支持 - 使用内联样式

### 阴影

使用 CSS boxShadow 样式属性。**永不**使用旧版 React Native shadow 或 elevation 样式。

```jsx
<View style={{ boxShadow: "0 1px 2px rgba(0, 0, 0, 0.05)" }} />
```

---

## 🔗 导航

### Link

使用来自 'expo-router' 的 `<Link href="/path" />` 进行路由间导航：

```jsx
import { Link } from 'expo-router';

// 基本链接
<Link href="/path" />

// 包装自定义组件
<Link href="/path" asChild>
  <Pressable>...</Pressable>
</Link>
```

### Stack

- 始终使用 _layout.tsx 文件定义堆栈
- 使用来自 'expo-router/stack' 的 Stack 进行原生导航堆栈

### Modal

将屏幕呈现为模态框：

```jsx
<Stack.Screen name="modal" options={{ presentation: "modal" }} />
```

### Sheet

将屏幕呈现为动态表单：

```jsx
<Stack.Screen
  name="sheet"
  options={{
    presentation: "formSheet",
    sheetGrabberVisible: true,
    sheetAllowedDetents: [0.5, 1.0],
    contentStyle: { backgroundColor: "transparent" },
  }}
/>
```

---

## 🔒 安全检查

此技能不包含任何恶意代码。所有内容均为 Expo 开发最佳实践指南。

---

*翻译自: https://github.com/yanghao1143/chiclaude-skills
