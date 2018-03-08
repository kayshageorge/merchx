# README

MerchX - Api

MerchX is a platform to aid small bands in streamlining their merch sales at small venues. By allowing customers to pay for items through a web application with their saved card details, bands are able to cash in on opportunity sales they may not have gotten with a cash only merch stand.

## Setup

```
Run the following commands in the project directory:

$ bundle
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rails s

Open on http://localhost:3000
```

## Additional Project Gems

gem 'bcrypt', '~> 3.1.7'
gem 'active_model_serializers'
gem 'rack-cors'
gem 'faker', '~> 1.8.7'
gem 'rack-attack'
gem 'jwt'
gem 'rspec-rails'
gem 'hirb'
gem 'awesome_print'
gem 'factory_bot_rails'

# Project Structure
## Database Relationships
### Users

### Products

### Stock

### Orders

### Customers

## Controllers
### 1. Users
#### CRUD
