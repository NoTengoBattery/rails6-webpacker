#!/usr/bin/env -S bash

bundle exec rubocop -A --color
bundle exec haml-lint --color
yarn eslint-fix
yarn stylelint-fix
yarn tsc
bundle exec i18n-tasks normalize
bundle exec rspec --force-color --format documentation
bundle exec i18n-tasks health
