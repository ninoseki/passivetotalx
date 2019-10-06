# passivetotal

[![Build Status](https://travis-ci.com/ninoseki/passivetotal.svg?branch=master)](https://travis-ci.com/ninoseki/passivetotal)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/passivetotal/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/passivetotal?branch=master)
[![CodeFactor](https://www.codefactor.io/repository/github/ninoseki/passivetotal/badge)](https://www.codefactor.io/repository/github/ninoseki/passivetotal)

Yet another [PassiveTotal] API wrapper for Ruby.

## Installation

```bash
gem install passivetotalx
```

## Usage

```ruby
require "passivetotal"

# when given nothing, it tries to load your usernamem & API key via ENV["PASSIVETOTAL_USERNAME"] and ENV["PASSIVETOTAL_API_KEY"]
api = PassiveTotal::API.new
# or you can set them manually
api = PassiveTotal::API.new(username: "USERNAME", api_key: "API_KEY")

query =  "passivetotal.org"

api.dns.passive(query)
api.dns.passive_unique(query)
api.dns.search(query)
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
