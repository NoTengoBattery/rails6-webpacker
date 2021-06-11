# Ruby on Rails template

This is a template designed to speed-up project lifting time. It's designed to use the best CI principles and to be automatically deployable to Heroku. With this template, developers can spend more time working on new projects than configuring every aspect of them.

## Perks

  - A very thorough CI pipeline (workflow) that runs linters and automated tests. With good code coverage, it guarantees that no undeployable code will pass the CI tests. Perfect fit for automatic deployment.
  - Linters configured to use the latest standards.
  - JavaScript via Webpacker exclusively. TypeScript is supported and encouraged.
  - Ready to deploy, it's designed to be a Heroku application but works in bare-servers as well.
  - Configured dependabot to keep the project always up-to-date.
  - A GitHub template, that means: no need to clone this project, just use it using the green button!
  - PostgreSQL database.
  - Implemented and installed Active Storage with the very efficient libvips processor.
  - Ready for localization and internationalization.
  - Uses Stimulus and Turbo. Cutting edge technology.
  - Designed to stop developers from sticking to ancient and vulnerable old dependencies.
  - Supports automatically running tests in Chrome and Firefox in the CI pipeline.
  - Tailwind, Dart SASS and Iconify installed and ready to use.

> This template won't use Sprockets (assets pipeline). Webpack or Active Storage should be used instead.

## Dependencies

- Latest version of Ruby
- Latest version of Node.js
- Latest version of libvips
