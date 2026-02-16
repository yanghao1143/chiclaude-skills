# Skills Mirror - AI Agent 技能镜像

> 从 [skills.sh](https://skills.sh) 搬运的所有技能，变成我们的！
> 
> 镜像时间：2026-02-16

## 📊 统计

| 项目 | 数量 |
|------|------|
| 源仓库 | 27 个 |
| 技能总数 | 454 个 |
| Markdown 文件 | 1,799 个 |
| 总大小 | 176MB |

## 📁 仓库结构

```
skills-mirror/
├── skills/                          # 所有技能仓库
│   ├── anthropics-skills/          # Anthropic 官方技能
│   ├── vercel-labs-skills/         # Vercel Labs 技能
│   ├── vercel-labs-agent-skills/   # Vercel Agent 技能
│   ├── obra-superpowers/           # Superpowers 技能集
│   ├── coreyhaines31-marketingskills/  # 营销技能
│   ├── inference-sh-0-skills/      # Inference 技能
│   ├── expo-skills/                # Expo/React Native 技能
│   ├── supabase-agent-skills/      # Supabase 技能
│   ├── browser-use-browser-use/    # Browser Use 技能
│   ├── google-gemini-gemini-skills/ # Gemini 技能
│   └── ...                         # 更多仓库
├── SKILL_INDEX.md                  # 技能索引
└── mirror.log                      # 镜像日志
```

## 🚀 热门技能（按安装量排序）

### 开发类
| 技能 | 来源 | 说明 |
|------|------|------|
| find-skills | vercel-labs | 搜索和发现技能 |
| vercel-react-best-practices | vercel-labs | React 最佳实践 |
| web-design-guidelines | vercel-labs | Web 设计指南 |
| frontend-design | anthropics | 前端设计 |
| systematic-debugging | obra | 系统化调试 |
| test-driven-development | obra | 测试驱动开发 |

### 营销类
| 技能 | 来源 | 说明 |
|------|------|------|
| seo-audit | coreyhaines31 | SEO 审计 |
| copywriting | coreyhaines31 | 文案写作 |
| content-strategy | coreyhaines31 | 内容策略 |
| marketing-psychology | coreyhaines31 | 营销心理学 |

### 工具类
| 技能 | 来源 | 说明 |
|------|------|------|
| pdf | anthropics | PDF 处理 |
| docx | anthropics | Word 文档 |
| xlsx | anthropics | Excel 表格 |
| pptx | anthropics | PowerPoint |
| mcp-builder | anthropics | MCP 构建器 |

### 框架特定
| 技能 | 来源 | 说明 |
|------|------|------|
| supabase-postgres-best-practices | supabase | Supabase/PostgreSQL |
| next-best-practices | vercel-labs | Next.js 最佳实践 |
| expo-skills | expo | Expo/React Native |
| vue-best-practices | vuejs-ai | Vue 最佳实践 |

## 📥 使用方法

### 安装单个技能
```bash
npx skills add <owner/repo/skill-name>
```

### 从本地使用
将 `skills/` 目录中的技能复制到你的项目：
```bash
cp -r skills/anthropics-skills/skills/frontend-design ~/.skills/
```

### 在 Claude Code 中使用
在项目根目录创建 `.claude/skills/` 目录，将技能放入其中。

## 🔗 原始来源

所有技能均来自 [skills.sh](https://skills.sh) - The Open Agent Skills Ecosystem。

## 📜 许可证

各技能保留原有许可证。详见各仓库的 LICENSE 文件。

---

**搬运者**: HaoDaEr (好大儿)
**搬运时间**: 2026-02-16 08:10
