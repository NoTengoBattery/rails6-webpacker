process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const { merge } = require('webpack-merge')
const webpackConfig = require('./base')
let production = merge({})

const terserPlugin = require('./terser')
webpackConfig.optimization.minimizer = []
production = merge(production, terserPlugin)
production = merge(production, { devtool: 'nosources-source-map' })

module.exports = merge(webpackConfig, production)
