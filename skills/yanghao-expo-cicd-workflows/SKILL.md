# Expo CI/CD 工作流 (Expo CI/CD Workflows)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 4.6K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

配置 Expo 应用的 CI/CD 工作流自动化构建和部署。

**适用场景**：设置 Expo 应用的持续集成和持续部署流程。

---

## EAS Build 配置

### eas.json
```json
{
  "build": {
    "development": {
      "developmentClient": true,
      "distribution": "internal"
    },
    "preview": {
      "distribution": "internal",
      "android": {
        "buildType": "apk"
      }
    },
    "production": {
      "distribution": "store"
    }
  }
}
```

---

## GitHub Actions

### 构建工作流
```yaml
name: Build
on:
  push:
    branches: [main]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: 18
      - run: npm ci
      - run: npx eas-cli build --platform all --non-interactive
        env:
          EXPO_TOKEN: ${{ secrets.EXPO_TOKEN }}
```

### 测试工作流
```yaml
name: Test
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
      - run: npm ci
      - run: npm test
```

---

## 自动更新

```yaml
name: Update
on:
  push:
    branches: [main]
jobs:
  update:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - run: npm ci
      - run: npx eas-cli update --branch production
        env:
          EXPO_TOKEN: ${{ secrets.EXPO_TOKEN }}
```

---

## 相关技能

- **expo-deployment**: Expo 部署
- **github-actions-templates**: GitHub Actions 模板

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
