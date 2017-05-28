# ActiveRecordTorNode

* detect access from tor

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord_tor_node'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord_tor_node

## Usage
```
$ bundle exec rails g migration create_tor_node ip:string:index
```

```
TorNode.fetch_tor_nodes_ip!
TorNode.is_tor?('127.0.0.1')
```
