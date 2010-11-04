define example::exported::expiringhost($ip) {
  notice("Exporting host: $name => $ip")
  @@example::expiringhost {
    $name:
      ip => $ip,
      timestamp => inline_template("<%= Time.now.strftime('%Y-%m-%dT%H:%M:%S%z') %>");
  }
}
