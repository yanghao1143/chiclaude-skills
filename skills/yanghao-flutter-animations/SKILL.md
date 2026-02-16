# Flutter 动画 (Flutter Animations)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 6.4K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

Flutter 应用中实现流畅、有意义的动画效果，提升用户体验。

**适用场景**：Flutter 应用中需要实现动画效果、过渡动画、交互动画或复杂动画序列。

---

## 动画类型

### 隐式动画 (Implicit Animations)
- 自动处理动画状态
- 简单易用
- 示例：AnimatedContainer、AnimatedOpacity

```dart
AnimatedContainer(
  duration: Duration(milliseconds: 300),
  width: _expanded ? 200 : 100,
  height: _expanded ? 200 : 100,
  color: _expanded ? Colors.blue : Colors.red,
  child: FlutterLogo(),
)
```

### 显式动画 (Explicit Animations)
- 完全控制动画
- 需要 AnimationController
- 示例：RotationTransition、ScaleTransition

```dart
AnimationController _controller;
Animation<double> _animation;

@override
void initState() {
  super.initState();
  _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );
}
```

---

## 核心组件

### AnimationController
- 控制动画时间和状态
- forward()、reverse()、repeat()
- 需要在 dispose() 中清理

### CurvedAnimation
- 定义动画曲线
- 内置曲线：easeIn、easeOut、bounceOut
- 自定义曲线

### Tween
- 定义开始和结束值
- 支持各种类型：ColorTween、SizeTween

---

## 动画曲线

| 曲线 | 效果 | 适用场景 |
|------|------|----------|
| `easeIn` | 开始慢，结束快 | 进入动画 |
| `easeOut` | 开始快，结束慢 | 退出动画 |
| `easeInOut` | 两头慢，中间快 | 循环动画 |
| `bounceOut` | 弹跳效果 | 反馈动画 |
| `elasticOut` | 弹性效果 | 有趣的交互 |
| `linear` | 匀速 | 进度指示 |

---

## 常见动画模式

### 淡入淡出
```dart
FadeTransition(
  opacity: _animation,
  child: child,
)
```

### 缩放
```dart
ScaleTransition(
  scale: _animation,
  child: child,
)
```

### 滑动
```dart
SlideTransition(
  position: Tween<Offset>(
    begin: Offset(-1.0, 0.0),
    end: Offset.zero,
  ).animate(_animation),
  child: child,
)
```

### 旋转
```dart
RotationTransition(
  turns: _animation,
  child: child,
)
```

---

## Hero 动画

页面间共享元素过渡：

```dart
// 源页面
Hero(
  tag: 'image-hero',
  child: Image.network(url),
)

// 目标页面
Hero(
  tag: 'image-hero',
  child: Image.network(url),
)
```

---

## 交错动画

多个动画按顺序执行：

```dart
staggeredAnimation = TweenSequence([
  TweenSequenceItem(
    tween: Tween(begin: 0.0, end: 1.0)
      .chain(CurveTween(curve: Curves.easeIn)),
    weight: 50.0,
  ),
  TweenSequenceItem(
    tween: Tween(begin: 1.0, end: 0.0)
      .chain(CurveTween(curve: Curves.easeOut)),
    weight: 50.0,
  ),
]).animate(_controller);
```

---

## 性能优化

### 使用 AnimatedBuilder
- 只重建动画部分
- 减少不必要的重建

### 避免过度动画
- 不在 build() 中创建动画
- 使用 const 构造函数
- 复用动画对象

---

## 最佳实践

### 有意义的动画
- 提供反馈
- 引导注意力
- 展示关系
- 不要装饰性动画

### 时长建议
- 微交互：100-200ms
- 标准过渡：200-400ms
- 复杂动画：400-600ms

### 可访问性
- 尊重系统动画设置
- 提供关闭动画选项

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
