# FastAPI 模板 - FastAPI Templates

> **原始仓库**: `wshobson/agents/fastapi-templates`
> **安装量**: 3.0K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

FastAPI 项目模板和最佳实践，包括项目结构、依赖注入、数据库集成、认证授权等。

---

## 🎯 何时使用此技能

当用户进行以下工作时使用：

- 创建 FastAPI 项目
- 设计 API 结构
- 配置认证授权
- 数据库集成

---

## 📁 项目结构

```
fastapi-project/
├── app/
│   ├── __init__.py
│   ├── main.py           # 应用入口
│   ├── config.py         # 配置
│   ├── dependencies.py   # 依赖注入
│   ├── routers/          # 路由
│   │   ├── __init__.py
│   │   ├── users.py
│   │   └── items.py
│   ├── models/           # 数据模型
│   │   ├── __init__.py
│   │   └── user.py
│   ├── schemas/          # Pydantic 模型
│   │   ├── __init__.py
│   │   └── user.py
│   ├── services/         # 业务逻辑
│   │   └── user_service.py
│   └── utils/            # 工具函数
├── tests/
├── alembic/              # 数据库迁移
├── requirements.txt
└── .env
```

---

## 🚀 基本模板

### main.py

```python
from fastapi import FastAPI
from app.routers import users, items
from app.config import settings

app = FastAPI(
    title=settings.PROJECT_NAME,
    version=settings.VERSION
)

app.include_router(users.router, prefix="/users", tags=["users"])
app.include_router(items.router, prefix="/items", tags=["items"])

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### config.py

```python
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    PROJECT_NAME: str = "FastAPI Project"
    VERSION: str = "1.0.0"
    DATABASE_URL: str
    SECRET_KEY: str
    
    class Config:
        env_file = ".env"

settings = Settings()
```

---

## 🔐 认证模板

```python
from fastapi import Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from jose import JWTError, jwt

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

async def get_current_user(token: str = Depends(oauth2_scheme)):
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username: str = payload.get("sub")
        if username is None:
            raise HTTPException(status_code=401)
    except JWTError:
        raise HTTPException(status_code=401)
    return username
```

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [FastAPI 官方文档](https://fastapi.tiangolo.com)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
