# GeoipRails

Gives geolocation details based on an IP address or a host name
The gem uses freegeoip's API to fetch geolocation data given an IP address. freegeoip.net is a public REST API for searching geolocation of IP addresses and host names. It has an internal database with geolocation information, which is queried via the API. There's no sorcery, it's just a database. And although the database is very accurate, don't expect it to be perfect. The API supports both HTTP and HTTPS. Supported formats are csv, xml or json
## Installation

Add this line to your application's Gemfile:

    gem 'geoip_rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geoip_rails

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
