# Expo 升级 (Upgrading Expo)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 6.3K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

安全地升级 Expo SDK 版本，处理破坏性变更和依赖更新。

**适用场景**：需要升级 Expo SDK 版本、迁移到新版本或处理升级相关问题。

---

## 升级前准备

### 检查当前版本
```bash
npx expo --version
```

### 查看可用版本
```bash
npx expo upgrade --help
```

### 备份项目
```bash
git add . && git commit -m "保存升级前状态"
```

---

## 升级步骤

### 1. 运行升级命令
```bash
npx expo upgrade [target-sdk-version]
```

### 2. 检查破坏性变更
- 查看 Expo 更新日志
- 检查依赖兼容性
- 识别需要的手动更改

### 3. 更新依赖
```bash
npm install
# 或
yarn install
```

### 4. 清理缓存
```bash
npx expo start -c
```

---

## 常见升级问题

### 依赖冲突
- 检查 peer dependencies
- 更新相关包
- 可能需要调整版本范围

### 配置变更
- app.json/app.config.js 更新
- 新增配置选项
- 弃用的配置项

### 原生代码
- ios/Podfile.lock 更新
- android 构建配置
- 原生依赖更新

---

## 最佳实践

### 升级策略
- 逐版本升级（不跳版本）
- 在分支上进行升级
- 充分测试后合并

### 测试清单
- [ ] 应用启动正常
- [ ] 导航功能正常
- [ ] 原生模块工作
- [ ] 推送通知正常
- [ ] 应用内购买正常
- [ ] 相机/位置权限
- [ ] 深链接工作

---

## 相关技能

- **expo-deployment**: Expo 部署
- **expo-dev-client**: 开发客户端
- **expo-cicd-workflows**: CI/CD 工作流

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
