# = Class: syslog_ng::logrotate
#
# Manage syslog-ng logroate config file
#
# == Parameters
#
# [*source*]
#   Sets the value of source parameter for the syslog-ng logrotate config file
#
# [*template*]
#   Sets the value of content parameter for the syslog-ng logrotate config file
#   Note: This option is alternative to the source one
#
# == Usage:
# class { 'syslog_ng::logrotate':
#   source => 'puppet:///modules/example42/syslog_ng/syslog-ng.logrotate'
# }
#
# class { 'syslog_ng::logrotate':
#   template => 'example42/syslog_ng/logrotate.erb'
# }
#
class syslog_ng::logrotate (
  $file     = $syslog_ng::logrotate_file,
  $source   = params_lookup( 'source' ),
  $template = params_lookup( 'template' ),
) {
  include syslog_ng

  $manage_file_source = $source ? {
    ''        => undef,
    default   => $source,
  }

  $manage_file_content = $template ? {
    ''        => undef,
    default   => template($template),
  }

  file { 'syslog_ng::logrotate':
    ensure  => present,
    path    => $syslog_ng::logrotate::file,
    mode    => $syslog_ng::config_file_mode,
    owner   => $syslog_ng::config_file_owner,
    group   => $syslog_ng::config_file_group,
    require => Package[$syslog_ng::package],
    source  => $manage_file_source,
    content => $manage_file_content,
    replace => $syslog_ng::manage_file_replace,
    audit   => $syslog_ng::manage_audit,
  }

}
