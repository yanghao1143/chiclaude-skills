# 完成开发分支 (Finishing a Development Branch)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 5.6K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

指导开发工作的完成，通过展示结构化选项来决定如何整合工作。

**适用场景**：实现完成、所有测试通过，需要决定如何整合工作。

---

## 核心原则

**核心原则**：验证测试 → 展示选项 → 执行选择 → 清理。

---

## 流程

### 步骤 1：验证测试

**在展示选项之前，验证测试通过：**

```bash
# 运行项目的测试套件
npm test / cargo test / pytest / go test ./...
```

**如果测试失败**：
停止。不要进入步骤 2。

**如果测试通过**：继续步骤 2。

### 步骤 2：确定基础分支

```bash
git merge-base HEAD main 2>/dev/null || git merge-base HEAD master 2>/dev/null
```

### 步骤 3：展示选项

展示确切的 4 个选项：

```
实现完成。你想做什么？

1. 本地合并回 <base-branch>
2. 推送并创建 Pull Request
3. 保持分支原样（我稍后处理）
4. 丢弃这项工作

选择哪个选项？
```

### 步骤 4：执行选择

#### 选项 1：本地合并
```bash
git checkout <base-branch>
git pull
git merge <feature-branch>
<test command>
git branch -d <feature-branch>
```

#### 选项 2：推送并创建 PR
```bash
git push -u origin <feature-branch>
gh pr create --title "<title>" --body "..."
```

#### 选项 3：保持原样
报告分支状态，不清理工作树。

#### 选项 4：丢弃
确认后删除分支和工作树。

### 步骤 5：清理工作树

**选项 1、2、4**：清理工作树
**选项 3**：保持工作树

---

## 快速参考

| 选项 | 合并 | 推送 | 保持工作树 | 清理分支 |
|------|------|------|-----------|----------|
| 1. 本地合并 | ✓ | - | - | ✓ |
| 2. 创建 PR | - | ✓ | ✓ | - |
| 3. 保持原样 | - | - | ✓ | - |
| 4. 丢弃 | - | - | - | ✓ (强制) |

---

## 红旗警告

**永远不要**：
- 测试失败时继续
- 不验证就合并
- 没有确认就删除工作
- 没有明确要求就强制推送

**始终**：
- 在展示选项前验证测试
- 展示确切的 4 个选项
- 选项 4 获取输入确认
- 只对选项 1 和 4 清理工作树

---

## 相关技能

- **using-git-worktrees**: 使用 Git 工作树
- **subagent-driven-development**: 子代理驱动开发

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
