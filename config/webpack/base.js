const { webpackConfig } = require('@rails/webpacker')

const extractors = require('./utilities')
const scss = '.scss'
const sass = 'sass-loader'
const scssRule = webpackConfig.module.rules[extractors.findLoaderRuleIndex(scss, webpackConfig)]
const loaderIndex = extractors.findLoaderIndex(scss, sass, webpackConfig)
scssRule.use.splice(loaderIndex, 0, {
  loader: 'postcss-loader',
  options: { sourceMap: true }
})

module.exports = webpackConfig
