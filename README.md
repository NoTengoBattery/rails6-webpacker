# Dependencies
  - Ruby 3.0

# Configuration
1. Use the template and make sure to check "Include all branches"
1. Clone the repository to the local machine
1. Initialize git-flow in all local machines with `git flow init`
    1. Set production branch: `main`
    1. Set development branch: `development`
    1. Set the rest of the options as defaults
    1. Initialize a new feature branch. You can call it `setup-from-template`
1. Run `bundle update` to install the latest version of the gems for the project
1. Reinstall and setup the required packages by running `bundle exec bin/setup`
1. Generate the Rails credentials for the project: `EDITOR=true bundle exec rails credentials:edit`
1. Change the name of the project!
1. Execute the Rubocop command, so the linter's workflow won't fail: `bundle exec rubocop -A`
1. Add and commit all your changes
1. Finalize your feature branch and merge your changes
1. Everything should be ready to start working!

# Important
1. Change the hostname for `devise` when deploying, check the files inside `config/environments`
