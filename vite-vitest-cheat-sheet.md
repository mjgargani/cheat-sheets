# Vite & Vitest Cheat-Sheet (2025)

## **Vite Basics**

### Installation
```bash
# Create a new Vite project
npm create vite@latest my-project --template react

# Navigate to your project
tcd my-project

# Install dependencies
npm install

# Start the dev server
npm run dev
```

### Configuration
- **`vite.config.js` example:**
```javascript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    port: 3000,
  },
  build: {
    outDir: 'dist',
    sourcemap: true,
  },
  resolve: {
    alias: {
      '@': '/src',
    },
  },
});
```

### Common Commands
```bash
npm run dev     # Start development server
npm run build   # Build for production
npm run preview # Preview the production build
```

## **Vitest Basics**

### Installation
```bash
# Install Vitest and React Testing Library
npm install -D vitest @testing-library/react @testing-library/jest-dom
```

### Configuration
- **`vite.config.js` update for Vitest:**
```javascript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  test: {
    globals: true,
    environment: 'jsdom',
    setupFiles: './src/test/setup.js',
  },
});
```

- **`setup.js` for global setup:**
```javascript
import '@testing-library/jest-dom';
```

### Running Tests
```bash
npx vitest        # Run all tests
npx vitest watch  # Watch mode
npx vitest run    # Run tests without UI
```

### Example Test
```javascript
import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import App from '@/App';

test('renders a button and handles click', async () => {
  render(<App />);

  const button = screen.getByRole('button', { name: /click me/i });
  expect(button).toBeInTheDocument();

  await userEvent.click(button);
  expect(screen.getByText(/clicked/i)).toBeInTheDocument();
});
```

## **Advanced Vitest: Mocks & Testing with React/Next.js**

### Mocking Modules
- Mock a simple module in `src/utils/math.js`:
```javascript
export const add = (a, b) => a + b;
export const subtract = (a, b) => a - b;
```
- Mock in test file:
```javascript
import { vi } from 'vitest';
import * as math from '@/utils/math';

test('mock add function', () => {
  vi.spyOn(math, 'add').mockImplementation(() => 42);

  expect(math.add(1, 2)).toBe(42);
  expect(math.add).toHaveBeenCalledWith(1, 2);
});
```

### Mocking API Calls
- Mock a `fetch` request in `src/api.js`:
```javascript
export const fetchData = async () => {
  const response = await fetch('/api/data');
  return response.json();
};
```
- Mock in test file:
```javascript
import { vi } from 'vitest';
import { fetchData } from '@/api';

beforeEach(() => {
  vi.resetAllMocks();
});

test('mocks fetchData', async () => {
  global.fetch = vi.fn(() =>
    Promise.resolve({
      json: () => Promise.resolve({ data: 'mocked data' }),
    })
  );

  const data = await fetchData();
  expect(data).toEqual({ data: 'mocked data' });
  expect(global.fetch).toHaveBeenCalledWith('/api/data');
});
```

### Testing React Components with Mocked Context
```javascript
import { render, screen } from '@testing-library/react';
import { MyContext } from '@/context/MyContext';
import MyComponent from '@/components/MyComponent';

test('renders with mocked context', () => {
  render(
    <MyContext.Provider value={{ user: { name: 'John Doe' } }}>
      <MyComponent />
    </MyContext.Provider>
  );

  expect(screen.getByText(/john doe/i)).toBeInTheDocument();
});
```

## **Integration with Next.js**

### Setup
1. **Install dependencies:**
   ```bash
   npm install next @testing-library/react @testing-library/jest-dom vitest
   ```
2. **Update `vite.config.js`:**
   ```javascript
   import { defineConfig } from 'vite';
   import react from '@vitejs/plugin-react';

   export default defineConfig({
     plugins: [react()],
     test: {
       globals: true,
       environment: 'jsdom',
       setupFiles: './src/test/setup.js',
     },
   });
   ```
3. **`setup.js`:**
   ```javascript
   import '@testing-library/jest-dom';
   import { TextDecoder, TextEncoder } from 'util';

   global.TextEncoder = TextEncoder;
   global.TextDecoder = TextDecoder;
   ```

### Next.js Page Test Example
```javascript
import { render, screen } from '@testing-library/react';
import Home from '@/pages/index';

test('renders the home page', () => {
  render(<Home />);
  expect(screen.getByRole('heading', { name: /welcome to next.js/i })).toBeInTheDocument();
});
```

### Mocking API Routes
1. **API Route (`src/pages/api/data.js`):**
   ```javascript
   export default function handler(req, res) {
     res.status(200).json({ message: 'Hello, world!' });
   }
   ```
2. **Mock in Test:**
   ```javascript
   import { vi } from 'vitest';

   vi.mock('@/pages/api/data', () => ({
     default: () => ({ message: 'Mocked response' }),
   }));

   test('mocks API route', async () => {
     const { default: handler } = await import('@/pages/api/data');
     const res = { status: vi.fn().mockReturnThis(), json: vi.fn() };
     handler({}, res);

     expect(res.status).toHaveBeenCalledWith(200);
     expect(res.json).toHaveBeenCalledWith({ message: 'Mocked response' });
   });
   
