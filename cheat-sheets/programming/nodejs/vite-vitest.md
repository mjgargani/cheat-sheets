# Vite & Vitest Cheat Sheet

This cheat sheet provides an overview of Vite, a modern build tool, and Vitest, a fast and lightweight testing framework. It includes setup instructions, configurations, and examples to streamline development and testing workflows.

---

## Table of Contents

1. [Vite Basics](#vite-basics)
   - [Installation](#installation)
   - [Configuration](#configuration)
   - [Common Commands](#common-commands)
2. [Vitest Basics](#vitest-basics)
   - [Installation](#installation-1)
   - [Configuration](#configuration-1)
   - [Running Tests](#running-tests)
   - [Example Test](#example-test)
3. [Advanced Vitest Features](#advanced-vitest-features)
   - [Mocking Modules](#mocking-modules)
   - [Mocking API Calls](#mocking-api-calls)
   - [Testing React Components](#testing-react-components)
4. [Integration with Next.js](#integration-with-nextjs)
5. [Additional References](#additional-references)

---

## Vite Basics

### Installation

Create a new Vite project:

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

Example `vite.config.js`:

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

---

## Vitest Basics

### Installation

Install Vitest and React Testing Library:

```bash
npm install -D vitest @testing-library/react @testing-library/jest-dom
```

### Configuration

Update `vite.config.js` for Vitest:

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

Create a `setup.js` file for global setup:

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

---

## Advanced Vitest Features

### Mocking Modules

Mock a simple module in `src/utils/math.js`:

```javascript
export const add = (a, b) => a + b;
export const subtract = (a, b) => a - b;
```

Mock in a test file:

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

Mock a `fetch` request in `src/api.js`:

```javascript
export const fetchData = async () => {
  const response = await fetch('/api/data');
  return response.json();
};
```

Mock in a test file:

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

---

## Integration with Next.js

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

---

## Additional References

- [Vite Official Documentation](https://vitejs.dev/)
- [Vitest Documentation](https://vitest.dev/)
- [React Testing Library Documentation](https://testing-library.com/docs/react-testing-library/intro)
- [Next.js Testing Documentation](https://nextjs.org/docs/testing)
