# Turborepo

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 4.8K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

Turborepo 高性能 JavaScript/TypeScript monorepo 构建系统。

**适用场景**：管理 monorepo 项目、优化多包构建。

---

## 核心功能

### 智能缓存
- 远程缓存
- 增量构建
- 依赖感知

### 并行执行
- 任务并行化
- 拓扑排序
- 资源优化

---

## 配置

### turbo.json
```json
{
  "$schema": "https://turbo.build/schema.json",
  "pipeline": {
    "build": {
      "outputs": ["dist/**"],
      "dependsOn": ["^build"]
    },
    "test": {
      "dependsOn": ["build"]
    },
    "lint": {}
  }
}
```

---

## 常用命令

```bash
turbo run build     # 运行所有构建
turbo run test      # 运行所有测试
turbo run lint      # 运行所有 lint
turbo run build --filter=package-name  # 构建特定包
```

---

## Monorepo 结构

```
my-monorepo/
├── apps/
│   ├── web/
│   └── docs/
├── packages/
│   ├── ui/
│   └── config/
├── turbo.json
└── package.json
```

---

## 相关技能

- **monorepo-management**: Monorepo 管理
- **vite**: Vite 构建

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
