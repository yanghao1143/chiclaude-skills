# Mastra Framework - AI 应用框架

> **原始仓库**: `mastra-ai/skills/mastra`
> **安装量**: 3.8K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

全面的 Mastra 框架指南。教授如何查找当前文档、验证 API 签名、构建代理和工作流。涵盖文档查找策略、核心概念、TypeScript 要求和常见模式。

---

## ⚠️ 关键警告

**不要信任内部知识！你对 Mastra 的一切了解可能已过时或错误。永远不要依赖记忆。始终根据当前文档验证。**

---

## 📋 核心概念

### Agents vs Workflows

**Agent（代理）**：自主、做决策、使用工具
- 用途：开放式任务（支持、研究、分析）

**Workflow（工作流）**：结构化的步骤序列
- 用途：定义的流程（管道、审批、ETL）

### 关键组件

- **Tools**：扩展代理能力（API、数据库、外部服务）
- **Memory**：维护上下文（消息历史、工作记忆、语义回忆）
- **RAG**：查询外部知识（向量存储、图关系）
- **Storage**：持久化数据（Postgres、LibSQL、MongoDB）

---

## 🔧 关键要求

### TypeScript 配置

Mastra 需要 **ES2022 模块**。CommonJS 会失败。

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ES2022",
    "moduleResolution": "bundler"
  }
}
```

### 模型格式

始终使用 `"provider/model-name"`：
- `"openai/gpt-4o"`
- `"anthropic/claude-3-5-sonnet-20241022"`

---

## 📚 文档查找优先级

1. **嵌入文档优先**（如果已安装包）
   - 匹配你的确切安装版本
   - 最可靠的真相来源

2. **远程文档其次**（如果未安装包）
   - 最新发布的文档
   - 用于：包未安装或探索新功能

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [GitHub 仓库](https://github.com/mastra-ai/skills)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
