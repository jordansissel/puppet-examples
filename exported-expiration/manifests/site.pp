node default {
  
  # We wrap 'example::expiringhost' with this custom define so we don't
  # have to think about timestamps.
  example::exported::expiringhost {
    $fqdn: ip => $ipaddress_eth0;
  }

  Example::Expiringhost <<| |>>
}
