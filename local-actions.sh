#!/usr/bin/env -S bash

bundle exec rubocop -A --color
yarn eslint --fix "app/packs/**/**.{js,ts}"
yarn stylelint --fix "app/packs/**/**.{sass,scss}"
yarn tsc --pretty
bundle exec i18n-tasks normalize
bundle exec rspec --force-color --format documentation
bundle exec i18n-tasks health
