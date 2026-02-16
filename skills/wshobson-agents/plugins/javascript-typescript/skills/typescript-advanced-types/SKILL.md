# TypeScript 高级类型 (TypeScript Advanced Types)

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 6.0K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

掌握 TypeScript 高级类型系统，包括泛型和条件类型。

**适用场景**：使用 TypeScript 高级类型特性、泛型、条件类型、映射类型等。

---

## 泛型基础

### 函数泛型
```typescript
function identity<T>(arg: T): T {
  return arg;
}

// 使用
const str = identity<string>("hello");
const num = identity(42); // 类型推断
```

### 接口泛型
```typescript
interface Container<T> {
  value: T;
  getValue(): T;
}
```

### 泛型约束
```typescript
interface Lengthwise {
  length: number;
}

function logLength<T extends Lengthwise>(arg: T): T {
  console.log(arg.length);
  return arg;
}
```

---

## 条件类型

### 基本语法
```typescript
type IsString<T> = T extends string ? true : false;

type A = IsString<string>; // true
type B = IsString<number>; // false
```

### 常用工具类型

**Exclude**
```typescript
type Exclude<T, U> = T extends U ? never : T;
type A = Exclude<'a' | 'b' | 'c', 'a'>; // 'b' | 'c'
```

**Extract**
```typescript
type Extract<T, U> = T extends U ? T : never;
type A = Extract<'a' | 'b' | 'c', 'a' | 'f'>; // 'a'
```

**NonNullable**
```typescript
type NonNullable<T> = T extends null | undefined ? never : T;
```

---

## 映射类型

### 基本映射
```typescript
type Readonly<T> = {
  readonly [P in keyof T]: T[P];
};

type Optional<T> = {
  [P in keyof T]?: T[P];
};
```

### 内置工具类型
```typescript
// Partial - 所有属性可选
type PartialUser = Partial<User>;

// Required - 所有属性必需
type RequiredUser = Required<User>;

// Pick - 选择属性
type UserName = Pick<User, 'name'>;

// Omit - 排除属性
type UserWithoutId = Omit<User, 'id'>;
```

---

## 模板字面量类型

```typescript
type EventName = 'click' | 'scroll' | 'mousemove';
type EventHandler = `on${Capitalize<EventName>}`;
// "onClick" | "onScroll" | "onMousemove"
```

---

## 类型推断

### infer 关键字
```typescript
type ReturnType<T> = T extends (...args: any[]) => infer R ? R : any;

function greet() { return 'hello'; }
type GreetReturn = ReturnType<typeof greet>; // string
```

---

## 最佳实践

### 类型命名
- 使用 PascalCase
- 描述性名称
- 一致的命名约定

### 避免 any
- 使用 unknown 替代
- 添加类型守卫
- 明确类型断言

---

## 相关技能

- **vue-best-practices**: Vue + TypeScript
- **nodejs-backend-patterns**: Node.js TypeScript

---

## 安全检查

✅ 无恶意代码
✅ 无可疑外部URL
✅ 无API密钥或凭证
✅ 内容与技能描述相符
