import type { NextConfig } from "next";

const nextConfig = {
  parser: '@typescript-eslint/parser',
  parserOptions: {
    ecmaVersion: 2020,  // Permite o uso de ES6+
    sourceType: 'module',  // Permite o uso de imports
    ecmaFeatures: {
      jsx: true  // Se você estiver usando React
    }
  },
  settings: {
    "import/resolver": {
      node: {
        extensions: ['.js', '.jsx', '.ts', '.tsx']
      }
    }
  },
  extends: [
    'plugin:@typescript-eslint/recommended',
    'plugin:react/recommended',
    'plugin:react-hooks/recommended',
    'next',
    'next/core-web-vitals'
  ],
};


export default nextConfig;
