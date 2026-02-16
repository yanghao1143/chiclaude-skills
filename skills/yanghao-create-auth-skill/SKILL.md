# 创建认证技能 (Create Auth Skill)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 4.9K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

使用 Better Auth 创建认证功能的指南。

**适用场景**：在应用中实现用户认证、登录注册功能。

---

## 认证方式

### 邮箱密码
- 传统方式
- 需要密码哈希
- 邮箱验证

### OAuth
- 社交登录
- 第三方身份
- 简化注册

### 无密码
- 魔法链接
- OTP 验证码
- 更安全

---

## 安全最佳实践

### 密码安全
- 使用 bcrypt/argon2
- 强密码策略
- 防暴力破解

### 会话管理
- 安全的 cookie 设置
- 令牌刷新
- 登出处理

### CSRF 防护
- CSRF 令牌
- SameSite cookie
- 检查来源

---

## 相关技能

- **better-auth-best-practices**: Better Auth 最佳实践
- **auth-implementation-patterns**: 认证实现模式

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
