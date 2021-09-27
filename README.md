# Eloqua::Api

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/eloqua/api/base`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eloqua-api-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eloqua-api-client

## Usage

```ruby
# To setup the client for ExternalAssetTypes
client = ::Eloqua::EloquaExternalAssetsTypes.new(
        access_token: 'YOUR-ACCESS-TOKEN', # e.g. djbhyghb27t36hbdhbkjn7y7bhk
        base_url: 'YOUR-BASE-URL') # e.g. 'https://eloqua-api.com/API/REST/{version}'

# Getting all ExternalAssetTypes
client.find_all
# Finding based on some condition like fetching campaigns having active status or 
# based on name or paginated campaigns you can use optional params 

find_all method accepts two optional params
    1- query_params # mostly for pagination
    2- search_params # for fetching ExternalAssetType objects based on some conditions
    
# Example below fetchs all the ASSET TYPES by paginating them
    client.find_all(query_params: { page: 1, count: 100 })

# similarly search_params: {} will search for the specific keys added in the hash

# If we want to fetch the Specific ASSET ACTIVITIES simply hit
    client.find(id: 'my asset_type_id')

# To setup the client for Campaigns

client = ::Eloqua::Campaign.new(
        access_token: 'YOUR-ACCESS-TOKEN', # e.g. djbhyghb27t36hbdhbkjn7y7bhk
        base_url: 'YOUR-BASE-URL') # e.g. 'https://eloqua-api.com/API/REST/{version}'
        
# Same here to get all the campaigns 
    
    client.find_all

# find_all method accepts two optional params
    1- query_params # mostly for pagination
    
    2- search_params # for fetching campaigns based on some conditions

# If Campaigns based on some condtions are needed to be fetched 
    
# Lets Say we want to get all active campaigns
    
    client.find_all(search_params: { currentStatus: 1 })
    # It will get all the campaigns which are active similarly you can add other 
    # query key values based on searchable from eloqua documentation
    
    # https://docs.oracle.com/en/cloud/saas/marketing/eloqua-develop/Developers/RESTAPI/Tutorials/search_parameter.htm?cshid=SearchParam
    
    # If we want to fetch all those campaigns which are active and name like 'some-name'
    client.find_all(search_params: { currentStatus: 1, name: 'some-name' })
    
    # Every time we pass search_params it will do a partials searching

# To Fetch Only a Specific Campaign 

    client.find(id: 'campaign_id')
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/osama-inayat/eloqua-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Eloqua::Api::Wrapper project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/osama-inayat/eloqua-api/blob/master/CODE_OF_CONDUCT.md).
