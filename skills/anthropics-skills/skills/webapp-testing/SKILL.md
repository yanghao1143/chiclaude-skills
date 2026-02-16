# Web Application Testing - Web 应用测试

> **原始仓库**: `anthropics/skills/webapp-testing`
> **安装量**: 10.2K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

测试本地 Web 应用程序，编写原生 Python Playwright 脚本。

---

## 🔧 辅助脚本

- `scripts/with_server.py` - 管理服务器生命周期（支持多服务器）

始终先运行 `--help` 查看用法。不要在首次运行脚本并发现自定义解决方案绝对必要之前阅读源代码。

---

## 📊 决策树：选择你的方法

```
用户任务 → 是静态 HTML 吗？
 ├─ 是 → 直接读取 HTML 文件识别选择器
 │ ├─ 成功 → 使用选择器编写 Playwright 脚本
 │ └─ 失败/不完整 → 视为动态处理（下方）
 │
 └─ 否（动态 webapp）→ 服务器已经在运行吗？
     ├─ 否 → 运行: python scripts/with_server.py --help
     │ 然后使用辅助工具 + 编写简化的 Playwright 脚本
     │
     └─ 是 → 侦察然后行动:
         1. 导航并等待 networkidle
         2. 截图或检查 DOM
         3. 从渲染状态识别选择器
         4. 使用发现的选择器执行操作
```

---

## 🚀 示例：使用 with_server.py

### 单服务器

```bash
python scripts/with_server.py --server "npm run dev" --port 5173 -- python your_automation.py
```

### 多服务器（如后端 + 前端）

```bash
python scripts/with_server.py \
  --server "cd backend && python server.py" --port 3000 \
  --server "cd frontend && npm run dev" --port 5173 \
  -- python your_automation.py
```

### 创建自动化脚本

```python
from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch(headless=True)  # 始终在 headless 模式启动 chromium
    page = browser.new_page()
    page.goto('http://localhost:5173')  # 服务器已运行并就绪
    page.wait_for_load_state('networkidle')  # 关键：等待 JS 执行
    # ... 你的自动化逻辑
    browser.close()
```

---

## 🔍 侦察-然后-行动模式

- **检查渲染的 DOM**:
  ```python
  page.screenshot(path='/tmp/inspect.png', full_page=True)
  content = page.content()
  page.locator('button').all()
  ```

- **从检查结果识别选择器**
- **使用发现的选择器执行操作**

---

## ⚠️ 常见陷阱

❌ 在动态应用上等待 networkidle 之前检查 DOM
✅ 在检查之前执行 `page.wait_for_load_state('networkidle')`

---

## 💡 最佳实践

- 将捆绑脚本作为黑盒使用 - 考虑 `scripts/` 中的脚本是否有帮助
- 同步脚本使用 `sync_playwright()`
- 完成后始终关闭浏览器
- 使用描述性选择器：text=, role=, CSS 选择器或 ID
- 添加适当的等待：`page.wait_for_selector()` 或 `page.wait_for_timeout()`

---

## 📚 参考文件

- `examples/` - 显示常见模式的示例：
  - `element_discovery.py` - 发现页面上的按钮、链接和输入
  - `static_html_automation.py` - 使用 file:// URL 处理本地 HTML
  - `console_logging.py` - 在自动化期间捕获控制台日志

---

## 🔒 安全检查

此技能不包含任何恶意代码。所有脚本仅用于测试目的。

---

*翻译自: https://github.com/yanghao1143/chiclaude-skills
