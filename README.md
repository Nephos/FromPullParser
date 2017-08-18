# FromPullParser

TODO: Write a description here

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  FromPullParser:
    github: Nephos/FromPullParser
```

## Usage

```crystal
require "FromPullParser"
require "json"

class Foo
  JSON.mapping(a: Int32)
end

class Bar < Foo
  getter b : Int32?
  FromPullParser.initialize_from_parser(JSON, b = nil) do
    @b = b
  end
end

bar = Bar.from_json("{\"a\": 1}", 2)
```

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/Nephos/FromPullParser/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Nephos](https://github.com/Nephos) Arthur Poulet - creator, maintainer
