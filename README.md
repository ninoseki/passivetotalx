# passivetotalx

[![Gem Version](https://badge.fury.io/rb/passivetotalx.svg)](https://badge.fury.io/rb/passivetotalx)
[![Build Status](https://travis-ci.com/ninoseki/passivetotalx.svg?branch=master)](https://travis-ci.com/ninoseki/passivetotalx)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/passivetotalx/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/passivetotalx?branch=master)
[![CodeFactor](https://www.codefactor.io/repository/github/ninoseki/passivetotalx/badge)](https://www.codefactor.io/repository/github/ninoseki/passivetotalx)

Yet another [PassiveTotal](https://community.riskiq.com/) API wrapper for Ruby.

## Why I created this

There is an official PassiveTotal API wrapper for Ruby.

- [chrislee35/passivetotal](https://github.com/chrislee35/passivetotal)

But I don't like that in several reasons.

- A lack of proxy support.
- Not well structured (IMHO).
- Not tested with Ruby >= 2.6.

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
