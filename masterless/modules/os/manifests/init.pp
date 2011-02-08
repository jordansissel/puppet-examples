class os {
  file {
    "/etc/motd":
      ensure => file,
      source => "puppet:///modules/os/motd";
  }
}
