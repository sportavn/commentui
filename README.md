# Commentui
A simple comment API gem

## Installation
### 1. Gem install

Add this line to your application's Gemfile:
```ruby
gem 'commentui', "~> 0.1"
```

And then execute:
```bash
$ bundle install
```
Or install it yourself as:
```bash
$ gem install commentui
```
### 2. Migrations
Run the following [command](https://edgeguides.rubyonrails.org/engines.html#engine-setup) to copy Commentui's migrations to your application:
```bash
$ bundle exec rake commentui:install:migrations
```


Then run migrate database command:
```bash
$ rake db:migrate
```

To remove engine migration, run:
```bash
$ rake db:migrate SCOPE=commentui VERSION=0
```

### 3. Initializers
Run the following command to copy Commentui's initializers to your application:
```bash
$ bundle exec rake commentui:install:initializers
```

### 4. Route config
Add this line to your Rails application's routes.rb file:
```ruby
  mount Commentui::Engine => '/commentui'
```

## Usage
### 1. Models
Add this line to your model(s) should be able to post comments (usually user model):
```ruby
  acts_as_commentuier
```
The model'll look like:
```ruby
  class User < ApplicationRecord
    acts_as_commentuier
  end
```

Add this line to any models you want to be able to comment on (post,...)
```ruby
  acts_as_commentuiable
```
The model'll look like:
```ruby
  class Post < ApplicationRecord
    acts_as_commentuiable
  end
```

### 2. Controllers
Supported actions

|Helper|HTTP Verb|Path|Controller#Action|
|--- |--- |--- |--- |
|topic_comments_path|GET|/topics/:topic_id/comments(.:format)|commentui/comments#index|
||POST|/topics/:topic_id/comments(.:format)|commentui/comments#create|
|topic_comment_path|GET|/topics/:topic_id/comments/:id(.:format)|commentui/comments#show|
||PATCH|/topics/:topic_id/comments/:id(.:format)|commentui/comments#update|
||PUT|/topics/:topic_id/comments/:id(.:format)|commentui/comments#update|
||DELETE|/topics/:topic_id/comments/:id(.:format)|commentui/comments#destroy|
|topic_path|GET|/topics/:id(.:format)|commentui/topics#show|


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
