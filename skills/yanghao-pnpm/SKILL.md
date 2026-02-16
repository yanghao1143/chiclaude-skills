# pnpm 包管理器 - Node.js Package Manager

> **原始仓库**: `antfu/skills/pnpm`
> **安装量**: 3.8K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

pnpm 是一个快速、节省磁盘空间的 Node.js 包管理器。它使用内容寻址存储来跨机器上所有项目去重包，显著节省磁盘空间。pnpm 默认强制执行严格的依赖解析，防止幽灵依赖。

---

## 🎯 何时使用此技能

当用户进行以下工作时使用：

- 运行 pnpm 特定命令
- 配置工作空间
- 使用目录、补丁或覆盖管理依赖

---

## 🚀 快速入门

### 安装

```bash
# 使用 npm 安装
npm install -g pnpm

# 使用 Homebrew (macOS)
brew install pnpm

# 使用独立脚本
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

### 基本命令

```bash
# 安装依赖
pnpm install

# 添加依赖
pnpm add lodash
pnpm add -D typescript

# 运行脚本
pnpm run dev
pnpm test

# 执行包
pnpm dlx create-vite
```

---

## 📦 核心 CLI 命令

### 安装和添加

```bash
# 安装所有依赖
pnpm install

# 添加生产依赖
pnpm add express

# 添加开发依赖
pnpm add -D vite

# 添加全局包
pnpm add -g pm2

# 添加精确版本
pnpm add lodash@4.17.21
```

### 移除和更新

```bash
# 移除依赖
pnpm remove lodash

# 更新依赖
pnpm update

# 更新到最新版本
pnpm update --latest

# 更新特定包
pnpm update lodash
```

### 运行和执行

```bash
# 运行 package.json 脚本
pnpm run dev
pnpm run build

# 直接执行包
pnpm exec tsc --version

# 从注册表下载并执行
pnpm dlx create-vite my-app
```

---

## 🔧 配置

### pnpm-workspace.yaml

```yaml
# 工作空间配置
packages:
  - 'packages/*'
  - 'apps/*'
  - '!**/test/**'
```

### .npmrc

```ini
# 自动安装 peer 依赖
auto-install-peers=true

# 严格 peer 依赖
strict-peer-dependencies=false

# 使用私有注册表
registry=https://registry.npmmirror.com

# shamefully-hoist (不推荐但有时需要)
shamefully-hoist=true
```

---

## 🗂️ 工作空间

### 过滤命令

```bash
# 在特定包中运行
pnpm --filter @myorg/ui run build

# 在所有包中运行
pnpm -r run test

# 排除特定包
pnpm --filter '!@myorg/e2e' run build

# 只在变更的包中运行
pnpm --filter ...[origin/main] run test
```

### 工作空间协议

```json
{
  "dependencies": {
    "@myorg/utils": "workspace:*"
  }
}
```

---

## 📋 目录 (Catalogs)

集中管理工作空间依赖版本：

```yaml
# pnpm-workspace.yaml
catalogs:
  default:
    react: ^18.2.0
    react-dom: ^18.2.0
    typescript: ^5.3.0
  react17:
    react: ^17.0.0
    react-dom: ^17.0.0
```

```json
// package.json
{
  "dependencies": {
    "react": "catalog:",
    "react-dom": "catalog:"
  }
}
```

---

## 🔧 覆盖 (Overrides)

强制特定版本：

```json
{
  "pnpm": {
    "overrides": {
      "lodash": "4.17.21",
      "vulnerable-package": "^2.0.0"
    }
  }
}
```

---

## 🩹 补丁 (Patches)

修改第三方包：

```json
{
  "pnpm": {
    "patchedDependencies": {
      "express@4.18.2": "patches/express.patch"
    }
  }
}
```

生成补丁：

```bash
pnpm patch express@4.18.2
# 编辑文件...
pnpm patch-commit /tmp/123456
```

---

## ⚡ CI/CD 最佳实践

### GitHub Actions

```yaml
- name: 安装 pnpm
  uses: pnpm/action-setup@v2
  with:
    version: 8

- name: 安装依赖
  run: pnpm install --frozen-lockfile

- name: 运行测试
  run: pnpm test
```

### Docker

```dockerfile
FROM node:20-alpine

RUN npm install -g pnpm

WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

COPY . .
RUN pnpm build

CMD ["pnpm", "start"]
```

---

## 🔄 从 npm/Yarn 迁移

```bash
# 导入 lockfile
pnpm import

# 清理并重新安装
rm -rf node_modules
pnpm install
```

### 处理幽灵依赖

如果迁移后出现模块找不到错误：

```ini
# .npmrc
shamefully-hoist=true
# 或
public-hoist-pattern[]=*
```

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [GitHub 仓库](https://github.com/pnpm/pnpm)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
