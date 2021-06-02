const colors = require('tailwindcss/colors')

module.exports = {
  darkMode: 'class',
  purge: false,
  theme: {
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      main: colors.trueGray
    },
    container: {
      center: true
    },
    fontFamily: {
      mono: ['JetBrains Mono', 'monospace']
    }
  }
}
