# Playground Builder

一个 playground 是一个独立的 HTML 文件，一侧有交互式控件，另一侧有实时预览，底部有带复制按钮的 prompt 输出。用户调整控件，可视化探索，然后将生成的 prompt 复制回 Claude。

## 何时使用此技能

当用户请求为某个主题创建交互式 playground、explorer 或可视化工具时——特别是当输入空间庞大、可视化或结构化，难以用纯文本表达时。

## 如何使用此技能

1. **从用户请求中识别 playground 类型**
2. **从 `templates/` 加载匹配的模板**：
   - `templates/design-playground.md` — 视觉设计决策（组件、布局、间距、颜色、排版）
   - `templates/data-explorer.md` — 数据和查询构建（SQL、API、pipeline、regex）
   - `templates/concept-map.md` — 学习和探索（概念图、知识盲区、范围映射）
   - `templates/document-critique.md` — 文档审查（带批准/拒绝/评论工作流的建议）
   - `templates/diff-review.md` — 代码审查（git diff、commit、PR 的逐行评论）
   - `templates/code-map.md` — 代码库架构（组件关系、数据流、层级图）
3. **按照模板构建 playground**。如果主题不完全符合任何模板，使用最接近的模板并进行调整。
4. **在浏览器中打开**。写入 HTML 文件后，运行 `open <filename>.html` 在用户的默认浏览器中启动它。

## 核心要求（每个 playground）

- **单个 HTML 文件**。内联所有 CSS 和 JS。无外部依赖。
- **实时预览**。每次控件更改时立即更新。无需"应用"按钮。
- **Prompt 输出**。自然语言，而非值的堆砌。仅提及非默认选择。包含足够的上下文，无需查看 playground 即可执行操作。实时更新。
- **复制按钮**。剪贴板复制，带简短的"已复制！"反馈。
- **合理的默认值 + 预设**。首次加载时外观良好。包含 3-5 个命名预设，将所有控件快速设置为一致的组合。
- **深色主题**。UI 使用系统字体，代码/值使用等宽字体。极简界面。

## 状态管理模式

保持单一状态对象。每个控件写入它，每次渲染从它读取。

```javascript
const state = { /* 所有可配置的值 */ };

function updateAll() {
  renderPreview(); // 更新视觉效果
  updatePrompt();  // 重建 prompt 文本
}
// 每个控件在更改时调用 updateAll()
```

## Prompt 输出模式

```javascript
function updatePrompt() {
  const parts = [];

  // 仅提及非默认值
  if (state.borderRadius !== DEFAULTS.borderRadius) {
    parts.push(`border-radius 为 ${state.borderRadius}px`);
  }

  // 在数字旁使用定性语言
  if (state.shadowBlur > 16) parts.push('明显的阴影');
  else if (state.shadowBlur > 0) parts.push('微妙的阴影');

  prompt.textContent = `更新卡片以使用 ${parts.join('、')}。`;
}
```

## 要避免的常见错误

- Prompt 输出只是值的堆砌 → 将其写成自然指令
- 一次性显示太多控件 → 按关注点分组，将高级选项隐藏在可折叠部分
- 预览未立即更新 → 每次控件更改必须触发立即重新渲染
- 没有默认值或预设 → 加载时为空或损坏
- 外部依赖 → 如果 CDN 宕机，playground 就无法使用
- Prompt 缺乏上下文 → 包含足够的信息，使其在没有 playground 的情况下也可执行

---

*本技能来自 AI Agent 技能生态，由 AI论坛运营中心 汉化*