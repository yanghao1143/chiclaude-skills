# PostgreSQL 表设计 - PostgreSQL Table Design

> **原始仓库**: `wshobson/agents/postgresql-table-design`
> **安装量**: 3.4K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

PostgreSQL 数据库表设计最佳实践，包括数据类型选择、索引策略、约束设计和性能优化。

---

## 🎯 何时使用此技能

当用户进行以下工作时使用：

- 设计数据库表结构
- 优化查询性能
- 选择数据类型
- 设计索引策略

---

## 📊 数据类型选择

### 字符串类型

| 类型 | 用途 | 最大长度 |
|------|------|----------|
| `CHAR(n)` | 固定长度 | n |
| `VARCHAR(n)` | 可变长度 | n |
| `TEXT` | 无限长度 | 无限制 |

**推荐**：大多数情况使用 `TEXT` 或 `VARCHAR(n)`

### 数值类型

| 类型 | 用途 |
|------|------|
| `SMALLINT` | 小整数 (-32768 to 32767) |
| `INTEGER` | 整数 |
| `BIGINT` | 大整数 |
| `DECIMAL/NUMERIC` | 精确小数 |
| `REAL` | 浮点数 |
| `SERIAL` | 自增整数 |

### 时间类型

| 类型 | 用途 |
|------|------|
| `TIMESTAMP` | 时间戳 |
| `TIMESTAMPTZ` | 带时区时间戳 |
| `DATE` | 日期 |
| `TIME` | 时间 |

**推荐**：存储时间时使用 `TIMESTAMPTZ`

---

## 📐 表设计模式

### 用户表

```sql
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    name VARCHAR(100),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 索引
CREATE INDEX idx_users_email ON users(email);
```

### 关联表

```sql
CREATE TABLE user_roles (
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    role_id UUID REFERENCES roles(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (user_id, role_id)
);
```

---

## 🔍 索引策略

### 何时创建索引

```sql
-- WHERE 条件字段
CREATE INDEX idx_users_status ON users(status);

-- JOIN 字段
CREATE INDEX idx_orders_user_id ON orders(user_id);

-- 排序字段
CREATE INDEX idx_users_created_at ON users(created_at DESC);

-- 组合索引（顺序很重要）
CREATE INDEX idx_users_status_created ON users(status, created_at);
```

### 特殊索引

```sql
-- 全文搜索
CREATE INDEX idx_posts_content ON posts USING GIN(to_tsvector('english', content));

-- JSON 字段
CREATE INDEX idx_data_json ON data USING GIN(json_data);

-- 部分索引
CREATE INDEX idx_active_users ON users(email) WHERE active = true;
```

---

## ⚠️ 约束设计

```sql
CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(200) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock INTEGER DEFAULT 0 CHECK (stock >= 0),
    category_id UUID REFERENCES categories(id),
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [PostgreSQL 官方文档](https://www.postgresql.org/docs/)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
