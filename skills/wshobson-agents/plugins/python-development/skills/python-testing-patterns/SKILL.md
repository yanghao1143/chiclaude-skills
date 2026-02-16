# Python 测试模式 - Python Testing Patterns

> **原始仓库**: `wshobson/agents/python-testing-patterns`
> **安装量**: 3.3K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

使用 pytest、fixtures、mocking 和测试驱动开发实现全面的测试策略。适用于编写 Python 测试、设置测试套件或实现测试最佳实践。

---

## 🎯 何时使用此技能

当用户进行以下工作时使用：

- 为 Python 代码编写单元测试
- 设置测试套件和测试基础设施
- 实现测试驱动开发 (TDD)
- 创建 API 和服务的集成测试
- 模拟外部依赖和服务
- 测试异步代码和并发操作

---

## 🚀 快速入门

### 基本测试

```python
# test_example.py
def add(a, b):
    return a + b

def test_add():
    """基本测试示例。"""
    result = add(2, 3)
    assert result == 5

def test_add_negative():
    """测试负数。"""
    assert add(-1, 1) == 0

# 运行: pytest test_example.py
```

---

## 📦 Fixtures

### 基本 Fixture

```python
import pytest

@pytest.fixture
def db():
    """提供数据库连接的 fixture。"""
    database = Database("sqlite:///:memory:")
    database.connect()
    
    yield database
    
    database.disconnect()

def test_database_query(db):
    """使用 fixture 的测试。"""
    results = db.query("SELECT * FROM users")
    assert len(results) >= 0
```

### 作用域

```python
# 会话作用域 - 整个测试会话创建一次
@pytest.fixture(scope="session")
def app_config():
    return {"database_url": "postgresql://localhost/test"}

# 模块作用域 - 每个模块创建一次
@pytest.fixture(scope="module")
def api_client(app_config):
    client = APIClient(app_config)
    yield client
    client.close()

# 函数作用域 (默认) - 每个测试创建一次
@pytest.fixture
def sample_user():
    return {"id": 1, "name": "Test User"}
```

---

## 🔄 参数化测试

### 基本参数化

```python
@pytest.mark.parametrize("a,b,expected", [
    (2, 3, 5),
    (0, 0, 0),
    (-1, 1, 0),
    (100, 200, 300),
])
def test_addition_parameterized(a, b, expected):
    """使用多组参数测试加法。"""
    assert add(a, b) == expected
```

### 带 ID 的参数化

```python
@pytest.mark.parametrize("value,expected", [
    pytest.param(1, True, id="正数"),
    pytest.param(0, False, id="零"),
    pytest.param(-1, False, id="负数"),
])
def test_is_positive(value, expected):
    """带自定义测试 ID。"""
    assert (value > 0) == expected
```

---

## 🎭 Mocking

### 使用 unittest.mock

```python
from unittest.mock import Mock, patch

def test_api_call():
    """测试 API 调用。"""
    client = APIClient("https://api.example.com")

    mock_response = Mock()
    mock_response.json.return_value = {"id": 1, "name": "John"}
    mock_response.raise_for_status.return_value = None

    with patch("requests.get", return_value=mock_response) as mock_get:
        user = client.get_user(1)

        assert user["id"] == 1
        mock_get.assert_called_once_with("https://api.example.com/users/1")
```

### 装饰器语法

```python
@patch("requests.post")
def test_create_user(mock_post):
    """使用装饰器语法测试创建用户。"""
    client = APIClient("https://api.example.com")

    mock_post.return_value.json.return_value = {"id": 2}
    mock_post.return_value.raise_for_status.return_value = None

    result = client.create_user({"name": "Jane"})

    assert result["id"] == 2
```

---

## ⚠️ 异常测试

```python
import pytest

def divide(a, b):
    if b == 0:
        raise ZeroDivisionError("除零错误")
    return a / b

def test_zero_division():
    """测试异常被抛出。"""
    with pytest.raises(ZeroDivisionError):
        divide(10, 0)

def test_exception_message():
    """测试异常消息。"""
    with pytest.raises(ZeroDivisionError, match="除零错误"):
        divide(5, 0)
```

---

## 🔧 测试标记

```python
import pytest

@pytest.mark.slow
def test_slow_operation():
    """标记为慢测试。"""
    import time
    time.sleep(2)

@pytest.mark.integration
def test_database_integration():
    """标记为集成测试。"""
    pass

@pytest.mark.skip(reason="功能尚未实现")
def test_future_feature():
    """暂时跳过的测试。"""
    pass

# 运行方式:
# pytest -m slow          # 只运行慢测试
# pytest -m "not slow"    # 跳过慢测试
```

---

## 📁 临时文件

```python
def test_file_operations(tmp_path):
    """使用临时目录测试文件操作。"""
    # tmp_path 是 pathlib.Path 对象
    test_file = tmp_path / "test_data.txt"
    
    # 写入数据
    test_file.write_text("Hello, World!")
    
    # 验证
    assert test_file.exists()
    assert test_file.read_text() == "Hello, World!"
```

---

## 🔌 conftest.py

共享 fixtures:

```python
# tests/conftest.py
import pytest

@pytest.fixture(scope="session")
def database_url():
    """所有测试共享的数据库 URL。"""
    return "postgresql://localhost/test_db"

@pytest.fixture
def sample_user():
    """示例用户数据。"""
    return {
        "id": 1,
        "name": "Test User",
        "email": "test@example.com"
    }
```

---

## 📊 覆盖率

```bash
# 安装
pip install pytest-cov

# 运行测试并生成覆盖率报告
pytest --cov=myapp tests/

# 生成 HTML 报告
pytest --cov=myapp --cov-report=html tests/

# 低于阈值失败
pytest --cov=myapp --cov-fail-under=80 tests/
```

---

## ✅ 最佳实践

1. **先写测试** (TDD) 或与代码同步
2. **每个测试一个断言**（尽可能）
3. **使用描述性的测试名称**
4. **保持测试独立和隔离**
5. **使用 fixtures 处理设置和清理**
6. **适当模拟外部依赖**
7. **参数化测试以减少重复**
8. **测试边界情况和错误条件**
9. **测量覆盖率但关注质量**
10. **在 CI/CD 中运行测试**

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [GitHub 仓库](https://github.com/wshobson/agents)
- [pytest 文档](https://docs.pytest.org/)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
