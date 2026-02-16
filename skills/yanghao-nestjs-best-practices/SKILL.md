# NestJS 最佳实践 - NestJS Best Practices

> **原始仓库**: `kadajett/agent-nestjs-skills/nestjs-best-practices`
> **安装量**: 3.4K
> **翻译日期**: 2026-02-15
> **原文链接**: https://github.com/yanghao1143/chiclaude-skills

---

## 📖 技能简介

NestJS 框架最佳实践，包括模块化设计、依赖注入、异常处理、中间件配置和测试策略。

---

## 🎯 何时使用此技能

当用户进行以下工作时使用：

- 开发 NestJS 应用
- 设计模块结构
- 配置依赖注入
- 实现认证授权

---

## 📁 项目结构

```
src/
├── main.ts              # 入口文件
├── app.module.ts        # 根模块
├── common/              # 公共模块
│   ├── decorators/
│   ├── filters/
│   ├── guards/
│   ├── interceptors/
│   └── pipes/
├── modules/             # 功能模块
│   ├── users/
│   │   ├── users.module.ts
│   │   ├── users.controller.ts
│   │   ├── users.service.ts
│   │   ├── users.dto.ts
│   │   └── users.entity.ts
│   └── auth/
└── config/              # 配置
```

---

## 🚀 模块设计

### 模块定义

```typescript
@Module({
  imports: [TypeOrmModule.forFeature([User])],
  controllers: [UsersController],
  providers: [UsersService],
  exports: [UsersService],
})
export class UsersModule {}
```

### 动态模块

```typescript
@Module({})
export class DatabaseModule {
  static register(options: DatabaseOptions): DynamicModule {
    return {
      module: DatabaseModule,
      providers: [
        {
          provide: 'DATABASE_OPTIONS',
          useValue: options,
        },
      ],
    };
  }
}
```

---

## 💉 依赖注入

```typescript
@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>,
  ) {}

  async findOne(id: string): Promise<User> {
    return this.usersRepository.findOne({ where: { id } });
  }
}
```

---

## 🛡️ 异常处理

### 异常过滤器

```typescript
@Catch(HttpException)
export class HttpExceptionFilter implements ExceptionFilter {
  catch(exception: HttpException, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const response = ctx.getResponse<Response>();
    const status = exception.getStatus();

    response.status(status).json({
      statusCode: status,
      timestamp: new Date().toISOString(),
      message: exception.message,
    });
  }
}
```

### 全局异常过滤器

```typescript
app.useGlobalFilters(new HttpExceptionFilter());
```

---

## 🔐 认证守卫

```typescript
@Injectable()
export class JwtAuthGuard implements CanActivate {
  constructor(private jwtService: JwtService) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest();
    const token = this.extractToken(request);
    
    const payload = await this.jwtService.verifyAsync(token);
    request.user = payload;
    return true;
  }
}
```

---

## 🧪 测试

```typescript
describe('UsersService', () => {
  let service: UsersService;

  beforeEach(async () => {
    const module = await Test.createTestingModule({
      providers: [
        UsersService,
        {
          provide: getRepositoryToken(User),
          useValue: mockRepository,
        },
      ],
    }).compile();

    service = module.get<UsersService>(UsersService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
```

---

## 🔗 相关链接

- [原文链接](https://github.com/yanghao1143/chiclaude-skills)
- [NestJS 官方文档](https://nestjs.com)
- [OpenClaw AI 社区](https://chiclaude.com)

---

*翻译搬运自 [skills.sh](https://skills.sh)*
