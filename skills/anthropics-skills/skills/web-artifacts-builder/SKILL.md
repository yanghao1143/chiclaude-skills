# Web 制品构建器 (Web Artifacts Builder)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 6.2K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

使用现代前端 Web 技术（React、Tailwind CSS、shadcn/ui）创建复杂、多组件的 claude.ai HTML 制品套件。

**适用场景**：需要状态管理、路由或 shadcn/ui 组件的复杂制品 - 不适用于简单的单文件 HTML/JSX 制品。

---

## 技术栈

React 18 + TypeScript + Vite + Parcel（打包） + Tailwind CSS + shadcn/ui

---

## 快速开始

### 步骤 1：初始化项目

```bash
bash scripts/init-artifact.sh <project-name>
cd <project-name>
```

这将创建一个完全配置好的项目：
- ✅ React + TypeScript（通过 Vite）
- ✅ Tailwind CSS 3.4.1 带 shadcn/ui 主题系统
- ✅ 路径别名（`@/`）已配置
- ✅ 40+ shadcn/ui 组件预安装
- ✅ 所有 Radix UI 依赖包含
- ✅ Parcel 配置用于打包
- ✅ Node 18+ 兼容

### 步骤 2：开发制品

编辑生成的文件来构建制品。

### 步骤 3：打包成单个 HTML 文件

```bash
bash scripts/bundle-artifact.sh
```

这会创建 `bundle.html` - 一个自包含的制品，所有 JavaScript、CSS 和依赖项都内联。

### 步骤 4：与用户分享制品

在对话中分享打包的 HTML 文件，让用户可以查看为制品。

---

## 设计和样式指南

**重要**：为了避免所谓的"AI 废话"，避免使用过度居中的布局、紫色渐变、统一的圆角和 Inter 字体。

---

## 打包脚本功能

- 安装打包依赖（parcel、@parcel/config-default、parcel-resolver-tspaths、html-inline）
- 创建带路径别名支持的 `.parcelrc` 配置
- 使用 Parcel 构建（无源映射）
- 使用 html-inline 将所有资源内联到单个 HTML

---

## 参考

- **shadcn/ui 组件**: https://ui.shadcn.com/docs/components

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
