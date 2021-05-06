const postcss = {
  plugins:
    [
      require('postcss-import'),
      require('postcss-flexbugs-fixes'),
      require('postcss-preset-env')({
        autoprefixer: {
          flexbox: 'no-2009'
        },
        stage: 3
      })
    ]
}

// Only run PurgeCSS in production Webpack builds, never on development
if (process.env.NODE_ENV === 'production') {
  postcss.plugins.push(
    require('@fullhuman/postcss-purgecss')({
      content: [
        './app/**/*.html',
        './app/**/*.html.erb',
        './app/**/*.html.haml',
        './app/**/*.html.slim',
        './app/helpers/**/*.rb',
        './app/packs/**/*.js',
        './app/packs/**/*.jsx',
        './app/packs/**/*.ts'
      ],
      defaultExtractor: content => content.match(/[\w-/:]+(?<!:)/g) || []
    })
  )
}

// Add plugins at the end of the chain
postcss.plugins.push(
  [
    require('autoprefixer')
  ]
)

module.exports = postcss
