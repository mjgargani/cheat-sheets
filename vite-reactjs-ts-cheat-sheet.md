Here's an updated cheat sheet for setting up and working with a React 19 project using Vite and TypeScript as of December 2024. This guide also highlights deprecated functions and attributes to help you maintain modern and efficient code.

**1. Setting Up a New Project**

To create a new React project with Vite and TypeScript, run:

```bash
npm create vite@latest my-react-app -- --template react-ts
```

This command initializes a new Vite project with React and TypeScript templates.

**2. Project Structure**

After setup, your project structure will resemble:

```
my-react-app/
├── node_modules/
├── public/
│   └── index.html
├── src/
│   ├── App.tsx
│   ├── main.tsx
│   └── vite-env.d.ts
├── .gitignore
├── index.html
├── package.json
├── tsconfig.json
└── vite.config.ts
```

**3. Vite Configuration (`vite.config.ts`)**

Configure Vite to work seamlessly with React and TypeScript:

```typescript
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
    plugins: [react()],
    server: {
        open: true,
    },
});
```

This setup includes the React plugin and configures the development server to open automatically.

**4. TypeScript Configuration (`tsconfig.json`)**

Ensure your TypeScript configuration is optimized for React:

```json
{
    "compilerOptions": {
        "target": "ESNext",
        "module": "ESNext",
        "jsx": "react-jsx",
        "strict": true,
        "moduleResolution": "node",
        "esModuleInterop": true,
        "skipLibCheck": true,
        "forceConsistentCasingInFileNames": true
    },
    "include": ["src"]
}
```

**5. Running the Development Server**

Start the development server with:

```bash
npm run dev
```

Access your application at `http://localhost:3000`.

**6. Building for Production**

To create an optimized production build:

```bash
npm run build
```

The output will be in the `dist` directory.

**7. Deprecated Features in React 19**

React 19 has deprecated certain features to encourage better practices:

-   **`propTypes` and `defaultProps` for Function Components**: These have been removed. For function components, use TypeScript interfaces and default parameters instead.

    _Example Transition:_

    ```typescript
    // Before
    import PropTypes from "prop-types";

    function Heading({ text }) {
        return <h1>{text}</h1>;
    }

    Heading.propTypes = {
        text: PropTypes.string,
    };

    Heading.defaultProps = {
        text: "Hello, world!",
    };

    // After
    interface HeadingProps {
        text?: string;
    }

    function Heading({ text = "Hello, world!" }: HeadingProps) {
        return <h1>{text}</h1>;
    }
    ```

-   **Error Handling Changes**: Errors in render are no longer re-thrown, reducing duplication. Uncaught errors are reported to `window.reportError`, and caught errors are reported to `console.error`.

**8. Additional Resources**

-   **React TypeScript Cheatsheets**: Comprehensive guides for using React with TypeScript.

-   **Vite Documentation**: Official documentation for Vite.

-   **React 19 Upgrade Guide**: Detailed information on upgrading to React 19 and handling deprecated features.

By following this cheat sheet, you can set up a modern React project with Vite and TypeScript, while adhering to the latest best practices and avoiding deprecated features.
