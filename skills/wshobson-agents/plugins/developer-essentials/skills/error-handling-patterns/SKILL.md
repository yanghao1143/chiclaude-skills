# 错误处理模式 - Error Handling Patterns

> **原始仓库**: `wshobson/agents/error-handling-patterns`
> **安装量**: 2.9K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

软件错误处理的最佳实践和模式，包括异常处理策略、错误传播、日志记录和用户友好的错误消息。

---

## 🎯 何时使用此技能

当用户进行以下工作时使用：

- 设计错误处理策略
- 实现异常处理
- 配置错误日志
- 构建容错系统

---

## 🔄 错误处理原则

### 1. 明确 vs 隐式

```python
# ❌ 隐式 - 忽略错误
try:
    result = some_operation()
except:
    pass

# ✅ 明确 - 处理特定错误
try:
    result = some_operation()
except ValidationError as e:
    logger.warning(f"Validation failed: {e}")
    raise
except DatabaseError as e:
    logger.error(f"Database error: {e}")
    raise ServiceUnavailableError("Service temporarily unavailable")
```

### 2. 错误分类

| 类型 | 示例 | 处理方式 |
|------|------|----------|
| 业务错误 | 验证失败 | 返回用户友好消息 |
| 系统错误 | 数据库连接 | 记录日志，重试 |
| 未知错误 | 意外异常 | 记录日志，上报 |

---

## 📝 错误处理模式

### Result 模式

```typescript
type Result<T, E = Error> = 
  | { success: true; data: T }
  | { success: false; error: E }

async function getUser(id: string): Promise<Result<User>> {
  try {
    const user = await db.users.find(id)
    return { success: true, data: user }
  } catch (e) {
    return { success: false, error: e }
  }
}

// 使用
const result = await getUser('123')
if (result.success) {
  console.log(result.data)
} else {
  console.error(result.error)
}
```

### 重试模式

```typescript
async function withRetry<T>(
  fn: () => Promise<T>,
  maxRetries = 3,
  delay = 1000
): Promise<T> {
  let lastError: Error
  
  for (let i = 0; i < maxRetries; i++) {
    try {
      return await fn()
    } catch (e) {
      lastError = e
      if (i < maxRetries - 1) {
        await sleep(delay * Math.pow(2, i))
      }
    }
  }
  
  throw lastError
}
```

### 熔断器模式

```typescript
class CircuitBreaker {
  private failures = 0
  private state: 'closed' | 'open' | 'half-open' = 'closed'
  
  async execute<T>(fn: () => Promise<T>): Promise<T> {
    if (this.state === 'open') {
      throw new Error('Circuit breaker is open')
    }
    
    try {
      const result = await fn()
      this.onSuccess()
      return result
    } catch (e) {
      this.onFailure()
      throw e
    }
  }
  
  private onSuccess() {
    this.failures = 0
    this.state = 'closed'
  }
  
  private onFailure() {
    this.failures++
    if (this.failures >= 5) {
      this.state = 'open'
    }
  }
}
```

---

## 📊 错误响应格式

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "用户输入验证失败",
    "details": [
      {
        "field": "email",
        "message": "邮箱格式不正确"
      }
    ],
    "requestId": "req_123456",
    "timestamp": "2026-02-15T12:00:00Z"
  }
}
```

---

## ✅ 最佳实践

1. **不吞掉错误** - 至少记录日志
2. **区分错误类型** - 业务错误 vs 系统错误
3. **提供上下文** - 错误消息包含相关信息
4. **用户友好** - 面向用户的错误消息清晰易懂
5. **记录日志** - 系统错误需要详细日志

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
