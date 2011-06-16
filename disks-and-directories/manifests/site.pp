$basedir = "/tmp/hadoop-example"
class { "hadoop::basedir": path => $basedir }

hadoop::disk {
  [ "/dev/sdb1", "/dev/sdc1", "/dev/sdd1", "/dev/sde1" ]: 
    basedir => $basedir;
}
