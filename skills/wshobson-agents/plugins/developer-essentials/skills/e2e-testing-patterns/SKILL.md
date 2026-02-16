# E2E 测试模式 - End-to-End Testing Patterns

> **原始仓库**: `wshobson/agents/e2e-testing-patterns`
> **安装量**: 2.9K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

端到端测试最佳实践和模式，使用 Playwright、Cypress 等工具进行 Web 应用自动化测试。

---

## 🎯 何时使用此技能

当用户进行以下工作时使用：

- 编写 E2E 测试
- 设置自动化测试流程
- 配置 CI/CD 测试
- 调试测试问题

---

## 🚀 Playwright 快速入门

### 安装

```bash
pnpm add -D @playwright/test
npx playwright install
```

### 基本测试

```typescript
import { test, expect } from '@playwright/test'

test('首页加载正常', async ({ page }) => {
  await page.goto('https://example.com')
  
  await expect(page).toHaveTitle(/Example/)
  await expect(page.locator('h1')).toBeVisible()
})

test('用户登录流程', async ({ page }) => {
  await page.goto('/login')
  
  await page.fill('[name="email"]', 'user@example.com')
  await page.fill('[name="password"]', 'password123')
  await page.click('button[type="submit"]')
  
  await expect(page).toHaveURL('/dashboard')
})
```

---

## 📋 测试模式

### Page Object Model

```typescript
// pages/LoginPage.ts
export class LoginPage {
  constructor(private page: Page) {}
  
  async goto() {
    await this.page.goto('/login')
  }
  
  async login(email: string, password: string) {
    await this.page.fill('[name="email"]', email)
    await this.page.fill('[name="password"]', password)
    await this.page.click('button[type="submit"]')
  }
}

// tests/login.spec.ts
test('用户登录', async ({ page }) => {
  const loginPage = new LoginPage(page)
  await loginPage.goto()
  await loginPage.login('user@example.com', 'password')
  
  await expect(page).toHaveURL('/dashboard')
})
```

### 测试夹具

```typescript
// fixtures.ts
import { test as base } from '@playwright/test'

export const test = base.extend({
  authenticatedPage: async ({ page }, use) => {
    // 登录
    await page.goto('/login')
    await page.fill('[name="email"]', 'test@example.com')
    await page.fill('[name="password"]', 'password')
    await page.click('button[type="submit"]')
    
    await use(page)
  }
})
```

---

## ⚙️ 配置

```typescript
// playwright.config.ts
import { defineConfig } from '@playwright/test'

export default defineConfig({
  testDir: './tests',
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,
  reporter: 'html',
  use: {
    baseURL: 'http://localhost:3000',
    trace: 'on-first-retry',
  },
  projects: [
    { name: 'chromium', use: { browserName: 'chromium' } },
    { name: 'firefox', use: { browserName: 'firefox' } },
    { name: 'webkit', use: { browserName: 'webkit' } },
  ],
  webServer: {
    command: 'npm run dev',
    url: 'http://localhost:3000',
  },
})
```

---

## ✅ 最佳实践

1. **使用 Page Object Model** - 提高可维护性
2. **独立测试** - 测试之间不依赖
3. **稳定选择器** - 使用 data-testid
4. **合理等待** - 避免硬编码等待
5. **清理数据** - 每次测试后清理

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [Playwright 官方文档](https://playwright.dev)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
