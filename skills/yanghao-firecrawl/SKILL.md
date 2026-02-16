# Firecrawl 网页爬取 - Web Crawling Tool

> **原始仓库**: `firecrawl/cli/firecrawl`
> **安装量**: 3.5K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

Firecrawl 是一个强大的网页爬取和数据提取工具，可以将网页转换为结构化的 Markdown 或 JSON 数据，支持 AI 驱动的内容提取。

---

## 🎯 何时使用此技能

当用户进行以下工作时使用：

- 爬取网页内容
- 将网页转换为 Markdown
- 提取结构化数据
- 批量抓取网站

---

## 🚀 快速入门

### 安装

```bash
npm install -g firecrawl
# 或
pnpm add -g firecrawl
```

### 基本使用

```bash
# 爬取单个页面
firecrawl scrape https://example.com

# 输出为 Markdown
firecrawl scrape https://example.com --format markdown

# 输出为 JSON
firecrawl scrape https://example.com --format json
```

---

## 🔧 主要功能

### 1. 页面爬取

```bash
# 基本爬取
firecrawl scrape https://example.com

# 指定输出格式
firecrawl scrape https://example.com --format markdown

# 保存到文件
firecrawl scrape https://example.com -o output.md
```

### 2. 批量爬取

```bash
# 从文件读取 URL 列表
firecrawl batch urls.txt --format markdown

# 爬取整个网站
firecrawl crawl https://example.com --depth 2
```

### 3. 结构化提取

```bash
# 使用 AI 提取结构化数据
firecrawl extract https://example.com/product \
  --schema '{"name": "string", "price": "number", "description": "string"}'
```

---

## 📝 输出格式

### Markdown

```bash
firecrawl scrape https://example.com --format markdown
```

输出示例：
```markdown
# 页面标题

## 内容

页面正文内容...
```

### JSON

```bash
firecrawl scrape https://example.com --format json
```

输出示例：
```json
{
  "title": "页面标题",
  "content": "页面内容...",
  "metadata": {
    "url": "https://example.com",
    "timestamp": "2026-02-15T12:00:00Z"
  }
}
```

---

## ⚙️ 配置选项

### 爬取选项

```bash
# 设置超时
firecrawl scrape https://example.com --timeout 30000

# 设置最大深度
firecrawl crawl https://example.com --depth 3

# 排除特定路径
firecrawl crawl https://example.com --exclude "/admin/*"

# 只包含特定路径
firecrawl crawl https://example.com --include "/blog/*"
```

### 认证

```bash
# 设置 API Key
export FIRECRAWL_API_KEY=your-api-key

# 或在命令中指定
firecrawl scrape https://example.com --api-key your-api-key
```

---

## 🔄 编程接口

### Node.js

```javascript
import Firecrawl from '@mendable/firecrawl-js'

const app = new Firecrawl({ apiKey: 'your-api-key' })

// 爬取页面
const result = await app.scrapeUrl('https://example.com', {
  formats: ['markdown', 'html']
})

console.log(result.markdown)
```

### Python

```python
from firecrawl import FirecrawlApp

app = FirecrawlApp(api_key='your-api-key')

# 爬取页面
result = app.scrape_url('https://example.com')

print(result['markdown'])
```

---

## 📋 最佳实践

1. **遵守 robots.txt** - 尊重网站的爬取规则
2. **设置合理延迟** - 避免对服务器造成压力
3. **使用缓存** - 避免重复爬取相同内容
4. **处理错误** - 实现重试和错误处理机制
5. **限制深度** - 避免爬取过多页面

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [Firecrawl 官网](https://firecrawl.dev)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
