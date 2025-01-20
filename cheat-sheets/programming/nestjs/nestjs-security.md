# JWT Decorators and Guards in NestJS Cheat Sheet

Updated: **January 2025**  
This cheat sheet covers modern practices for using JWTs with custom decorators and guards in NestJS, including advanced examples.

---

## **1. Custom Decorators**
### Creating a Decorator to Extract User from JWT
You can create a custom decorator to access user data directly in a controller.

```typescript
import { createParamDecorator, ExecutionContext } from '@nestjs/common';

export const CurrentUser = createParamDecorator(
  (data: unknown, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest();
    return request.user; // Assuming Passport.js populates request.user
  },
);
```

**Usage in Controller:**
```typescript
@Get('profile')
getProfile(@CurrentUser() user: any) {
  return user;
}
```

---

## **2. JWT Auth Guard**
### Implementing a Guard with `@nestjs/passport`
The guard verifies if the JWT is valid.

```typescript
import { Injectable } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';

@Injectable()
export class JwtAuthGuard extends AuthGuard('jwt') {}
```

**Usage in Controller:**
```typescript
@UseGuards(JwtAuthGuard)
@Get('protected')
getProtectedData() {
  return { message: 'This is protected!' };
}
```

---

## **3. JWT Strategy**
### Configuring the Strategy in the Service
The strategy defines how the JWT is validated.

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
      secretOrKey: process.env.JWT_SECRET, // Store the key in environment variables
    });
  }

  async validate(payload: any) {
    return { userId: payload.sub, username: payload.username };
  }
}
```

---

## **4. Custom Guards**
### Example: Custom Permission Guard
Create a guard to check specific permissions.

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

**Usage in Controller:**
```typescript
@UseGuards(new RolesGuard(['admin']))
@Get('admin-area')
getAdminData() {
  return { message: 'Welcome, admin!' };
}
```

---

## **5. Authentication Module**
### Full Configuration Setup
Ensure the `JwtModule` is registered correctly in your project.

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

## **6. Advanced Tips**

### Middleware for Request Tracking
Add middleware to log user activity for each request.

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

### Refresh Tokens
Add support for Refresh Tokens to enhance login experience:
- Store the Refresh Token in the database.
- Validate it instead of revalidating the JWT for every request.

---

## **7. References**
- [NestJS Documentation - Guards](https://docs.nestjs.com/guards)
- [NestJS Documentation - Custom Decorators](https://docs.nestjs.com/custom-decorators)
- [Passport JWT Strategy](http://www.passportjs.org/packages/passport-jwt/)
- [JWT Best Practices](https://auth0.com/blog/jwt-best-practices/)
