# 🔥 [No.011] UI/UX Pro Max - 设计智能

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 26.3K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

Web 和移动应用的全面设计指南。包含 50+ 风格、97 种调色板、57 种字体配对、99 条 UX 指南、25 种图表类型，涵盖 9 种技术栈。支持优先级推荐的可搜索数据库。

---

## 何时使用

在以下情况下参考这些指南：

- 设计新的 UI 组件或页面
- 选择调色板和字体
- 审查代码中的 UX 问题
- 构建落地页或仪表板
- 实现无障碍要求

---

## 按优先级排序的规则类别

| 优先级 | 类别 | 影响程度 | 领域 |
|--------|------|----------|------|
| 1 | 无障碍性 | 关键 | ux |
| 2 | 触控与交互 | 关键 | ux |
| 3 | 性能 | 高 | ux |
| 4 | 布局与响应式 | 高 | ux |
| 5 | 字体与颜色 | 中等 | typography, color |
| 6 | 动画 | 中等 | ux |
| 7 | 风格选择 | 中等 | style, product |
| 8 | 图表与数据 | 低 | chart |

---

## 快速参考

### 1. 无障碍性（关键）

- `color-contrast` - 普通文本最低 4.5:1 对比度
- `focus-states` - 交互元素上可见的焦点环
- `alt-text` - 有意义图片的描述性替代文本
- `aria-labels` - 纯图标按钮的 aria-label
- `keyboard-nav` - Tab 顺序与视觉顺序一致
- `form-labels` - 使用 label 的 for 属性

### 2. 触控与交互（关键）

- `touch-target-size` - 最小 44x44px 触控目标
- `hover-vs-tap` - 主要交互使用点击/轻触
- `loading-buttons` - 异步操作期间禁用按钮
- `error-feedback` - 问题附近显示清晰的错误消息
- `cursor-pointer` - 为可点击元素添加 cursor-pointer

### 3. 性能（高）

- `image-optimization` - 使用 WebP、srcset、懒加载
- `reduced-motion` - 检查 prefers-reduced-motion
- `content-jumping` - 为异步内容预留空间

### 4. 布局与响应式（高）

- `viewport-meta` - width=device-width initial-scale=1
- `readable-font-size` - 移动端正文最小 16px
- `horizontal-scroll` - 确保内容适应视口宽度
- `z-index-management` - 定义 z-index 层级 (10, 20, 30, 50)

### 5. 字体与颜色（中等）

- `line-height` - 正文使用 1.5-1.75
- `line-length` - 每行限制 65-75 个字符
- `font-pairing` - 匹配标题/正文字体个性

### 6. 动画（中等）

- `duration-timing` - 微交互使用 150-300ms
- `transform-performance` - 使用 transform/opacity，而非 width/height
- `loading-states` - 骨架屏或加载指示器

---

## 如何使用

### 第一步：分析用户需求

从用户请求中提取关键信息：
- 产品类型：SaaS、电商、作品集、仪表板、落地页等
- 风格关键词：极简、活泼、专业、优雅、暗色模式等
- 行业：医疗、金融科技、游戏、教育等
- 技术栈：React、Vue、Next.js 或默认 html-tailwind

### 第二步：生成设计系统（必需）

```bash
python3 skills/ui-ux-pro-max/scripts/search.py "<产品类型> <行业> <关键词>" --design-system -p "项目名称"
```

### 第三步：补充详细搜索（按需）

```bash
python3 skills/ui-ux-pro-max/scripts/search.py "<关键词>" --domain <domain> [-n <最大结果数>]
```

### 第四步：技术栈指南（默认：html-tailwind）

```bash
python3 skills/ui-ux-pro-max/scripts/search.py "<关键词>" --stack html-tailwind
```

可用技术栈：html-tailwind、react、nextjs、vue、svelte、swiftui、react-native、flutter、shadcn、jetpack-compose

---

## 专业 UI 常见规则

### 图标与视觉元素

| 规则 | 推荐 | 避免 |
|------|------|------|
| 不使用表情符号图标 | 使用 SVG 图标（Heroicons、Lucide、Simple Icons） | 使用 🎨 🚀 ⚙️ 等表情符号作为 UI 图标 |
| 稳定的悬停状态 | 使用颜色/透明度过渡 | 使用会移动布局的缩放变换 |
| 正确的品牌 Logo | 从 Simple Icons 研究官方 SVG | 猜测或使用错误的 Logo 路径 |
| 一致的图标大小 | 使用固定 viewBox (24x24) 和 w-6 h-6 | 随机混合不同图标大小 |

### 交互与光标

| 规则 | 推荐 | 避免 |
|------|------|------|
| Cursor pointer | 为所有可点击/可悬停的卡片添加 cursor-pointer | 交互元素上保留默认光标 |
| 悬停反馈 | 提供视觉反馈（颜色、阴影、边框） | 没有元素可交互的指示 |
| 平滑过渡 | 使用 transition-colors duration-200 | 瞬间状态变化或太慢（>500ms） |

---

## 交付前检查清单

### 视觉质量
- [ ] 不使用表情符号作为图标（使用 SVG）
- [ ] 所有图标来自一致的图标集（Heroicons/Lucide）
- [ ] 品牌 Logo 正确（从 Simple Icons 验证）
- [ ] 悬停状态不会导致布局偏移
- [ ] 直接使用主题颜色（bg-primary）而非 var() 包装

### 交互
- [ ] 所有可点击元素有 cursor-pointer
- [ ] 悬停状态提供清晰的视觉反馈
- [ ] 过渡平滑（150-300ms）
- [ ] 键盘导航的焦点状态可见

### 亮/暗模式
- [ ] 亮色模式文本有足够对比度（最低 4.5:1）
- [ ] 玻璃/透明元素在亮色模式可见
- [ ] 两种模式下的边框可见
- [ ] 交付前测试两种模式

### 布局
- [ ] 浮动元素与边缘有适当间距
- [ ] 没有内容隐藏在固定导航栏后
- [ ] 在 375px、768px、1024px、1440px 响应式
- [ ] 移动端无水平滚动

### 无障碍性
- [ ] 所有图片有替代文本
- [ ] 表单输入有标签
- [ ] 颜色不是唯一的指示器
- [ ] 尊重 prefers-reduced-motion

---

## 典型应用场景

- 🎨 Landing page 设计和开发
- 📊 Dashboard 和管理界面
- 🛍️ 电商前端界面
- 📱 移动应用 Web 版本
- 🎮 游戏和应用界面设计

---

*翻译搬运自 [skills.sh](https://github.com/yanghao1143/chiclaude-skills)*

📌 *Skills市场搬运计划 - 热门技能系列 - No.011*
