# Masterless Example

Here's how to run this:

    puppet apply --modulepath ./modules manifests/site.pp

This is running puppet local (aka, masterless), with no puppet master.

File urls are relative to the local puppet, too.

Stuff like this;

    puppet:///modules/foo/bar.txt

Will be relative to --modulepath, in the above example, as:

    ./modules/foo/files/bar.txt

## Running it:

    % sudo puppet apply --modulepath ./modules manifests/site.pp
    notice: /Stage[main]/Os/File[/etc/motd]/ensure: defined content as '{md5}9f4ac4b9fdc3de446fe89b9374229950'

## Masterless Features

* storeconfigs still works; requires MySQL if you want nodes to actually share
  data (sqlite is local to each puppet node in masterless)
* files can come from the local puppet, too. You just need to ship them to
  /etc/puppet/modules or wherever your moduledir is.

I still use file resources just like I would with a master/agent configuration
in puppet. puppet:/// urls, as mentioned, still work as expected :)
