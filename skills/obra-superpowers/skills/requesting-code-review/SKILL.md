# Requesting Code Review - 请求代码审查

> **原始仓库**: `obra/superpowers/requesting-code-review`
> **安装量**: 5.2K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

完成任务、实现主要功能或在合并前使用，以验证工作满足需求。

---

## 🔒 核心原则

**审查要早，审查要勤。**

---

## 📋 何时请求审查

### 强制
- 子代理驱动开发中每个任务后
- 完成主要功能后
- 合并到主分支前

### 可选但有价值
- 卡住时（新鲜视角）
- 重构前（基线检查）
- 修复复杂 bug 后

---

## 🔧 如何请求

### 1. 获取 git SHAs

```bash
BASE_SHA=$(git rev-parse HEAD~1)  # 或 origin/main
HEAD_SHA=$(git rev-parse HEAD)
```

### 2. 分派 code-reviewer 子代理

使用 Task 工具，填写模板

**占位符：**
- `{WHAT_WAS_IMPLEMENTED}` - 你刚构建了什么
- `{PLAN_OR_REQUIREMENTS}` - 它应该做什么
- `{BASE_SHA}` - 起始提交
- `{HEAD_SHA}` - 结束提交
- `{DESCRIPTION}` - 简要摘要

### 3. 根据反馈行动

- **立即修复** Critical 问题
- **继续前修复** Important 问题
- **稍后记录** Minor 问题
- 如果审查者错误则反驳（附理由）

---

## 📐 工作流集成

### 子代理驱动开发
- 每个任务后审查
- 在问题叠加前捕获
- 修复后再移到下一个任务

### 执行计划
- 每批后审查（3 个任务）
- 获取反馈、应用、继续

### 临时开发
- 合并前审查
- 卡住时审查

---

## 🚩 红旗警告

**永远不要：**
- 跳过审查因为"它很简单"
- 忽略 Critical 问题
- 带着未修复的 Important 问题继续
- 与有效的技术反馈争论

**如果审查者错了：**
- 用技术推理反驳
- 展示证明它有效的代码/测试
- 请求澄清

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [GitHub 仓库](https://github.com/obra/superpowers)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
