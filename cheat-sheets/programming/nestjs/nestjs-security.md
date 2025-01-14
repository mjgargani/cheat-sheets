# JWT Decorators e Guards no NestJS

Atualizado em: **Janeiro de 2025**  
Este cheat-sheet cobre práticas modernas para usar Decorators e Guards no NestJS, especialmente com JWT, incluindo exemplos avançados.

---

## **1. Decorators Customizados**
### Criando um Decorator para Extrair o Usuário do JWT
Você pode criar um Decorator para acessar dados do usuário diretamente no controller.

```typescript
import { createParamDecorator, ExecutionContext } from '@nestjs/common';

export const CurrentUser = createParamDecorator(
  (data: unknown, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest();
    return request.user; // Assumindo que o Passport.js popula request.user
  },
);
```

**Uso no Controller:**
```typescript
@Get('profile')
getProfile(@CurrentUser() user: any) {
  return user;
}
```

---

## **2. JWT Auth Guard**
### Implementando um Guard com `@nestjs/passport`
O Guard é responsável por verificar se o JWT é válido.

```typescript
import { Injectable } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';

@Injectable()
export class JwtAuthGuard extends AuthGuard('jwt') {}
```

**Uso no Controller:**
```typescript
@UseGuards(JwtAuthGuard)
@Get('protected')
getProtectedData() {
  return { message: 'This is protected!' };
}
```

---

## **3. Estratégia JWT**
### Configurando a Estratégia no Serviço
A estratégia define como o JWT será validado.

```typescript
import { Injectable } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { Strategy, ExtractJwt } from 'passport-jwt';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor() {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: process.env.JWT_SECRET, // Armazene a chave em variáveis de ambiente
    });
  }

  async validate(payload: any) {
    return { userId: payload.sub, username: payload.username };
  }
}
```

---

## **4. Guards Customizados**
### Exemplo: Guard de Permissão Personalizada
Você pode criar um guard para verificar permissões específicas.

```typescript
import { Injectable, CanActivate, ExecutionContext } from '@nestjs/common';

@Injectable()
export class RolesGuard implements CanActivate {
  constructor(private readonly roles: string[]) {}

  canActivate(context: ExecutionContext): boolean {
    const request = context.switchToHttp().getRequest();
    const user = request.user;
    return this.roles.some((role) => user.roles?.includes(role));
  }
}
```

**Uso no Controller:**
```typescript
@UseGuards(new RolesGuard(['admin']))
@Get('admin-area')
getAdminData() {
  return { message: 'Welcome, admin!' };
}
```

---

## **5. Módulo de Autenticação**
### Estrutura Completa de Configuração
Certifique-se de registrar o módulo `JwtModule` corretamente no seu projeto.

```typescript
import { Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { JwtStrategy } from './jwt.strategy';

@Module({
  imports: [
    PassportModule,
    JwtModule.register({
      secret: process.env.JWT_SECRET,
      signOptions: { expiresIn: '1h' },
    }),
  ],
  providers: [JwtStrategy],
  exports: [JwtModule],
})
export class AuthModule {}
```

---

## **6. Dicas Avançadas**
### Middleware para Rastrear Requisições
Adicione um middleware para rastrear o usuário nas requisições.

```typescript
import { Injectable, NestMiddleware } from '@nestjs/common';

@Injectable()
export class LoggerMiddleware implements NestMiddleware {
  use(req: any, res: any, next: () => void) {
    console.log(`User: ${req.user?.username || 'Guest'} accessed ${req.path}`);
    next();
  }
}
```

### Uso de Refresh Tokens
Adicione suporte a Refresh Tokens para melhorar a experiência de login:
- Salve o Refresh Token no banco de dados.
- Valide-o ao invés de revalidar o JWT a cada requisição.

---

## **7. Referências**
- [NestJS Documentation - Guards](https://docs.nestjs.com/guards)
- [NestJS Documentation - Custom Decorators](https://docs.nestjs.com/custom-decorators)
- [Passport JWT Strategy](http://www.passportjs.org/packages/passport-jwt/)
- [JWT Best Practices](https://auth0.com/blog/jwt-best-practices/)