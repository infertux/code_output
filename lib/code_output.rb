require "code_output/version"
require "stringio"

module CodeOutput

  class Parser

    def initialize filename
      @filename = File.expand_path(filename)
      raise IOError, "`#{filename}' is not readable" unless File.readable? filename

      @old_stdout = $stdout

      $stdout = StringIO.new
      $stdout.instance_eval do
        class << self
          attr_accessor :outputs

          alias_method :old_write, :write

          def write string
            (@outputs ||= []) << { line: caller.first, string: string }

            old_write string
          end
        end
      end
    end

    def capture_output
      load @filename

      $stdout.close_write
      @output_stream = $stdout
      @output_stream.rewind

      $stdout = @old_stdout
    end
    alias_method :run, :capture_output

    def dump filename
      File.open(filename, 'w') do |file|
        file.write file_with_output
      end
    end

    def raw_output
      @output_stream.string
    end

    def file_with_output
      inject_output unless @file_with_output
      @file_with_output.join
    end

  private
    def inject_output
      @file_with_output = IO.readlines(@filename)

      @output_stream.outputs.each do |output|
        next if output[:string] == "\n"

        match = output[:line].match(/\A#{@filename}:(?<line_no>\d+):/)
        line_no = match[:line_no].to_i - 1
        @file_with_output[line_no].rstrip!
        @file_with_output[line_no] << " \#=> #{output[:string]}\n"
      end
    end
  end
end

