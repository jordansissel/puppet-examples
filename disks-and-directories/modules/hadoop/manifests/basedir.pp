class hadoop::basedir($path="/srv/hadoop") {
  notice("basedir: $path")
  file {
    "$path":
      owner => "hadoop",
      ensure => directory;
  }
}
