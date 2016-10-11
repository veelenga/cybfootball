## List of technologies used

  - [Rails 5](https://github.com/rails/rails)
  - [Bootstrap 3](https://github.com/twbs/bootstrap-sass)
  - [PostgresSQL](https://www.postgresql.org/)
  - [Slim template engine](http://slim-lang.com/)
  - [RSpec](http://rspec.info/) and [Factory Girl](https://github.com/thoughtbot/factory_girl/wiki)
  - A little of jQuery, CoffeeScript, Sass and maybe something else

## Installation

  1. Install `rvm` following the installation instuctions: https://rvm.io/
  1. Install required version of ruby via `rvm`:

  ```sh
  $ rvm install ruby-2.3.0
  ```

  1. Install `postgresql` of version 9: https://wiki.postgresql.org/wiki/Detailed_installation_guides

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
  $ rspec
  ```

  1. Start app:

  ```sh
  $ rails server
  ```
