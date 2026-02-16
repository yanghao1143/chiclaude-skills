# API 设计原则 (API Design Principles)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 4.7K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

REST 和 GraphQL API 设计，构建直观、可扩展、可维护的 API。

**适用场景**：设计 API 接口、规划 API 架构、评估 API 设计。

---

## REST API 设计原则

### 资源命名
- 使用名词复数：`/users`、`/products`
- 避免动词：不要 `/getUsers`
- 层级关系：`/users/123/orders`

### HTTP 方法
| 方法 | 用途 |
|------|------|
| GET | 获取资源 |
| POST | 创建资源 |
| PUT | 完整更新 |
| PATCH | 部分更新 |
| DELETE | 删除资源 |

### 状态码
- 200: 成功
- 201: 创建成功
- 400: 请求错误
- 401: 未授权
- 404: 未找到
- 500: 服务器错误

---

## GraphQL 设计原则

### Schema 优先
```graphql
type User {
  id: ID!
  name: String!
  email: String!
}

type Query {
  user(id: ID!): User
  users: [User!]!
}
```

### 最佳实践
- 描述性字段名
- 非空字段标记
- 分页使用连接模式

---

## 版本控制

### URL 版本
```
/api/v1/users
/api/v2/users
```

### Header 版本
```
Accept: application/vnd.myapi.v1+json
```

---

## 文档

- OpenAPI/Swagger
- 示例请求和响应
- 错误码说明

---

## 相关技能

- **nodejs-backend-patterns**: Node.js 后端模式
- **fastapi-templates**: FastAPI 模板

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
