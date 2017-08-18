require "./FromPullParser/*"

module FromPullParser

  macro initialize_from_parser(_parser, *_args, **_nargs)
    def self.from_json(io_or_string, *args, **nargs)
      parser = {{_parser}}::PullParser.new io_or_string
      if args.empty?
        if nargs.empty?
          new parser
        else
          new parser, **nargs
        end
      else
        if nargs.empty?
          new parser, *args
        else
          new parser, *args, **nargs
        end
      end
    end

    def initialize(jpp : {{_parser}}::PullParser, {{*_args}})
      super(jpp)
      {{yield}}
    end
  end

end
