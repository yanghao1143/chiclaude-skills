# shadcn/ui 组件库 (shadcn-ui)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 5.1K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

使用 shadcn/ui 构建美观、可访问的 React 组件。

**适用场景**：使用 shadcn/ui 组件库构建 React 应用界面。

---

## 安装

```bash
npx shadcn@latest init
```

---

## 添加组件

```bash
npx shadcn@latest add button
npx shadcn@latest add card
npx shadcn@latest add dialog
npx shadcn@latest add form
```

---

## 使用组件

### Button
```jsx
import { Button } from "@/components/ui/button"

<Button variant="default">Click me</Button>
<Button variant="destructive">Delete</Button>
<Button variant="outline">Cancel</Button>
```

### Card
```jsx
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card"

<Card>
  <CardHeader>
    <CardTitle>Card Title</CardTitle>
    <CardDescription>Card description</CardDescription>
  </CardHeader>
  <CardContent>
    Content here
  </CardContent>
</Card>
```

### Dialog
```jsx
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog"

<Dialog>
  <DialogTrigger>Open</DialogTrigger>
  <DialogContent>
    <DialogHeader>
      <DialogTitle>Title</DialogTitle>
      <DialogDescription>Description</DialogDescription>
    </DialogHeader>
  </DialogContent>
</Dialog>
```

---

## 主题定制

```css
/* globals.css */
@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 222.2 84% 4.9%;
    --primary: 222.2 47.4% 11.2%;
    --secondary: 210 40% 96.1%;
  }
}
```

---

## 相关技能

- **react-components**: React 组件设计
- **vite**: Vite 构建工具

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
