# AI SDK

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 4.9K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

Vercel AI SDK，用于构建 AI 驱动的应用。

**适用场景**：使用 Vercel AI SDK 构建 AI 应用、聊天机器人、文本生成功能。

---

## 核心功能

### 文本生成
```typescript
import { generateText } from 'ai';

const { text } = await generateText({
  model: openai('gpt-4'),
  prompt: 'Write a poem about the sea.',
});
```

### 流式响应
```typescript
import { streamText } from 'ai';

const result = await streamText({
  model: openai('gpt-4'),
  prompt: 'Tell me a story.',
});

for await (const textPart of result.textStream) {
  console.log(textPart);
}
```

### 聊天功能
```typescript
import { useChat } from 'ai/react';

function Chat() {
  const { messages, input, handleSubmit } = useChat();

  return (
    <form onSubmit={handleSubmit}>
      {messages.map(m => (
        <div key={m.id}>{m.content}</div>
      ))}
      <input value={input} onChange={e => setInput(e.target.value)} />
    </form>
  );
}
```

---

## 支持的提供商

- OpenAI
- Anthropic
- Google
- Mistral
- Cohere
- 自定义

---

## 相关技能

- **vite**: Vite 构建
- **api-design-principles**: API 设计

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
