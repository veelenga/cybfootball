## How to setup

  1. Install `ruby` of version **2.3.1**: https://www.ruby-lang.org/en/documentation/installation/

  1. Install `postgresql` of version **9**: https://wiki.postgresql.org/wiki/Detailed_installation_guides

  1. Clone repo and go to app root dir:

  ```sh
  $ git clone https://github.com/veelenga/cybfootball
  $ cd cybfootball
  ```

  1. Install `bundler` and all required dependencies:

  ```sh
  $ gem install bundler
  $ bundle install
  ```

  1. Create and migrate database, run tests:

  ```sh
  $ bundle exec rake db:create
  $ bundle exec rake db:migrate
  $ bundle exec rake db:seed
  $ bundle exec rake db:migrate RAILS_ENV=test
  $ bundle exec rspec
  ```

  1. Start app:

  ```sh
  $ bundle exec rails server
  ```
