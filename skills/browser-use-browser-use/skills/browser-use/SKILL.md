# 🔥 [No.010] Browser Use - 浏览器自动化 CLI

**📦 仓库**: `browser-use/browser-use/browser-use`
**🔥 安装量**: 30.3K
**🔗 出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

browser-use 命令提供快速、持久的浏览器自动化。它在命令之间维护浏览器会话，支持复杂的多步骤工作流。

---

## 安装

```bash
# 不安装直接运行（推荐一次性使用）
uvx "browser-use[cli]" open https://example.com

# 或永久安装
uv pip install "browser-use[cli]"

# 安装浏览器依赖（Chromium）
browser-use install
```

---

## 设置

### 一键安装（推荐）

```bash
curl -fsSL https://browser-use.com/cli/install.sh | bash
```

这个交互式安装器让你选择安装模式并自动配置所有内容。

### 安装模式

```bash
curl -fsSL https://browser-use.com/cli/install.sh | bash -s -- --remote-only # 仅云浏览器
curl -fsSL https://browser-use.com/cli/install.sh | bash -s -- --local-only  # 仅本地浏览器
curl -fsSL https://browser-use.com/cli/install.sh | bash -s -- --full        # 所有模式
```

| 安装模式 | 可用浏览器 | 默认 | 用例 |
|----------|------------|------|------|
| --remote-only | remote | remote | 沙盒代理、CI、无 GUI |
| --local-only | chromium, real | chromium | 本地开发 |
| --full | chromium, real, remote | chromium | 完全灵活 |

---

## 快速开始

```bash
browser-use open https://example.com  # 导航到 URL
browser-use state                     # 获取页面元素和索引
browser-use click 5                   # 按索引点击元素
browser-use type "Hello World"        # 输入文本
browser-use screenshot                # 截图
browser-use close                     # 关闭浏览器
```

---

## 核心工作流

1. **导航**: `browser-use open` - 打开 URL（如需要则启动浏览器）
2. **检查**: `browser-use state` - 返回可点击元素和索引
3. **交互**: 使用索引进行交互（`browser-use click 5`, `browser-use input 3 "text"`）
4. **验证**: `browser-use state` 或 `browser-use screenshot` 确认操作
5. **重复**: 命令之间浏览器保持打开

---

## 浏览器模式

```bash
browser-use --browser chromium open <url>        # 默认：无头 Chromium
browser-use --browser chromium --headed open <url>  # 可见 Chromium 窗口
browser-use --browser real open <url>            # 用户的 Chrome（带登录会话）
browser-use --browser remote open <url>          # 云浏览器（需要 API key）
```

- **chromium**: 快速、隔离、默认无头
- **real**: 使用你的 Chrome，包含 cookies、扩展、登录会话
- **remote**: 云托管浏览器，支持代理（需要 BROWSER_USE_API_KEY）

---

## 主要命令

### 导航

```bash
browser-use open <url>                    # 导航到 URL
browser-use back                          # 后退
browser-use scroll down                   # 向下滚动
browser-use scroll up                     # 向上滚动
browser-use scroll down --amount 1000     # 滚动指定像素（默认：500）
```

### 页面状态

```bash
browser-use state                         # 获取 URL、标题和可点击元素
browser-use screenshot                    # 截图（输出 base64）
browser-use screenshot path.png           # 保存截图到文件
browser-use screenshot --full path.png    # 全页截图
```

### 交互（使用 state 返回的索引）

```bash
browser-use click <index>                 # 点击元素
browser-use type "text"                   # 在焦点元素输入文本
browser-use input <index> "text"          # 点击元素然后输入文本
browser-use keys "Enter"                  # 发送键盘按键
browser-use keys "Control+a"              # 发送组合键
browser-use select <index> "option"       # 选择下拉选项
```

### 标签页管理

```bash
browser-use switch <tab>                  # 按索引切换标签页
browser-use close-tab                     # 关闭当前标签页
browser-use close-tab <tab>               # 关闭指定标签页
```

### JavaScript 和数据

```bash
browser-use eval "document.title"         # 执行 JavaScript，返回结果
browser-use extract "all product prices"  # 使用 LLM 提取数据（需要 API key）
```

### Cookies

```bash
browser-use cookies get                   # 获取所有 cookies
browser-use cookies set <name> <value>    # 设置 cookie
browser-use cookies clear                 # 清除所有 cookies
browser-use cookies export <file>         # 导出 cookies 到 JSON 文件
browser-use cookies import <file>         # 从 JSON 文件导入 cookies
```

### 等待条件

```bash
browser-use wait selector "h1"                    # 等待元素可见
browser-use wait selector ".loading" --state hidden  # 等待元素消失
browser-use wait text "Success"                   # 等待文本出现
browser-use wait selector "h1" --timeout 5000     # 自定义超时（毫秒）
```

---

## Agent 任务（需要 API Key）

```bash
browser-use run "Fill the contact form with test data"  # 运行 AI agent
browser-use run "Extract all product prices" --max-steps 50
```

Agent 任务使用 LLM 自主完成复杂的浏览器任务。需要 BROWSER_USE_API_KEY 或配置的 LLM API key。

---

## 远程模式 Agent 选项

```bash
# 基本远程任务（默认使用美国代理）
browser-use -b remote run "Search for AI news"

# 指定 LLM 模型
browser-use -b remote run "task" --llm gpt-4o
browser-use -b remote run "task" --llm claude-sonnet-4-20250514

# 代理配置（默认：us）
browser-use -b remote run "task" --proxy-country gb  # 英国代理
browser-use -b remote run "task" --proxy-country de  # 德国代理

# 会话复用（在同一浏览器会话中运行多个任务）
browser-use -b remote run "task 1" --keep-alive
# 返回：session_id: abc-123
browser-use -b remote run "task 2" --session-id abc-123
```

---

## 本地开发服务器暴露

如果你在本地运行开发服务器，需要云浏览器访问它：

```bash
# 启动开发服务器
npm run dev &  # localhost:3000

# 通过 Cloudflare tunnel 暴露
browser-use tunnel 3000
# → url: https://abc.trycloudflare.com

# 现在云浏览器可以访问你的本地服务器
browser-use --browser remote open https://abc.trycloudflare.com
```

---

## 典型应用场景

- 🌐 Web 自动化测试
- 📊 数据采集和抓取
- 🤖 AI 驱动的浏览器任务
- 🔄 表单自动填写
- 📸 网页截图和监控
- 🔍 SEO 检查

---

## 安装方法

```bash
# 安装技能
npx skills add browser-use/browser-use@browser-use

# 或全局安装
npx skills add browser-use/browser-use@browser-use -g
```

---

*翻译搬运自 [skills.sh](https://github.com/yanghao1143/chiclaude-skills)*

---

📌 *Skills市场搬运计划 - 热门技能系列 - No.010*
