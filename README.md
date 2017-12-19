# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

```
ruby -v
ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-darwin17]
rails -v
Rails 5.1.4
```
* System dependencies

* Configuration

```
git clone
cd depot
bundle
rails s

http://localhost:3000
```

* Database creation

* Database initialization

```
rake db:migrate
rails runner script/load_orders.rb
http://localhost:3000/orders
```

* How to run the test suite

```
rake test:controllers
rake test:models
rake test
```
* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
