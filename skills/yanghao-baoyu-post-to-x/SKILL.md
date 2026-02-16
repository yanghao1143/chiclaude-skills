# 发布到 X (Twitter) - Post to X

> **原始仓库**: `jimliu/baoyu-skills/baoyu-post-to-x`
> **安装量**: 3.6K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

通过真实 Chrome 浏览器发布文本、图片、视频和长篇文章到 X（绕过反机器人检测）。

---

## 🎯 何时使用此技能

当用户要求以下操作时使用：

- "发布到 X"
- "发推特"
- "发布到 Twitter"
- "在 X 上分享"

---

## ⚙️ 前置条件

- Google Chrome 或 Chromium 浏览器
- `bun` 运行时
- 首次运行：手动登录 X（会话会被保存）

---

## 📝 普通帖子

文本 + 最多 4 张图片：

```bash
npx -y bun ${SKILL_DIR}/scripts/x-browser.ts "你好！" --image ./photo.png
```

**参数说明**：

| 参数 | 描述 |
|------|------|
| `<text>` | 帖子内容（位置参数） |
| `--image <path>` | 图片文件（可重复，最多 4 张） |
| `--profile <dir>` | 自定义 Chrome 配置 |

**注意**：脚本会打开浏览器并填入内容，用户需要审核后手动发布。

---

## 🎬 视频帖子

文本 + 视频文件：

```bash
npx -y bun ${SKILL_DIR}/scripts/x-video.ts "快来看看！" --video ./clip.mp4
```

**参数说明**：

| 参数 | 描述 |
|------|------|
| `<text>` | 帖子内容 |
| `--video <path>` | 视频文件（MP4, MOV, WebM） |
| `--profile <dir>` | 自定义 Chrome 配置 |

**限制**：普通用户 140 秒，Premium 用户 60 分钟。处理时间：30-60 秒。

---

## 💬 引用推文

引用现有推文并添加评论：

```bash
npx -y bun ${SKILL_DIR}/scripts/x-quote.ts https://x.com/user/status/123 "很好的观点！"
```

**参数说明**：

| 参数 | 描述 |
|------|------|
| `<tweet-url>` | 要引用的推文 URL |
| `<comment>` | 评论文本（可选） |
| `--profile <dir>` | 自定义 Chrome 配置 |

---

## 📰 X 文章

长篇 Markdown 文章（需要 X Premium）：

```bash
npx -y bun ${SKILL_DIR}/scripts/x-article.ts article.md
npx -y bun ${SKILL_DIR}/scripts/x-article.ts article.md --cover ./cover.jpg
```

**参数说明**：

| 参数 | 描述 |
|------|------|
| `<markdown>` | Markdown 文件 |
| `--cover <path>` | 封面图片 |
| `--title <text>` | 覆盖标题 |

**Frontmatter**：支持 `title`、`cover_image` YAML 字段。

---

## 🔧 环境检查

首次使用前建议运行环境检查：

```bash
npx -y bun ${SKILL_DIR}/scripts/check-paste-permissions.ts
```

检查项目：Chrome、配置文件隔离、Bun、无障碍权限、剪贴板、粘贴按键、Chrome 冲突。

---

## 🐛 故障排除

### Chrome 调试端口未就绪

如果脚本失败并显示 `Chrome debug port not ready`：

```bash
pkill -f "Chrome.*remote-debugging-port" 2>/dev/null
pkill -f "Chromium.*remote-debugging-port" 2>/dev/null
sleep 2
```

然后重试命令。

---

## 📋 注意事项

- 首次运行需要手动登录（会话会持久保存）
- 所有脚本只会将内容填入浏览器，用户必须审核后手动发布
- 跨平台支持：macOS、Linux、Windows

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [GitHub 仓库](https://github.com/jimliu/baoyu-skills)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
