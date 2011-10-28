# Example puppet function that returns a hash.

module Puppet::Parser::Functions
  newfunction(:helloworld, :type => :rvalue) do |args|
    return lookupvar("fizzle")
  end # puppet function helloworld
end # module Puppet::Parser::Functions

