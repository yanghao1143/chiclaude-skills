# 🔥 [No.012] 网站审计工具

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 20.3K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

使用 squirrelscan CLI 对网站进行 SEO、技术、内容、性能和安全问题的审计。

squirrelscan 提供一个 CLI 工具 `squirrel`，支持 macOS、Windows 和 Linux。它通过模拟浏览器、搜索爬虫，并根据 230+ 规则分析网站结构和内容来进行全面的网站审计。

---

## 主要功能

### 审计类别（230+ 规则，21 个类别）

- **SEO 问题**：Meta 标签、标题、描述、规范 URL、Open Graph 标签
- **技术问题**：断链、重定向链、页面速度、移动端友好性
- **性能**：页面加载时间、资源使用、缓存
- **内容质量**：标题结构、图片替代文本、内容分析
- **安全**：泄露的密钥、HTTPS 使用、安全头、混合内容
- **无障碍性**：替代文本、颜色对比度、键盘导航
- **可用性**：表单验证、错误处理、用户流程
- **链接**：检查断开的内部和外部链接
- **E-E-A-T**：专业性、经验、权威性、可信度
- **用户体验**：用户流程、错误处理、表单验证
- **移动端**：检查移动端友好性、响应式设计、触控友好元素
- **可爬取性**：robots.txt、sitemap.xml 等
- **Schema**：Schema.org 标记、结构化数据、富媒体摘要
- **法律合规**：隐私政策、服务条款等
- **社交**：Open Graph、Twitter Cards 验证
- **URL 结构**：长度、连字符、关键词
- **关键词**：关键词堆砌
- **内容**：内容结构、标题
- **图片**：替代文本、颜色对比度、图片大小、格式
- **本地 SEO**：NAP 一致性、地理元数据
- **视频**：VideoObject schema、无障碍性

---

## 何时使用

在以下情况下使用此技能：

- 分析网站健康状况
- 调试技术 SEO 问题
- 修复上述所有问题
- 检查断链
- 验证 Meta 标签和结构化数据
- 生成站点审计报告
- 比较更改前后的站点健康状况
- 改善网站性能、无障碍性、SEO、安全等

---

## 安装

下载地址：[squirrelscan.com/download](https://squirrelscan.com/download)

验证安装：
```bash
squirrel --version
```

---

## 使用方法

### 基本工作流程

```bash
# 第一步：运行审计（保存到数据库，显示控制台输出）
squirrel audit https://example.com

# 第二步：导出为 LLM 格式
squirrel report <audit-id> --format llm
```

### 一键审计（推荐）

```bash
# 使用 LLM 格式输出（最紧凑、最适合 AI 读取）
squirrel audit https://example.com --format llm
```

### 覆盖模式

| 模式 | 默认页面数 | 行为 | 使用场景 |
|------|------------|------|----------|
| quick | 25 | 仅种子 + 站点地图，无链接发现 | CI 检查、快速健康检查 |
| surface | 100 | 每个 URL 模式一个样本 | 常规审计（默认） |
| full | 500 | 爬取所有内容直到限制 | 深度分析 |

```bash
# 快速健康检查（25 页，无链接发现）
squirrel audit https://example.com -C quick --format llm

# 默认表面审计（100 页，模式采样）
squirrel audit https://example.com --format llm

# 全面审计（500 页）
squirrel audit https://example.com -C full --format llm
```

---

## 分数目标

| 起始分数 | 目标分数 | 预期工作量 |
|----------|----------|------------|
| < 50 (F) | 75+ (C) | 主要修复 |
| 50-70 (D) | 85+ (B) | 中等修复 |
| 70-85 (C) | 90+ (A) | 优化 |
| > 85 (B+) | 95+ | 微调 |

**网站只有当分数达到 95+（A级）且覆盖模式设置为 FULL 时，才被认为是完整和修复的。**

---

## 常用选项

### 审计命令选项

| 选项 | 别名 | 描述 | 默认值 |
|------|------|------|--------|
| --format <fmt> | -f <fmt> | 输出格式：console、text、json、html、markdown、llm | console |
| --coverage <mode> | -C <mode> | 覆盖模式：quick、surface、full | surface |
| --max-pages <n> | -m <n> | 最大爬取页面数（最大 5000） | 按覆盖模式变化 |
| --output <path> | -o <path> | 输出文件路径 | - |
| --refresh | -r | 忽略缓存，重新获取所有页面 | false |
| --resume | - | 恢复中断的爬取 | false |
| --verbose | -v | 详细输出 | false |

---

## 示例

### 示例 1：快速站点审计

```bash
# 用户问："检查 squirrelscan.com 的 SEO 问题"
squirrel audit https://squirrelscan.com --format llm
```

### 示例 2：大型站点深度审计

```bash
# 用户问："对我的博客进行全面审计，最多 500 页"
squirrel audit https://myblog.com --max-pages 500 --format llm
```

### 示例 3：更改后重新审计

```bash
# 用户问："重新审计站点，忽略缓存结果"
squirrel audit https://example.com --refresh --format llm
```

---

## 文档链接

- 官网：[https://squirrelscan.com](https://squirrelscan.com)
- 文档：[docs.squirrelscan.com](https://docs.squirrelscan.com)
- 规则参考：`https://docs.squirrelscan.com/rules/{rule_category}/{rule_id}`

---

## 典型应用场景

- 🔍 SEO 优化和问题排查
- 🔒 安全漏洞检测
- ♿ 无障碍性合规检查
- ⚡ 性能优化
- 🔗 断链检测和修复
- 📊 网站健康监控

---

*翻译搬运自 [skills.sh](https://github.com/yanghao1143/chiclaude-skills)*

📌 *Skills市场搬运计划 - 热门技能系列 - No.012*
