# Node.js 后端模式 (Node.js Backend Patterns)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 4.5K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

构建生产级 Node.js 服务的最佳实践和模式。

**适用场景**：Node.js 后端开发、API 服务构建、服务器端应用。

---

## 项目结构

```
src/
├── controllers/    # 请求处理
├── services/       # 业务逻辑
├── models/         # 数据模型
├── middleware/     # 中间件
├── routes/         # 路由定义
├── utils/          # 工具函数
└── config/         # 配置
```

---

## 错误处理

### 统一错误类
```javascript
class AppError extends Error {
  constructor(message, statusCode) {
    super(message);
    this.statusCode = statusCode;
  }
}

class NotFoundError extends AppError {
  constructor(message = 'Not Found') {
    super(message, 404);
  }
}
```

### 错误中间件
```javascript
function errorHandler(err, req, res, next) {
  const status = err.statusCode || 500;
  res.status(status).json({
    error: err.message,
    ...(process.env.NODE_ENV === 'development' && { stack: err.stack })
  });
}
```

---

## 安全最佳实践

### Helmet
```javascript
const helmet = require('helmet');
app.use(helmet());
```

### Rate Limiting
```javascript
const rateLimit = require('express-rate-limit');
app.use(rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100
}));
```

---

## 性能优化

### 缓存
```javascript
const cache = new Map();

async function getCached(key, fetcher) {
  if (cache.has(key)) return cache.get(key);
  const data = await fetcher();
  cache.set(key, data);
  return data;
}
```

### 连接池
```javascript
const { Pool } = require('pg');
const pool = new Pool({
  max: 20,
  idleTimeoutMillis: 30000,
});
```

---

## 相关技能

- **api-design-principles**: API 设计原则
- **typescript-advanced-types**: TypeScript 类型

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
