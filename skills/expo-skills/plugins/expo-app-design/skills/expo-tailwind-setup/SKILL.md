# Expo Tailwind 设置 (Expo Tailwind Setup)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 5.5K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

在 Expo/React Native 项目中配置 Tailwind CSS (NativeWind)。

**适用场景**：在 React Native 项目中使用 Tailwind CSS 风格。

---

## 安装

### 安装 NativeWind
```bash
npm install nativewind
npm install --dev tailwindcss@3.3.2
```

### 初始化 Tailwind
```bash
npx tailwindcss init
```

---

## 配置

### tailwind.config.js
```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./App.{js,jsx,ts,tsx}",
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

### babel.config.js
```javascript
module.exports = function (api) {
  api.cache(true);
  return {
    presets: ['babel-preset-expo', 'nativewind/babel'],
  };
};
```

---

## 使用

### 基本用法
```jsx
import { View, Text } from 'react-native';

function App() {
  return (
    <View className="flex-1 items-center justify-center bg-white">
      <Text className="text-2xl font-bold text-blue-500">
        Hello NativeWind!
      </Text>
    </View>
  );
}
```

### 自定义主题
```javascript
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      colors: {
        brand: '#FF6B6B',
      },
    },
  },
}
```

---

## 相关技能

- **expo-deployment**: Expo 部署
- **tailwind-design-system**: Tailwind 设计系统

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
