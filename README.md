# Eloqua Api Client

Eloqua Api Client is a Context Based Ruby Gem for calling Eloqua APIs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eloqua-api-client'
```

And then execute:

```ruby
bundle 
```

Or install it yourself as:

``` ruby
gem install eloqua-api-client
```

## Usage

```ruby
# to work with Eloqua Campaigns Initialize Client
client = Eloqua::Api::Campaign.new(access_token: 'YOUR-TOKEN', base_url: 'YOUR_BASE_URL')
```
### Eloqua Campaigns Docs
To get an idea about ```params```

https://docs.oracle.com/en/cloud/saas/marketing/eloqua-rest-api/api-application-2.0-campaigns.html

```ruby
# To Fetch All Campaigns From Eloqua
client.find_all
# To Fetch All Campaigns Based On Pagination pass named param query_params to find_all
# I want to get campaigns such that each page has 100 campaigns on it 
# I will pass the page and the count in query param to achieve that
client.find_all(query_params: { page: 1, count: 100 })

# Similarly to fetch campaigns based on NAME, status etc
client.find_all(search_params: { name: 'My Gem', currentStatus: 1 })

# Both saerch_params and query_params are optional can be used together also

```
### Note
In the Gem All ```find_all``` accepts two optional ```HASH Params``` ```search_params: {}``` and ```query_params: {}```

### Find Campaign
```ruby
# returns Campaign against provided Id 
client.find(id: 'campaign_id')
# id is required param
```
### Create Campaign
```ruby
# returns created campaign 
client.create(payload: { name: 'my eloqua campaign', startAt: 1234444, endAt: 120987,...})
# parload is required param
```

### Update Campaign
```ruby
# returns updated campaign
client.update(id: 'id',payload: { name: 'new name', startAt: 1234444, endAt: 12098 })
# id and parload both are required params.
# please have a look at eloqua documentation for payload 
```

### Activate Campaign
```ruby
# returns activated campaign
client.activate(id: 'id', query_params: { activate: true })
# id and query_params both are required params. 
```

### DeActivate Campaign
```ruby
# returns deactivate campaign
client.deactivate(id: 'id')
# id is required param. 
```

### Delete A Campaign
```ruby
client.destroy(id: 'id')
# id is required param. 
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/osama-inayat/eloqua-api. This project is intended to be a safe, welcoming space for collaboration.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
