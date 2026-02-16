# Expo 开发客户端 (Expo Dev Client)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 5.6K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

创建自定义开发客户端，在 Expo 项目中使用原生代码。

**适用场景**：需要使用 Expo 不原生支持的库、自定义原生代码或创建定制开发环境。

---

## 核心概念

### 开发客户端 vs Expo Go
- **Expo Go**: 通用客户端，仅支持 Expo SDK
- **开发客户端**: 自定义客户端，支持任何原生代码

### 使用场景
- 需要原生模块
- 自定义原生配置
- 使用不兼容 Expo Go 的库
- 需要定制开发体验

---

## 创建开发客户端

### 安装
```bash
npx expo install expo-dev-client
```

### 构建
```bash
# 本地构建
npx expo run:android
npx expo run:ios

# 云端构建
eas build --profile development
```

### 运行
```bash
npx expo start --dev-client
```

---

## 配置

### app.json / app.config.js
```json
{
  "expo": {
    "plugins": [
      "expo-dev-client"
    ]
  }
}
```

### 添加原生依赖
```bash
npx expo install expo-camera
npx expo prebuild
```

---

## 开发工作流

1. **创建开发客户端** - 一次性
2. **启动开发服务器** - `expo start --dev-client`
3. **在客户端中打开** - 扫码或深链接
4. **热重载** - 更改即时生效

---

## 相关技能

- **expo-deployment**: Expo 部署
- **upgrading-expo**: Expo 升级
- **expo-cicd-workflows**: CI/CD 工作流

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
