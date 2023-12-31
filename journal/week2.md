# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby

### Bundler

Bundler is a package manager for ruby.  It is the primary way to install ruby packages (known as gems) for ruby.

#### Install Gems

You need to create a Gemfile and define your gems in that file.

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```
Then you need to run the `bundle install` command.

This will install the gems on the system globally (unlike nodejs which installs packages in place in a folder called node_modules).

A Gemfile.lock will be created to lock down the gem versions used in this project.

#### Executing ruby scripts in the context of bundler

We have to use `bundle exec` to tell future ruby scripts to use the gems we installed.  This is the way we set context.

#### Sinatra

Sinatra is a micro web-framework for ruby to build web-apps.

It is great for mock or development servers or for very simple projects. 

You can create a web-server in a single file.

[Sinatra](https://sinatrarb.com/)

```rb
require 'sinatra'
get '/frank-says' do
    'Put this in your pipe & smoke it!'
end
```
## Terratowns Mock Server

### Running the web server

We can run the web server by executing the follwoing commands:

```rb
bundle install
bundle exex ruby server.rb
```

All of the code for our server is stored in the `server.rb` file

