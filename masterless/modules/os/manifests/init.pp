class os {
  file {
    "/etc/motd":
      ensure => file,
      source => "puppet:///$module/motd";
  }
}
