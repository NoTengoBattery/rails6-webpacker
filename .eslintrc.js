module.exports = {
  env: {
    browser: true,
    es2021: true
  },
  extends: [
    'standard'
  ],
  parser: '@babel/eslint-parser',
  parserOptions: {
    ecmaVersion: 12,
    sourceType: 'module'
  },
  ignorePatterns: [
    '.bundle/',
    'node_modules/',
    'public/packs*/',
    'tmp/',
    'vendor/bundle/'
  ],
  rules: {
  }
}
