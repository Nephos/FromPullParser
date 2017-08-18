require "./spec_helper"

require "json"

class Foo
  JSON.mapping(a: Int32)
end

class Bar < Foo
  getter b : Int32?
  FromPullParser.extend_parser(JSON, b = nil) do
    @b = b
  end
end

describe FromPullParser do
  it "foo bar" do
    foo = Foo.from_json("{\"a\": 1}")
    foo.a.should eq 1

    bar = Bar.from_json("{\"a\": 1}", 2)
    bar.a.should eq 1
    bar.b.should eq 2

    bar = Bar.from_json("{\"a\": 1}")
    bar.a.should eq 1
    bar.b.should eq nil
  end
end
