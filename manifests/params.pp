# Class: syslog_ng::params
#
# This class defines default parameters used by the main module class syslog_ng
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to syslog_ng class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class syslog_ng::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'syslog-ng',
  }

  $service = $::operatingsystem ? {
    default => 'syslog-ng',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'syslog-ng',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'root',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/syslog-ng',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/syslog-ng/syslog-ng.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/syslog-ng',
    default                   => '/etc/sysconfig/syslog-ng',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/syslog-ng.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/syslog-ng',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log',
  }

  $log_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/syslog',
    default                   => '/var/log/messages',
  }

  $logrotate_file = $::operatingsystem ? {
    default => '/etc/logrotate.d/syslog-ng',
  }

  $logrotate_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $logrotate_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $logrotate_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $port = '512'
  $protocol = 'udp'

  # General Settings
  $my_class = ''
  $source = ''
  $logrotate_source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
