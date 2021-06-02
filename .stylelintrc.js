module.exports = {
  extends: [
    "stylelint-config-sass-guidelines"
  ],
  plugins: [
    "stylelint-order",
    "stylelint-scss"
  ],
  rules: {
    "no-descending-specificity": true,
    "max-nesting-depth": [
      3,
      {
        "ignore": [
          "blockless-at-rules",
          "pseudo-classes"
        ]
      }
    ]
  },
  ignoreFiles: [
    ".bundle/**/*",
    "node_modules/**/*",
    "public/**/*",
    "tmp/**/*",
    "vendor/bundle/**/*"
  ]
}