# Web Interface Guidelines（Web界面指南）

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 100.9K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

审查文件是否符合 Web Interface Guidelines（Web界面指南）。

---

## 工作原理

- 从下方源URL获取最新指南
- 读取指定文件（或提示用户提供文件/模式）
- 对照获取的指南中的所有规则进行检查
- 以简洁的 `文件:行号` 格式输出发现的问题

---

## 指南来源

每次审查前获取最新指南：

```
https://raw.githubusercontent.com/vercel-labs/web-interface-guidelines/main/command.md
```

使用 WebFetch 检索最新规则。获取的内容包含所有规则和输出格式说明。

---

## 使用方法

当用户提供文件或模式参数时：
- 从上述源URL获取指南
- 读取指定文件
- 应用获取的指南中的所有规则
- 使用指南中指定的格式输出发现的问题

如果未指定文件，询问用户要审查哪些文件。

---

## 审查流程

1. **获取指南** - 从GitHub获取最新的Web界面指南
2. **读取文件** - 加载用户指定的源代码文件
3. **应用规则** - 对照所有指南规则检查代码
4. **输出结果** - 以标准格式报告问题和建议

---

## 典型应用场景

- 代码审查（Code Review）
- 设计系统一致性检查
- Web组件合规性验证
- 前端开发质量保证
- UI/UX标准审核

---

*翻译搬运自 [skills.sh](https://github.com/yanghao1143/chiclaude-skills)*
