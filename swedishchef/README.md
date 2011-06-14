# Puppet + Chef == Bork! Bork! Bork!

This puppet module adds a custom provider for the 'package' type that uses chef.

Why not? Let's cook.

It would be pretty trivial to use any of the other chef stuff as a puppet
provider. With enough cleverness, you could likely run entire chef cookbooks
from puppet with whatever 'chef_cookbook' type/provider you want to write.

How'd I do this?

First, the puppet docs on writing custom providers is a mixed bag of good and
meh. I used the existing puppet code, masterzen's [network-device
provider](https://github.com/masterzen/puppet/tree/feature%2Fnetwork-device/lib/puppet/provider)
code, and some of the puppet 'custome type and provider' docs.

Second, for calling chef from Ruby, I used this gist by adamhjk as a starting point: <https://gist.github.com/654054>

## Where's the code hiding?

It's in this git repo.

I implement a custom provider (called "chef") for the existing "package"
resource type.

The code is in a module, like this:

    modules/swedishchef/plugins/puppet/provider/package/chef.rb

## swedishchef in action.

### Install nagios3

    % sudo puppet apply --modulepath ./modules -e '
      package { 
        "nagios3":
          provider => "chef",
          ensure => present;
      }'

    notice: Puppet::Type::Package::ProviderChef: Initializing chef...
    [Sat, 28 May 2011 00:47:39 -0700] INFO: Installing package[nagios3] version 3.2.0-4ubuntu2
    notice: /Stage[main]//Package[nagios3]/ensure: created

    % dpkg-query --show nagios3
    nagios3 3.2.0-4ubuntu2

### Uninstall nagios3

    % sudo puppet apply --modulepath modules -e 'package { "nagios3": provider => "chef", ensure => absent; }'
    notice: Puppet::Type::Package::ProviderChef: Initializing chef...
    [Sat, 28 May 2011 01:03:48 -0700] INFO: Removing package[nagios3]
    notice: /Stage[main]//Package[nagios3]/ensure: removed

### Try to install an invalid version

Chef will toss an exception if you try to install a package for a version that
doesn't exist.

    % sudo puppet apply --modulepath modules -e 'package { "nagios3": provider => "chef", ensure => "42"; }'  
    notice: Puppet::Type::Package::ProviderChef: Initializing chef...
    [Sat, 28 May 2011 01:04:29 -0700] INFO: Installing package[nagios3] version 42
    err: /Stage[main]//Package[nagios3]/ensure: change from purged to 42 failed: Could not update: apt-get -q -y install nagios3=42 returned 100, expected 0 at line 1

### Install a proper version

    % apt-cache policy nagios3 | grep Candidate
      Candidate: 3.2.0-4ubuntu2
    % sudo puppet apply --modulepath modules -e 'package { "nagios3": provider => "chef", ensure => "3.2.0-4ubuntu2"; }'
    notice: Puppet::Type::Package::ProviderChef: Initializing chef...
    [Sat, 28 May 2011 01:05:58 -0700] INFO: Installing package[nagios3] version 3.2.0-4ubuntu2
    notice: /Stage[main]//Package[nagios3]/ensure: ensure changed 'purged' to '3.2.0-4ubuntu2'


