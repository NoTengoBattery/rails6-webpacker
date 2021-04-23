const TerserPlugin = require('terser-webpack-plugin')

module.exports = {
  optimization: {
    minimizer: [
      new TerserPlugin({
        parallel: true,
        terserOptions: {
          ecma: 2021,
          compress: {
            defaults: true,
            passes: 3
          }
        }
      })
    ]
  }
}
