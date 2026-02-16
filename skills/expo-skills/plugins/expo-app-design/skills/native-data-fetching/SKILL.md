# 原生数据获取 (Native Data Fetching)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 6.5K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

在 React Native/Expo 应用中实现高效的数据获取策略，包括缓存、离线支持和性能优化。

**适用场景**：React Native/Expo 应用中需要实现数据获取、API 调用、缓存策略或离线数据同步。

---

## 核心概念

### 数据获取方法

**Fetch API**：
```javascript
const response = await fetch('https://api.example.com/data');
const data = await response.json();
```

**Axios**：
```javascript
import axios from 'axios';
const { data } = await axios.get('https://api.example.com/data');
```

**React Query / TanStack Query**：
```javascript
import { useQuery } from '@tanstack/react-query';

const { data, isLoading, error } = useQuery({
  queryKey: ['data'],
  queryFn: () => fetch('/api/data').then(r => r.json()),
});
```

---

## 缓存策略

### 内存缓存
- 快速访问
- 应用关闭后丢失
- 适合临时数据

### 持久化缓存
- AsyncStorage / SQLite
- 离线可用
- 需要过期策略

### 缓存模式

| 模式 | 描述 | 适用场景 |
|------|------|----------|
| **Cache First** | 优先缓存，失败时网络 | 静态资源 |
| **Network First** | 优先网络，失败时缓存 | 实时数据 |
| **Stale While Revalidate** | 返回缓存，后台更新 | 大多数场景 |
| **Network Only** | 仅网络 | 敏感数据 |
| **Cache Only** | 仅缓存 | 离线资源 |

---

## 离线支持

### 检测网络状态
```javascript
import * as Network from 'expo-network';

const { isInternetReachable } = await Network.getNetworkStateAsync();
```

### 离线队列
- 存储失败请求
- 网络恢复时重试
- 处理冲突

### 数据同步
- 本地优先架构
- 后台同步
- 冲突解决策略

---

## 性能优化

### 请求优化
- 批量请求
- 分页加载
- 请求去重
- 取消重复请求

### 响应优化
- 数据压缩
- 选择性字段
- 分块加载

### 加载状态
- 骨架屏
- 渐进式加载
- 乐观更新

---

## 错误处理

### 错误类型
- 网络错误
- 服务器错误
- 数据解析错误
- 超时错误

### 处理策略
```javascript
try {
  const data = await fetchData();
} catch (error) {
  if (error instanceof NetworkError) {
    // 离线处理
  } else if (error instanceof ServerError) {
    // 服务器错误处理
  }
  // 重试逻辑
}
```

---

## 安全最佳实践

### 敏感数据
- 不在本地存储敏感信息
- 使用安全存储 (SecureStore)
- 令牌刷新机制

### HTTPS
- 始终使用 HTTPS
- 证书固定 (SSL Pinning)
- 信任证书验证

---

## 相关技能

- **expo-deployment**: Expo 部署
- **upgrading-expo**: Expo 升级
- **api-design-principles**: API 设计原则

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
