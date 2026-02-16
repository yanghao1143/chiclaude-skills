# 🔥 [No.020] Better Auth 最佳实践

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 11.2K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

Better Auth 是 TypeScript 优先、框架无关的认证框架，通过插件支持邮箱/密码、OAuth、魔法链接、Passkeys 等。

---

## 快速参考

### 环境变量

- **BETTER_AUTH_SECRET** - 加密密钥（最少 32 字符）。生成：`openssl rand -base64 32`
- **BETTER_AUTH_URL** - 基础 URL（如 https://example.com）

仅在环境变量未设置时在配置中定义 baseURL/secret。

### 文件位置

CLI 在以下位置查找 auth.ts：`./`, `./lib`, `./utils`, 或 `./src` 下。使用 `--config` 指定自定义路径。

### CLI 命令

```bash
# 应用架构（内置适配器）
npx @better-auth/cli@latest migrate

# 为 Prisma/Drizzle 生成架构
npx @better-auth/cli@latest generate

# 添加 MCP 到 AI 工具
npx @better-auth/cli mcp --cursor
```

添加/更改插件后重新运行。

---

## 核心配置选项

| 选项 | 说明 |
|------|------|
| appName | 可选显示名称 |
| baseURL | 仅当 BETTER_AUTH_URL 未设置时 |
| basePath | 默认 /api/auth。设置为 / 表示根路径 |
| secret | 仅当 BETTER_AUTH_SECRET 未设置时 |
| database | 大多数功能必需。参见适配器文档 |
| secondaryStorage | Redis/KV 用于会话和速率限制 |
| emailAndPassword | `{ enabled: true }` 激活 |
| socialProviders | `{ google: { clientId, clientSecret }, ... }` |
| plugins | 插件数组 |
| trustedOrigins | CSRF 白名单 |

---

## 数据库

**直接连接**：传递 pg.Pool、mysql2 pool、better-sqlite3 或 bun:sqlite 实例。

**ORM 适配器**：从以下路径导入
- `better-auth/adapters/drizzle`
- `better-auth/adapters/prisma`
- `better-auth/adapters/mongodb`

⚠️ **关键**：Better Auth 使用适配器模型名称，而非底层表名。如果 Prisma 模型是 User 映射到表 users，使用 `modelName: "user"`（Prisma 引用），而非 "users"。

---

## 会话管理

**存储优先级**：

1. 如果定义了 secondaryStorage → 会话存储在那里（非数据库）
2. 设置 `session.storeSessionInDatabase: true` 同时持久化到数据库
3. 无数据库 + cookieCache → 完全无状态模式

**Cookie 缓存策略**：

- **compact**（默认）- Base64url + HMAC。最小
- **jwt** - 标准 JWT。可读但已签名
- **jwe** - 加密。最大安全性

**关键选项**：
- `session.expiresIn`（默认 7 天）
- `session.updateAge`（刷新间隔）
- `session.cookieCache.maxAge`
- `session.cookieCache.version`（更改以使所有会话失效）

---

## 用户与账户配置

**用户**：
- `user.modelName`
- `user.fields`（列映射）
- `user.additionalFields`
- `user.changeEmail.enabled`（默认禁用）
- `user.deleteUser.enabled`（默认禁用）

**账户**：
- `account.modelName`
- `account.accountLinking.enabled`
- `account.storeAccountCookie`（用于无状态 OAuth）

注册必需字段：email 和 name。

---

## 邮件流程

- `emailVerification.sendVerificationEmail` - 必须定义才能启用验证
- `emailVerification.sendOnSignUp` / `sendOnSignIn` - 自动发送触发器
- `emailAndPassword.sendResetPassword` - 密码重置邮件处理程序

---

## 安全

在 `advanced` 中：

- `useSecureCookies` - 强制 HTTPS cookies
- `disableCSRFCheck` - ⚠️ 安全风险
- `disableOriginCheck` - ⚠️ 安全风险
- `crossSubDomainCookies.enabled` - 跨子域共享 cookies
- `ipAddress.ipAddressHeaders` - 代理的自定义 IP 头
- `database.generateId` - 自定义 ID 生成或 "serial"/"uuid"/false

**速率限制**：
- `rateLimit.enabled`
- `rateLimit.window`
- `rateLimit.max`
- `rateLimit.storage`（"memory" | "database" | "secondary-storage"）

---

## 钩子

**端点钩子**：
- `hooks.before` / `hooks.after` - `{ matcher, handler }` 数组
- 使用 `createAuthMiddleware`
- 访问 `ctx.path`, `ctx.context.returned`（after）, `ctx.context.session`

**数据库钩子**：
- `databaseHooks.user.create.before/after`
- session, account 同样支持
- 用于添加默认值或创建后操作

**钩子上下文 (ctx.context)**：
- session, secret, authCookies
- password.hash()/verify()
- adapter, internalAdapter
- generateId(), tables, baseURL

---

## 插件

从专用路径导入以支持 tree-shaking：

```typescript
import { twoFactor } from "better-auth/plugins/two-factor"
// 而非 from "better-auth/plugins"
```

**热门插件**：
twoFactor, organization, passkey, magicLink, emailOtp, username, phoneNumber, admin, apiKey, bearer, jwt, multiSession, sso, oauthProvider, oidcProvider, openAPI, genericOAuth

客户端插件放在 `createAuthClient({ plugins: [...] })`。

---

## 客户端

从以下路径导入：
- `better-auth/client`（原生）
- `better-auth/react`
- `better-auth/vue`
- `better-auth/svelte`
- `better-auth/solid`

**关键方法**：
- `signUp.email()`
- `signIn.email()`
- `signIn.social()`
- `signOut()`
- `useSession()`
- `getSession()`
- `revokeSession()`
- `revokeSessions()`

---

## 类型安全

**推断类型**：
```typescript
typeof auth.$Infer.Session
typeof auth.$Infer.Session.user
```

**分离的客户端/服务端项目**：
```typescript
createAuthClient<typeof auth>()
```

---

## 常见陷阱

- **模型 vs 表名** - 配置使用 ORM 模型名，而非数据库表名
- **插件架构** - 添加插件后重新运行 CLI
- **二级存储** - 会话默认存储在那里，而非数据库
- **Cookie 缓存** - 自定义会话字段不缓存，总是重新获取
- **无状态模式** - 无数据库 = 会话仅在 cookie 中，缓存过期时登出
- **更改邮箱流程** - 先发送到当前邮箱，然后发送到新邮箱

---

## 资源

- [文档](https://better-auth.com/docs)
- [选项参考](https://better-auth.com/docs/reference/options)
- [LLMs.txt](https://better-auth.com/llms.txt)
- [GitHub](https://github.com/better-auth/better-auth)

---

📌 *Skills市场搬运计划 - 热门技能系列 - No.020*
