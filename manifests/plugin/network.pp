class collectd::plugin::network (
  $client     = true,
  $serverhost = '127.0.0.1',
  $serverport = '25826',
  $listenhost = '0.0.0.0',
  $listenport = '25826'
) {
  include collectd::params

  $conf_dir = $collectd::params::plugin_conf_dir

  file { 'network.conf':
    ensure    => $collectd::plugin::network::ensure,
    path      => "${conf_dir}/network.conf",
    mode      => '0644',
    owner     => 'root',
    group     => 'root',
    content   => template('collectd/network.conf.erb'),
    notify    => Service['collectd'],
  }
}