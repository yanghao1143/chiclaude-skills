# Vercel React 最佳实践

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 134K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

由 Vercel 维护的 React 和 Next.js 应用程序综合性能优化指南。包含跨越8个类别的57条规则，按影响程度优先排序，用于指导自动重构和代码生成。

---

## 何时应用

在以下情况下参考这些指南：

- 编写新的React组件或Next.js页面
- 实现数据获取（客户端或服务端）
- 检查代码的性能问题
- 重构现有的React/Next.js代码
- 优化包大小或加载时间

---

## 按优先级排序的规则类别

| 优先级 | 类别 | 影响 | 前缀 |
|--------|------|------|------|
| 1 | 消除瀑布流 🔴 | 关键 | async- |
| 2 | 包体积优化 🔴 | 关键 | bundle- |
| 3 | 服务端性能 🟠 | 高 | server- |
| 4 | 客户端数据获取 🟡 | 中高 | client- |
| 5 | 重渲染优化 🟡 | 中 | rerender- |
| 6 | 渲染性能 🟡 | 中 | rendering- |
| 7 | JavaScript性能 🟢 | 低中 | js- |
| 8 | 高级模式 ⚪ | 低 | advanced- |

---

## 快速参考

### 1. 消除瀑布流 (关键) 🔴

- `async-defer-await` - 将 await 移到实际使用的分支中
- `async-parallel` - 使用 `Promise.all()` 进行独立操作
- `async-dependencies` - 使用 `better-all` 处理部分依赖
- `async-api-routes` - 在 API 路由中尽早启动 promise，延迟 await
- `async-suspense-boundaries` - 使用 Suspense 流式传输内容

### 2. 包体积优化 (关键) 🔴

- `bundle-barrel-imports` - 直接导入，避免 barrel 文件
- `bundle-dynamic-imports` - 使用 `next/dynamic` 加载重组件
- `bundle-defer-third-party` - 在水合后加载分析/日志
- `bundle-conditional` - 仅当功能激活时加载模块
- `bundle-preload` - 在悬停/聚焦时预加载以提升感知速度

### 3. 服务端性能 (高) 🟠

- `server-auth-actions` - 像API路由一样认证服务端 actions
- `server-cache-react` - 使用 `React.cache()` 进行请求级去重
- `server-cache-lru` - 使用 LRU 缓存进行跨请求缓存
- `server-dedup-props` - 避免 RSC props 中的重复序列化
- `server-serialization` - 最小化传递给客户端组件的数据
- `server-parallel-fetching` - 重构组件以并行获取
- `server-after-nonblocking` - 使用 `after()` 进行非阻塞操作

### 4. 客户端数据获取 (中高) 🟡

- `client-swr-dedup` - 使用 SWR 自动去重请求
- `client-event-listeners` - 去重全局事件监听器
- `client-passive-event-listeners` - 对滚动使用被动监听器
- `client-localstorage-schema` - 版本化并最小化 localStorage 数据

### 5. 重渲染优化 (中) 🟡

- `rerender-defer-reads` - 不要订阅仅在回调中使用的状态
- `rerender-memo` - 将昂贵的工作提取到记忆化组件中
- `rerender-memo-with-default-value` - 提升默认非原始 props
- `rerender-dependencies` - 在 effects 中使用原始依赖项
- `rerender-derived-state` - 订阅派生布尔值，而非原始值
- `rerender-derived-state-no-effect` - 在渲染时派生状态，而非 effects
- `rerender-functional-setstate` - 使用函数式 setState 以保持稳定回调
- `rerender-lazy-state-init` - 将函数传递给 useState 以处理昂贵值
- `rerender-simple-expression-in-memo` - 对简单原始值避免使用 memo
- `rerender-move-effect-to-event` - 将交互逻辑放在事件处理程序中
- `rerender-transitions` - 使用 `startTransition` 处理非紧急更新
- `rerender-use-ref-transient-values` - 使用 refs 处理瞬态频繁值

### 6. 渲染性能 (中) 🟡

- `rendering-animate-svg-wrapper` - 动画化 div 包装器，而非 SVG 元素
- `rendering-content-visibility` - 对长列表使用 `content-visibility`
- `rendering-hoist-jsx` - 在组件外提取静态 JSX
- `rendering-svg-precision` - 减少 SVG 坐标精度
- `rendering-hydration-no-flicker` - 使用内联脚本处理客户端数据
- `rendering-hydration-suppress-warning` - 抑制预期的不匹配警告
- `rendering-activity` - 使用 Activity 组件进行显示/隐藏
- `rendering-conditional-render` - 使用三元运算符而非 `&&` 进行条件渲染
- `rendering-usetransition-loading` - 优先使用 `useTransition` 处理加载状态

### 7. JavaScript性能 (低中) 🟢

- `js-batch-dom-css` - 通过类或 cssText 分组 CSS 更改
- `js-index-maps` - 构建用于重复查找的 Map
- `js-cache-property-access` - 在循环中缓存对象属性
- `js-cache-function-results` - 在模块级 Map 中缓存函数结果
- `js-cache-storage` - 缓存 localStorage/sessionStorage 读取
- `js-combine-iterations` - 将多个 filter/map 合并为一个循环
- `js-length-check-first` - 在昂贵的比较前检查数组长度
- `js-early-exit` - 从函数中提前返回
- `js-hoist-regexp` - 在循环外提升 RegExp 创建
- `js-min-max-loop` - 使用循环而非排序来查找 min/max
- `js-set-map-lookups` - 使用 Set/Map 进行 O(1) 查找
- `js-tosorted-immutable` - 使用 `toSorted()` 保持不可变性

### 8. 高级模式 (低) ⚪

- `advanced-event-handler-refs` - 在 refs 中存储事件处理程序
- `advanced-init-once` - 每次应用加载时初始化应用一次
- `advanced-use-latest` - 使用 `useLatest` 获取稳定回调 refs

---

## 如何使用

阅读各个规则文件以获取详细说明和代码示例：

```
rules/async-parallel.md
rules/bundle-barrel-imports.md
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
