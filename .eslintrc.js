module.exports = {
  env: {
    browser: true,
    es2021: true,
    jest: true
  },
  extends: [
    'standard'
  ],
  parser: '@babel/eslint-parser',
  parserOptions: {
    ecmaVersion: 2020,
    ecmaFeatures: {
      impliedStrict: true,
      classes: true
    },
    sourceType: 'module'
  },
  plugins: ['@babel', '@typescript-eslint/eslint-plugin', 'html', 'import', 'prettier'],
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
