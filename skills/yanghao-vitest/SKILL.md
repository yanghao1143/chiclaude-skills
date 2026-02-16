# Vitest 测试框架 (Vitest)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 4.3K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

Vitest 快速单元测试框架，由 Vite 驱动，兼容 Jest API。

**适用场景**：编写测试、模拟、配置覆盖率或使用测试过滤和 fixtures。

---

## 核心功能

| 主题 | 描述 |
|------|------|
| 配置 | Vitest 和 Vite 配置集成 |
| CLI | 命令行界面、命令和选项 |
| Test API | test/it 函数、skip、only、concurrent 修饰符 |
| Expect API | toBe、toEqual 断言和匹配器 |
| Hooks | beforeEach、afterEach、beforeAll、afterAll |

---

## 特性

| 主题 | 描述 |
|------|------|
| 模拟 | vi 工具：mock 函数、模块、定时器、日期 |
| 快照 | toMatchSnapshot 和内联快照测试 |
| 覆盖率 | V8 或 Istanbul 代码覆盖率 |
| 测试上下文 | 测试 fixtures、context.expect、test.extend |
| 并发 | 并发测试、并行执行、分片 |
| 过滤 | 按名称、文件模式、标签过滤测试 |

---

## 基本用法

```typescript
import { describe, it, expect, vi } from 'vitest'

describe('MyComponent', () => {
  it('should render correctly', () => {
    const result = render(<MyComponent />)
    expect(result).toBeDefined()
  })

  it('should handle click', () => {
    const onClick = vi.fn()
    // 测试点击
    expect(onClick).toHaveBeenCalled()
  })
})
```

---

## CLI 命令

```bash
vitest              # 运行测试（监视模式）
vitest run          # 单次运行
vitest coverage     # 生成覆盖率报告
vitest ui           # 打开 UI
```

---

## 关键特性

- Vite 原生：使用 Vite 转换管道
- Jest 兼容：大多数 Jest 测试可直接使用
- 智能监视：基于模块图重新运行受影响的测试
- 原生 ESM、TypeScript、JSX 支持无需配置
- 多线程并行测试执行

---

## 相关技能

- **vite**: Vite 构建工具
- **vue**: Vue 组件测试

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
