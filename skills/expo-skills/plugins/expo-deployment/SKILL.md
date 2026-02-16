# Expo 部署 (Expo Deployment)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 5.5K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

使用 EAS Build 和 Submit 部署 Expo 应用到应用商店。

**适用场景**：构建和提交 Expo 应用到 App Store 和 Google Play。

---

## EAS Build

### 配置
```bash
eas build:configure
```

### 构建
```bash
# 开发构建
eas build --profile development --platform all

# 预览构建
eas build --profile preview --platform all

# 生产构建
eas build --profile production --platform all
```

### eas.json 配置
```json
{
  "build": {
    "development": {
      "developmentClient": true,
      "distribution": "internal"
    },
    "preview": {
      "distribution": "internal"
    },
    "production": {}
  }
}
```

---

## EAS Submit

### 提交到 App Store
```bash
eas submit --platform ios --latest
```

### 提交到 Google Play
```bash
eas submit --platform android --latest
```

---

## EAS Update

### 配置
```bash
eas update:configure
```

### 发布更新
```bash
eas update --branch production --message "修复bug"
```

---

## CI/CD 集成

### GitHub Actions
```yaml
name: Build
on: push
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
      - run: npm install -g eas-cli
      - run: eas build --platform all --non-interactive
        env:
          EXPO_TOKEN: ${{ secrets.EXPO_TOKEN }}
```

---

## 相关技能

- **expo-dev-client**: 开发客户端
- **upgrading-expo**: Expo 升级
- **expo-cicd-workflows**: CI/CD 工作流

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
