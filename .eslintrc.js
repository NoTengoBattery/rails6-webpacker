module.exports = {
  env: {
    browser: true,
    es2020: true,
    jest: true
  },
  extends: [
    'standard',
    'eslint:recommended'
  ],
  parser: '@babel/eslint-parser',
  parserOptions: {
    ecmaVersion: 2020,
    ecmaFeatures: {
      impliedStrict: true,
      classes: false
    },
    sourceType: 'module'
  },
  ignorePatterns: [
    '.bundle/**/*',
    'node_modules/**/*',
    'public/**/*',
    'tmp/**/*',
    'vendor/bundle/**/*'
  ],
  overrides: [
    {
      files: [
        '*.ts'
      ],
      plugins: [
        '@typescript-eslint',
        '@typescript-eslint/eslint-plugin'
      ],
      extends: [
        'standard',
        'eslint:recommended',
        'plugin:@typescript-eslint/recommended'
      ],
      parser: '@typescript-eslint/parser'
    }
  ]
}
