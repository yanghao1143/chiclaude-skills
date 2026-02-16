# Agent Browser - 浏览器自动化

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 36.7K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

使用 agent-browser 进行浏览器自动化。这是一个强大的命令行工具，用于控制浏览器、执行自动化任务、提取数据等。

---

## 核心工作流程

每个浏览器自动化都遵循此模式：

1. **导航**: `agent-browser open`
2. **快照**: `agent-browser snapshot -i` (获取元素引用如 @e1, @e2)
3. **交互**: 使用引用进行点击、填充、选择
4. **重新快照**: 导航或 DOM 更改后，获取新的引用

```bash
agent-browser open https://example.com/form
agent-browser snapshot -i
# 输出: @e1 [input type="email"], @e2 [input type="password"], @e3 [button] "Submit"

agent-browser fill @e1 "user@example.com"
agent-browser fill @e2 "password123"
agent-browser click @e3
agent-browser wait --load networkidle
agent-browser snapshot -i # 检查结果
```

---

## 核心命令

### 导航
```bash
agent-browser open <url>          # 导航 (别名: goto, navigate)
agent-browser close               # 关闭浏览器
```

### 快照
```bash
agent-browser snapshot -i         # 带引用的交互元素 (推荐)
agent-browser snapshot -i -C      # 包含光标交互元素 (带 onclick、cursor:pointer 的 div)
agent-browser snapshot -s "#selector"  # 仅限 CSS 选择器范围
```

### 交互 (使用快照中的 @ 引用)
```bash
agent-browser click @e1           # 点击元素
agent-browser fill @e2 "text"     # 清除并输入文本
agent-browser type @e2 "text"     # 输入而不清除
agent-browser select @e1 "option" # 选择下拉选项
agent-browser check @e1           # 勾选复选框
agent-browser press Enter         # 按键
agent-browser scroll down 500     # 滚动页面
```

### 获取信息
```bash
agent-browser get text @e1        # 获取元素文本
agent-browser get url             # 获取当前 URL
agent-browser get title           # 获取页面标题
```

### 等待
```bash
agent-browser wait @e1            # 等待元素
agent-browser wait --load networkidle        # 等待网络空闲
agent-browser wait --url "**/page"           # 等待 URL 模式
agent-browser wait 2000                      # 等待毫秒数
```

### 捕获
```bash
agent-browser screenshot          # 截图到临时目录
agent-browser screenshot --full   # 全页截图
agent-browser pdf output.pdf      # 保存为 PDF
```

---

## 常见模式

### 表单提交
```bash
agent-browser open https://example.com/signup
agent-browser snapshot -i
agent-browser fill @e1 "Jane Doe"
agent-browser fill @e2 "jane@example.com"
agent-browser select @e3 "California"
agent-browser check @e4
agent-browser click @e5
agent-browser wait --load networkidle
```

### 带状态持久化的认证
```bash
# 登录一次并保存状态
agent-browser open https://app.example.com/login
agent-browser snapshot -i
agent-browser fill @e1 "$USERNAME"
agent-browser fill @e2 "$PASSWORD"
agent-browser click @e3
agent-browser wait --url "**/dashboard"
agent-browser state save auth.json

# 在未来的会话中重用
agent-browser state load auth.json
agent-browser open https://app.example.com/dashboard
```

### 会话持久化
```bash
# 在浏览器重启之间自动保存/恢复 cookies 和 localStorage
agent-browser --session-name myapp open https://app.example.com/login
# ... 登录流程 ...
agent-browser close  # 状态自动保存到 ~/.agent-browser/sessions/

# 下次，状态自动加载
agent-browser --session-name myapp open https://app.example.com/dashboard

# 加密静态状态
export AGENT_BROWSER_ENCRYPTION_KEY=$(openssl rand -hex 32)
agent-browser --session-name secure open https://app.example.com

# 管理保存的状态
agent-browser state list
agent-browser state show myapp-default.json
agent-browser state clear myapp
agent-browser state clean --older-than 7
```

### 数据提取
```bash
agent-browser open https://example.com/products
agent-browser snapshot -i
agent-browser get text @e5  # 获取特定元素文本
agent-browser get text body > page.txt  # 获取所有页面文本

# JSON 输出用于解析
agent-browser snapshot -i --json
agent-browser get text @e1 --json
```

### 并行会话
```bash
agent-browser --session site1 open https://site-a.com
agent-browser --session site2 open https://site-b.com

agent-browser --session site1 snapshot -i
agent-browser --session site2 snapshot -i

agent-browser session list
```

### 连接到现有 Chrome
```bash
# 自动发现启用远程调试的运行中 Chrome
agent-browser --auto-connect open https://example.com
agent-browser --auto-connect snapshot

# 或使用显式 CDP 端口
agent-browser --cdp 9222 snapshot
```

