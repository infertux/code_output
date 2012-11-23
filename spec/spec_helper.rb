require 'simplecov'
SimpleCov.start do
  minimum_coverage 100
  add_group "Sources", "lib"
  add_group "Tests", "spec"
end

require 'code_output'

