define hadoop::disk($basedir="/srv/hadoop", $dir=undef) {
  include hadoop::basedir

  # the namevar for this should be the device name, like /dev/sdb1, or somesuch

  if ($dir == undef) {
    # default dir is the name of the device (sdb1 for /dev/sdb1)
    $real_dir = inline_template("<%= File.join(basedir, File.basename(title)) %>")
    notice("default: $real_dir")
  } else {
    $real_dir = "$basedir/$dir"
    notice("got: $real_dir")
  }


  # You don't really need to control the mounts from here, but you can if you want.
  #mount { 
    #"$path":
      #atboot => true,
      #device => $title,
      #ensure => "mounted",
      #options => "noatime",
      #require => File[$path];
  #}

  file {
    "$real_dir":
      ensure => directory,
      owner => "hadoop",
      require => Class["hadoop::basedir"];
    "$real_dir/mapred":
      #require => Mount["$path"],
      owner => "hadoop",
      ensure => directory;
    "$real_dir/hdfs":
      #require => Mount["$path"],
      owner => "hadoop",
      ensure => directory;

    # Put other paths here...
    #"$real_dir/mapred/tmp":
    #  ensure => directory,
    #  owner => "hadoop",
    #  require => Mount["$path"];
  }
}
