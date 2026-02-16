我来帮你翻译这个 AI Agent 技能文档。我会保持格式不变，专业术语保留英文，并按照你的要求进行翻译。

<write_to_file>
<path>translated-skill.md</path>
<content>---
name: example-skill
description: 当用户要求"演示技能"、"展示技能格式"、"创建技能模板"或讨论技能开发模式时应使用此技能。为创建 Claude Code 插件技能提供参考模板。
version: 1.0.0
---

# 示例技能

此技能演示了 Claude Code 插件技能的结构和格式。

## 概述

技能是由模型调用的能力，Claude 会根据任务上下文自主使用。与命令(用户调用)或 Agent(由 Claude 生成)不同，技能提供上下文指导，Claude 会将其融入响应中。

## 何时应用此技能

当用户的请求涉及以下内容时，此技能会激活：
- 创建或理解插件技能
- 技能模板或参考需求
- 技能开发模式

## 技能结构

### 必需文件

```
skills/
└── skill-name/
    └── SKILL.md          # 主技能定义文件(必需)
```

### 可选支持文件

```
skills/
└── skill-name/
    ├── SKILL.md          # 主技能定义文件
    ├── README.md         # 附加文档
    ├── references/       # 参考资料
    │   └── patterns.md
    ├── examples/         # 示例文件
    │   └── sample.md
    └── scripts/          # 辅助脚本
        └── helper.sh
```

## Frontmatter 选项

技能支持以下 frontmatter 字段：

- **name**(必需)：技能标识符
- **description**(必需)：触发条件 - 描述 Claude 何时应使用此技能
- **version**(可选)：语义化版本号
- **license**(可选)：许可证信息或引用

## 编写有效的描述

description 字段至关重要 - 它告诉 Claude 何时调用该技能。

**良好的描述模式：**
```yaml
description: 当用户要求"特定短语"、"另一个短语"、提到"关键词"或讨论主题领域时应使用此技能。
```

**应包含：**
- 用户可能说的特定触发短语
- 表明相关性的关键词
- 技能涵盖的主题领域

## 技能内容指南

1. **明确目的**：说明技能的帮助内容
2. **使用时机**：定义激活条件
3. **结构化指导**：逻辑性地组织信息
4. **可操作的指令**：提供具体步骤
5. **示例**：在有帮助时包含实际示例

## 最佳实践

- 保持技能专注于单一领域
- 编写清晰指示何时激活的描述
- 对于复杂技能，在子目录中包含参考资料
- 测试技能是否针对预期查询激活
- 避免与其他技能的触发条件重叠

---

*本技能来自 AI Agent 技能生态，由 AI论坛运营中心 汉化*
</content>
</write_to_file>

翻译完成！我已经按照你的要求：

1. ✅ 保持了 Markdown 格式不变
2. ✅ frontmatter 的 key 保持英文，value 翻译成中文
3. ✅ 代码块内的注释已翻译，代码保持不变
4. ✅ 专业术语保留英文（Claude、Agent、API、frontmatter 等）
5. ✅ 在文件末尾添加了汉化声明

翻译已保存到 `translated-skill.md` 文件中。