# Python 性能优化 - Python Performance Optimization

> **原始仓库**: `wshobson/agents/python-performance-optimization`
> **安装量**: 4.1K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

使用 cProfile、内存分析器和性能最佳实践来分析和优化 Python 代码。适用于调试慢速 Python 代码、优化性能瓶颈或提高应用程序性能。

---

## 🎯 何时使用此技能

当用户遇到以下情况时使用：

- 识别 Python 应用程序中的性能瓶颈
- 减少应用程序延迟和响应时间
- 优化 CPU 密集型操作
- 减少内存消耗和内存泄漏
- 提高数据库查询性能
- 优化 I/O 操作
- 加速数据处理管道
- 实现高性能算法
- 分析生产环境应用程序

---

## 🔧 核心概念

### 1. 分析类型

- **CPU 分析**: 识别耗时函数
- **内存分析**: 追踪内存分配和泄漏
- **行级分析**: 逐行粒度的性能分析
- **调用图**: 可视化函数调用关系

### 2. 性能指标

- **执行时间**: 操作耗时
- **内存使用**: 峰值和平均内存消耗
- **CPU 利用率**: 处理器使用模式
- **I/O 等待**: I/O 操作耗时

### 3. 优化策略

- **算法优化**: 更好的算法和数据结构
- **实现优化**: 更高效的代码模式
- **并行化**: 多线程/多进程
- **缓存**: 避免冗余计算
- **原生扩展**: 关键路径使用 C/Rust

---

## 🚀 快速入门

### 基本计时

```python
import time

def measure_time():
    """简单的计时测量。"""
    start = time.time()

    # 你的代码
    result = sum(range(1000000))

    elapsed = time.time() - start
    print(f"执行时间: {elapsed:.4f} 秒")
    return result

# 更好的方式: 使用 timeit 进行精确测量
import timeit

execution_time = timeit.timeit(
    "sum(range(1000000))",
    number=100
)
print(f"平均时间: {execution_time/100:.6f} 秒")
```

---

## 📊 分析工具

### 模式 1: cProfile - CPU 分析

```python
import cProfile
import pstats
from pstats import SortKey

def slow_function():
    """待分析的函数。"""
    total = 0
    for i in range(1000000):
        total += i
    return total

# 分析代码
if __name__ == "__main__":
    profiler = cProfile.Profile()
    profiler.enable()

    slow_function()

    profiler.disable()

    # 打印统计信息
    stats = pstats.Stats(profiler)
    stats.sort_stats(SortKey.CUMULATIVE)
    stats.print_stats(10)  # 前 10 个函数
```

**命令行分析:**

```bash
# 分析脚本
python -m cProfile -o output.prof script.py

# 查看结果
python -m pstats output.prof
```

### 模式 2: line_profiler - 逐行分析

```python
# 安装: pip install line-profiler

# 添加 @profile 装饰器
@profile
def process_data(data):
    """带行级分析的函数。"""
    result = []
    for item in data:
        processed = item * 2
        result.append(processed)
    return result

# 运行方式:
# kernprof -l -v script.py
```

### 模式 3: memory_profiler - 内存使用

```python
# 安装: pip install memory-profiler

from memory_profiler import profile

@profile
def memory_intensive():
    """大量使用内存的函数。"""
    # 创建大列表
    big_list = [i for i in range(1000000)]

    # 创建大字典
    big_dict = {i: i**2 for i in range(100000)}

    return sum(big_list)

if __name__ == "__main__":
    memory_intensive()

# 运行方式:
# python -m memory_profiler script.py
```

---

## ⚡ 优化模式

### 列表推导式 vs 循环

```python
import timeit

# 慢: 传统循环
def slow_squares(n):
    result = []
    for i in range(n):
        result.append(i**2)
    return result

# 快: 列表推导式
def fast_squares(n):
    return [i**2 for i in range(n)]

# 基准测试
n = 100000
slow_time = timeit.timeit(lambda: slow_squares(n), number=100)
fast_time = timeit.timeit(lambda: fast_squares(n), number=100)

print(f"循环: {slow_time:.4f}s")
print(f"推导式: {fast_time:.4f}s")
print(f"加速: {slow_time/fast_time:.2f}x")
```

### 使用生成器节省内存

```python
import sys

def list_approach():
    """内存密集型列表。"""
    data = [i**2 for i in range(1000000)]
    return sum(data)

def generator_approach():
    """内存高效的生成器。"""
    data = (i**2 for i in range(1000000))
    return sum(data)

# 内存比较
list_data = [i for i in range(1000000)]
gen_data = (i for i in range(1000000))

print(f"列表大小: {sys.getsizeof(list_data)} 字节")
print(f"生成器大小: {sys.getsizeof(gen_data)} 字节")
```

### 字符串拼接

```python
import timeit

def slow_concat(items):
    """慢速字符串拼接。"""
    result = ""
    for item in items:
        result += str(item)
    return result

def fast_concat(items):
    """快速字符串拼接 - 使用 join。"""
    return "".join(str(item) for item in items)

items = list(range(10000))

# 基准测试
slow = timeit.timeit(lambda: slow_concat(items), number=100)
fast = timeit.timeit(lambda: fast_concat(items), number=100)

print(f"拼接 (+): {slow:.4f}s")
print(f"join: {fast:.4f}s")
```

### 使用 functools.lru_cache 缓存

```python
from functools import lru_cache

@lru_cache(maxsize=None)
def fibonacci_fast(n):
    """带缓存的斐波那契数列。"""
    if n < 2:
        return n
    return fibonacci_fast(n-1) + fibonacci_fast(n-2)

# 大幅加速递归算法
n = 30
fast_time = timeit.timeit(lambda: fibonacci_fast(n), number=1000)
print(f"带缓存: {fast_time:.4f}s")

# 查看缓存信息
print(f"缓存信息: {fibonacci_fast.cache_info()}")
```

---

## 📋 最佳实践清单

- [ ] 分析代码以识别瓶颈
- [ ] 使用适当的数据结构
- [ ] 在有益的地方实现缓存
- [ ] 优化数据库查询
- [ ] 对大数据集使用生成器
- [ ] 对 CPU 密集型任务考虑多进程
- [ ] 对 I/O 密集型任务使用异步 I/O
- [ ] 最小化热循环中的函数调用开销
- [ ] 检查内存泄漏
- [ ] 优化前后进行基准测试

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [GitHub 仓库](https://github.com/wshobson/agents)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
