# Manually manage /tmp/original
# Each puppet run observe the contents and, on change, notify the exec when it
# changes.
# 
# The idea here is you might need (in some case) to manually manage a file outside
# of puppet (in this case, "/tmp/original"). Using this example, you can make puppet
# signal other parts of your catalog based on changes to that file.
#
# This version of the unmanaged-notify example requires puppet >= 2.6.0 and the
# 'audit' feature:
# http://projects.puppetlabs.com/projects/1/wiki/Release_Notes#Audit+Metaparameter

file {
  # You manually manage this file, puppet will track the contents and notify
  # your exec on change.
  "/tmp/original":
    audit => content,
    notify => Exec["hello world"];
}

exec {
  "hello world":
    command => "/bin/echo hello world",
    refreshonly => true;
}

