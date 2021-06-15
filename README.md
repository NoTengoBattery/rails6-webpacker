# Ruby on Rails template

This is a template designed to speed-up project lifting time. It's designed to use the best CI principles and to be automatically deployable to Heroku. With this template, developers can spend more time working on new projects than configuring every aspect of them.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## Perks

  - A very thorough CI pipeline (workflow) that runs linters and automated tests. With good code coverage, it guarantees that no undeployable code will pass the CI tests. Perfect fit for automatic deployment.
  - Linters configured to use the latest standards.
  - JavaScript via Webpacker exclusively. TypeScript is supported and encouraged.
  - Ready to deploy, it's designed as Heroku application but works in bare-servers as well.
  - Configured dependabot to keep the project always up-to-date.
  - A GitHub template, that means: no need to clone this project, just use it by clicking the green button!
  - PostgreSQL database.
  - Implemented and installed Active Storage with the very efficient libvips processor.
  - Ready for localization and internationalization.
  - Uses Stimulus and Turbo for front-end. Cutting edge technology.
  - Designed to stop developers from sticking to ancient and vulnerable old dependencies.
  - Supports automatically running tests in Chrome and Firefox in the CI pipeline.
  - Tailwind, Dart SASS and Iconify installed and ready to use.

> This template won't use Sprockets (assets pipeline). Webpack or Active Storage should be used instead.

## Dependencies

- Latest version of Ruby
- Latest version of Node.js
- Latest version of libvips

## Credentails

This application uses the Rails credentials store to save most of it's secrets. This template has no credentials store, so, you need to generate one. In that one, you will define the HTTP credentials to access your review and staging apps.

1. Run `bundle exec rails credentials:edit`
2. In that file, add the following lines:
  ```
  http_basic:
    username: <put a username here>
    password: <put a safe password here>
  ```
3. Save your master key in a safe place
4. Add the master key as a GitHub Secret `RAILS_MASTER_KEY` as well as for dependabot and edit the workflow file as instructed in there
5. Add that same master key to all Heroku environments and delete the `SECRET_KEY_BASE` variable