### 可视化浏览器 (调试)
```bash
agent-browser --headed open https://example.com
agent-browser highlight @e1  # 高亮元素
agent-browser record start demo.webm  # 记录会话
```

---

## 引用生命周期 (重要)

当页面更改时，引用 (@e1, @e2 等) 会失效。在以下操作后总是**重新快照**：

- 点击导航的链接或按钮
- 表单提交
- 动态内容加载（下拉菜单、模态框）

```bash
agent-browser click @e5  # 导航到新页面
agent-browser snapshot -i  # 必须重新快照
agent-browser click @e1  # 使用新的引用
```

---

## 语义定位器 (引用的替代方案)

当引用不可用或不可靠时，使用语义定位器：

```bash
agent-browser find text "Sign In" click
agent-browser find label "Email" fill "user@test.com"
agent-browser find role button click --name "Submit"
agent-browser find placeholder "Search" type "query"
agent-browser find testid "submit-btn" click
```

---

## JavaScript 评估 (eval)

使用 eval 在浏览器上下文中运行 JavaScript。Shell 引用可能会损坏复杂表达式 -- 使用 --stdin 或 -b 来避免问题。

```bash
# 简单的表达式使用常规引号即可
agent-browser eval 'document.title'
agent-browser eval 'document.querySelectorAll("img").length'

# 复杂 JS：使用 --stdin 配合 heredoc (推荐)
agent-browser eval --stdin <<'EVALEOF'
JSON.stringify(
  Array.from(document.querySelectorAll("img"))
    .filter(i => !i.alt)
    .map(i => ({ src: i.src.split("/").pop(), width: i.width }))
)
EVALEOF

# 替代方案：base64 编码 (避免所有 shell 转义问题)
agent-browser eval -b "$(echo -n 'Array.from(document.querySelectorAll("a")).map(a => a.href)' | base64)"
```

**为什么这很重要**：当 shell 处理你的命令时，内部双引号、! 字符（历史扩展）、反引号和 $() 都可能在到达 agent-browser 之前损坏 JavaScript。--stdin 和 -b 标志完全绕过 shell 解释。

**经验法则**：
- 单行、无嵌套引号 → 常规 eval 'expression' 配合单引号即可
- 嵌套引号、箭头函数、模板字面量或多行 → 使用 eval --stdin 或 eval -b 配合 base64

---

## 深入文档

| 参考 | 何时使用 |
|------|----------|
| [commands.md](https://github.com/vercel-labs/agent-browser/blob/HEAD/skills/agent-browser/references/commands.md) | 完整命令参考及所有选项 |
| [snapshot-refs.md](https://github.com/vercel-labs/agent-browser/blob/HEAD/skills/agent-browser/references/snapshot-refs.md) | 引用生命周期、失效规则、故障排除 |
| [session-management.md](https://github.com/vercel-labs/agent-browser/blob/HEAD/skills/agent-browser/references/session-management.md) | 并行会话、状态持久化、并发抓取 |
| [authentication.md](https://github.com/vercel-labs/agent-browser/blob/HEAD/skills/agent-browser/references/authentication.md) | 登录流程、OAuth、2FA 处理、状态重用 |
| [video-recording.md](https://github.com/vercel-labs/agent-browser/blob/HEAD/skills/agent-browser/references/video-recording.md) | 记录工作流以进行调试和文档 |
| [proxy-support.md](https://github.com/vercel-labs/agent-browser/blob/HEAD/skills/agent-browser/references/proxy-support.md) | 代理配置、地理位置测试、轮换代理 |

---

## 即用型模板

| 模板 | 描述 |
|------|------|
| [form-automation.sh](https://github.com/vercel-labs/agent-browser/blob/HEAD/skills/agent-browser/templates/form-automation.sh) | 带验证的表单填充 |
| [authenticated-session.sh](https://github.com/vercel-labs/agent-browser/blob/HEAD/skills/agent-browser/templates/authenticated-session.sh) | 登录一次，重用状态 |
| [capture-workflow.sh](https://github.com/vercel-labs/agent-browser/blob/HEAD/skills/agent-browser/templates/capture-workflow.sh) | 带截图的内容提取 |

```bash
./templates/form-automation.sh https://example.com/form
./templates/authenticated-session.sh https://app.example.com/login
./templates/capture-workflow.sh https://example.com ./output
```

---

## 典型应用场景

- Web 自动化测试
- 数据抓取和采集
- 表单自动填写
- 定期报告生成
- 网站监控
- 竞品价格监控
- SEO 数据收集
- 社交媒体自动化

---

*翻译搬运自 [skills.sh](https://github.com/yanghao1143/chiclaude-skills)*
