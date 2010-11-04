require "rubygems"
require "puppet"

$host = ARGV.shift
name = ARGV.shift
action = ARGV.shift

# Monkeypatch so our executed commands get sent over ssh.
module Puppet::Util
  alias original_execute execute

  def execute(command, *args)
    # Shell escapings
    newcommand = command.collect { |arg| arg.to_s.gsub(/["$\\]/) { "\\#{$&}" } } \
                        .collect { |arg| "\"#{arg}\"" }

    # ssh to our host, run sudo.
    newcommand = ["ssh", $host, "sudo", *newcommand]
    original_execute(newcommand, *args)
  end
end
 
begin
  package = Puppet::Type.type(:package).new(:name => name)
  provider = package.provider
  # Should be 'install' or 'uninstall'
  provider.send action

  puts("#{package} #{action} status: #{provider.properties.inspect}")
rescue Exception => e
  puts("Could not #{action} package #{package}: #{e}")
end

