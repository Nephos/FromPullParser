require "./FromPullParser/*"

module FromPullParser

  macro extend_parser(_parser, *_args)
    def self.from_json(io_or_string, *args)
      parser = {{_parser}}::PullParser.new io_or_string
      if args.empty?
        new parser
      else
        new parser, *args
      end
    end

    def initialize(jpp : {{_parser}}::PullParser, {{*_args}})
      super(jpp)
      {{yield}}
    end
  end

end
