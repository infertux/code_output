require 'spec_helper'
require 'tempfile'

def assets
  dump_files = File.expand_path("../assets/*.dump.rb", __FILE__)

  Dir[dump_files].each do |dump_file|
    asset = {
      dump_file: dump_file,
      source_file: dump_file.sub(/.dump(.rb)\Z/, '\1'),
      output_file: dump_file.sub(/.dump(.rb)\Z/, '.output\1')
    }

    yield asset, File.basename(asset[:source_file])
  end
end

describe CodeOutput do

  describe "#initialize" do
    it "raises IOError if the input file is not readable" do
      expect {
        CodeOutput::Parser.new '/etc/shadow'
      }.to raise_error IOError
    end
  end

  [
    [:file_with_output, :dump_file],
    [:raw_output,       :output_file]
  ].each do |method, file|

    describe "##{method}" do
      assets do |asset, filename|
        it "returns the expected output for #{filename}" do
          parser = CodeOutput::Parser.new asset[:source_file]
          parser.run

          got = parser.__send__ method
          expected = File.open(asset[file]).read

          got.should eq expected
        end
      end
    end

  end

  describe "#dump" do
    assets do |asset, filename|
      it "writes the expected contents for #{filename}" do
        parser = CodeOutput::Parser.new asset[:source_file]
        parser.run

        temp_file = Tempfile.new('tmp')

        begin
          parser.dump(temp_file.path)

          FileUtils.identical?(asset[:dump_file], temp_file).should be_true
        ensure
          temp_file.unlink
        end
      end
    end
  end

end
