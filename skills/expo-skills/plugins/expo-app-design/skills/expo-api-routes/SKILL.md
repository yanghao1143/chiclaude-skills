# Expo API 路由 (Expo API Routes)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 5.1K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

在 Expo 应用中使用 API Routes 构建后端功能。

**适用场景**：使用 Expo Router 构建 API 端点、服务端功能。

---

## 创建 API Route

### 基本结构
```
app/
├── api/
│   └── users.ts
```

### 实现
```typescript
// app/api/users.ts
import { createAPI } from 'expo-router/api';

export default createAPI({
  async GET(request) {
    const users = await db.users.findMany();
    return Response.json(users);
  },

  async POST(request) {
    const body = await request.json();
    const user = await db.users.create(body);
    return Response.json(user, { status: 201 });
  },
});
```

---

## 中间件

```typescript
// app/api/_middleware.ts
export function middleware(request) {
  // 认证检查
  const token = request.headers.get('Authorization');
  if (!token) {
    return new Response('Unauthorized', { status: 401 });
  }
}
```

---

## 环境变量

```typescript
// app/api/config.ts
export const config = {
  databaseUrl: process.env.DATABASE_URL,
  apiKey: process.env.API_KEY,
};
```

---

## 相关技能

- **expo-deployment**: Expo 部署
- **api-design-principles**: API 设计原则

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
