# Tailwind Design System (v4) - Tailwind 设计系统

> **原始仓库**: `wshobson/agents/tailwind-design-system`
> **安装量**: 7.0K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

使用 Tailwind CSS v4 构建生产级设计系统，包括 CSS 优先配置、设计令牌、组件变体、响应式模式和无障碍访问。

**注意**：此技能针对 Tailwind CSS v4（2024+）。对于 v3 项目，请参考[升级指南](https://tailwindcss.com/docs/upgrade-guide)。

---

## 🎯 何时使用此技能

- 使用 Tailwind v4 创建组件库
- 使用 CSS 优先配置实现设计令牌和主题
- 构建响应式和无障碍组件
- 标准化代码库中的 UI 模式
- 从 Tailwind v3 迁移到 v4
- 使用原生 CSS 功能设置暗色模式

---

## 📊 v4 关键变更

| v3 模式 | v4 模式 |
|---------|---------|
| tailwind.config.ts | CSS 中的 @theme |
| @tailwind base/components/utilities | @import "tailwindcss" |
| darkMode: "class" | @custom-variant dark (&:where(.dark, .dark *)) |
| theme.extend.colors | @theme { --color-*: value } |
| require("tailwindcss-animate") | @theme 中的 CSS @keyframes + @starting-style |

---

## 🚀 快速开始

```css
/* app.css - Tailwind v4 CSS 优先配置 */
@import "tailwindcss";

/* 使用 @theme 定义主题 */
@theme {
  /* 使用 OKLCH 的语义颜色令牌，更好的颜色感知 */
  --color-background: oklch(100% 0 0);
  --color-foreground: oklch(14.5% 0.025 264);

  --color-primary: oklch(14.5% 0.025 264);
  --color-primary-foreground: oklch(98% 0.01 264);

  --color-secondary: oklch(96% 0.01 264);
  --color-secondary-foreground: oklch(14.5% 0.025 264);

  --color-muted: oklch(96% 0.01 264);
  --color-muted-foreground: oklch(46% 0.02 264);

  --color-accent: oklch(96% 0.01 264);
  --color-accent-foreground: oklch(14.5% 0.025 264);

  --color-destructive: oklch(53% 0.22 27);
  --color-destructive-foreground: oklch(98% 0.01 264);

  --color-border: oklch(91% 0.01 264);
  --color-ring: oklch(14.5% 0.025 264);

  --color-card: oklch(100% 0 0);
  --color-card-foreground: oklch(14.5% 0.025 264);

  /* 焦点状态的 Ring 偏移 */
  --color-ring-offset: oklch(100% 0 0);

  /* 圆角令牌 */
  --radius-sm: 0.25rem;
  --radius-md: 0.375rem;
  --radius-lg: 0.5rem;
  --radius-xl: 0.75rem;

  /* 动画令牌 */
  --animate-fade-in: fade-in 0.2s ease-out;
  --animate-fade-out: fade-out 0.2s ease-in;

  @keyframes fade-in {
    from { opacity: 0; }
    to { opacity: 1; }
  }

  @keyframes fade-out {
    from { opacity: 1; }
    to { opacity: 0; }
  }
}

/* 暗色模式变体 */
@custom-variant dark (&:where(.dark, .dark *));

/* 暗色模式主题覆盖 */
.dark {
  --color-background: oklch(14.5% 0.025 264);
  --color-foreground: oklch(98% 0.01 264);
  /* ... */
}

/* 基础样式 */
@layer base {
  * {
    @apply border-border;
  }

  body {
    @apply bg-background text-foreground antialiased;
  }
}
```

---

## 🏗️ 核心概念

### 1. 设计令牌层次结构

```
品牌令牌（抽象）
 └── 语义令牌（用途）
     └── 组件令牌（特定）
```

示例：`oklch(45% 0.2 260)` → `--color-primary` → `bg-primary`

### 2. 组件架构

基础样式 → 变体 → 尺寸 → 状态 → 覆盖

---

## 📦 模式示例

### CVA (Class Variance Authority) 组件

```typescript
// components/ui/button.tsx
import { Slot } from '@radix-ui/react-slot'
import { cva, type VariantProps } from 'class-variance-authority'
import { cn } from '@/lib/utils'

const buttonVariants = cva(
  'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50',
  {
    variants: {
      variant: {
        default: 'bg-primary text-primary-foreground hover:bg-primary/90',
        destructive: 'bg-destructive text-destructive-foreground hover:bg-destructive/90',
        outline: 'border border-border bg-background hover:bg-accent hover:text-accent-foreground',
        secondary: 'bg-secondary text-secondary-foreground hover:bg-secondary/80',
        ghost: 'hover:bg-accent hover:text-accent-foreground',
        link: 'text-primary underline-offset-4 hover:underline',
      },
      size: {
        default: 'h-10 px-4 py-2',
        sm: 'h-9 rounded-md px-3',
        lg: 'h-11 rounded-md px-8',
        icon: 'size-10',
      },
    },
    defaultVariants: {
      variant: 'default',
      size: 'default',
    },
  }
)

// React 19: 不需要 forwardRef
export function Button({
  className,
  variant,
  size,
  asChild = false,
  ref,
  ...props
}: ButtonProps & { ref?: React.Ref<HTMLButtonElement> }) {
  const Comp = asChild ? Slot : 'button'
  return (
    <Comp
      className={cn(buttonVariants({ variant, size, className }))}
      ref={ref}
      {...props}
    />
  )
}
```

---

## 🔧 工具函数

```typescript
// lib/utils.ts
import { type ClassValue, clsx } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

// 焦点环工具
export const focusRing = cn(
  "focus-visible:outline-none focus-visible:ring-2",
  "focus-visible:ring-ring focus-visible:ring-offset-2",
);

// 禁用工具
export const disabled = "disabled:pointer-events-none disabled:opacity-50";
```

---

## 📋 v3 到 v4 迁移清单

- [ ] 用 CSS @theme 块替换 tailwind.config.ts
- [ ] 将 @tailwind base/components/utilities 更改为 @import "tailwindcss"
- [ ] 将颜色定义移至 @theme { --color-*: value }
- [ ] 用 @custom-variant dark 替换 darkMode: "class"
- [ ] 在 @theme 块内移动 @keyframes
- [ ] 用原生 CSS 动画替换 require("tailwindcss-animate")
- [ ] 更新 h-10 w-10 为 size-10（新工具）
- [ ] 删除 forwardRef（React 19 将 ref 作为 prop 传递）
- [ ] 考虑 OKLCH 颜色以获得更好的颜色感知
- [ ] 用 @utility 指令替换自定义插件

---

## 💡 最佳实践

### 应该

- 使用 @theme 块 - CSS 优先配置是 v4 的核心模式
- 使用 OKLCH 颜色 - 比 HSL 更好的感知均匀性
- 用 CVA 组合 - 类型安全变体
- 使用语义令牌 - bg-primary 而非 bg-blue-500
- 使用 size-* - w-* h-* 的新简写
- 添加无障碍 - ARIA 属性、焦点状态

### 不应该

- 不要使用 tailwind.config.ts - 改用 CSS @theme
- 不要使用 @tailwind 指令 - 改用 @import "tailwindcss"
- 不要使用 forwardRef - React 19 将 ref 作为 prop 传递
- 不要使用任意值 - 扩展 @theme 代替
- 不要硬编码颜色 - 使用语义令牌
- 不要忘记暗色模式 - 测试两种主题

---

## 📚 资源

- [Tailwind CSS v4 文档](https://tailwindcss.com/docs)
- [Tailwind v4 公告](https://tailwindcss.com/blog/tailwindcss-v4-beta)
- [CVA 文档](https://cva.style/docs)
- [shadcn/ui](https://ui.shadcn.com/)
- [Radix Primitives](https://www.radix-ui.com/primitives)

---

## 🔒 安全检查

此技能不包含任何恶意代码。所有内容均为 Tailwind CSS 开发最佳实践指南。

---

*翻译自: https://github.com/yanghao1143/chiclaude-skills
