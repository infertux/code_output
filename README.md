# CodeOutput [![Build Status](https://secure.travis-ci.org/infertux/code_output.png)](http://travis-ci.org/#!/infertux/code_output)

Inject a script output into the source file as comments.
This is particularly useful to generate code examples.

## Usage

### Command line

```bash
code_output example.rb
```

### Library

```ruby
# example.rb

class Example

  def initialize
    p __method__
  end

  p __method__

end

Example.new
```

```ruby
parser = CodeOutput::Parser.new "example.rb"
parser.run # executes the script

parser.raw_output #=> "nil\n:initialize\n"
parser.file_with_output #=> "# example.rb\n\nclass Example\n\n  def initialize\n    p __method__ #=> :initialize\n  end\n\n  p __method__ #=> nil\n\nend\n\nExample.new\n"

parser.dump 'example_with_output.rb' # writes file_with_output into the given file
```

## Installation

Add this line to your application's Gemfile:

    gem 'code_output'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install code_output

## License

MIT

