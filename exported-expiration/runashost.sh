#!/bin/sh

if [ "$#" -ne 2 ] ; then
  echo "Usage: $0 <hostname> <ip>"
  echo "This lets you fake a puppet run as the given host with the ip set as ipaddress_eth0"
  exit 1
fi

set -x

# I set FACTER_fqdn and FACTER_ipaddress_eth0 so we can easily pretend to be another
# host. This allows us to show this demo without requiring a run on different hosts.
export FACTER_fqdn=$1
export FACTER_ipaddress_eth0=$2

# We could use mysql...
#dbflags="--dbadapter mysql --dbuser puppet --dbpassword puppet --dbserver snack.home"

# But for this example let's stay local and use sqlite.
# You'll need the 'sqlite3-ruby' and 'activerecord' gem installed
# for exported resources to sqlite db to work.
dbflags="--dbadapter sqlite3 --dblocation storeconfigs.sqlite"

# Also set --certname here so we are really able to masquerade as another host
# Setting 'node_name' to fqdn makes puppet pull the identifier used for the
# node name (for exported resources, etc) from the fqdn fact.
# In practice, you don't need to se these flags (--certname, --node_name, and
# the FACTER_* overrides), but I need them for the purposes of this demo.

puppet --certname $FACTER_fqdn --node_name fqdn --verbose \
       $dbflags --storeconfigs --modulepath modules manifests/site.pp
