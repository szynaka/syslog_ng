# = Class: syslog_ng
#
# This is the main syslog_ng class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, syslog_ng class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $syslog_ng_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, syslog_ng main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $syslog_ng_source
#
# [*source_dir*]
#   If defined, the whole syslog_ng configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $syslog_ng_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $syslog_ng_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, syslog_ng main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $syslog_ng_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $syslog_ng_options
#
# [*service_autorestart*]
#   Automatically restarts the syslog_ng service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $syslog_ng_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $syslog_ng_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $syslog_ng_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $syslog_ng_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for syslog_ng checks
#   Can be defined also by the (top scope) variables $syslog_ng_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $syslog_ng_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $syslog_ng_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $syslog_ng_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $syslog_ng_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for syslog_ng port(s)
#   Can be defined also by the (top scope) variables $syslog_ng_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling syslog_ng. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $syslog_ng_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $syslog_ng_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $syslog_ng_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $syslog_ng_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in syslog_ng::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of syslog_ng package
#
# [*service*]
#   The name of syslog_ng service
#
# [*service_status*]
#   If the syslog_ng service init script supports status argument
#
# [*process*]
#   The name of syslog_ng process
#
# [*process_args*]
#   The name of syslog_ng arguments. Used by puppi and monitor.
#   Used only in case the syslog_ng process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user syslog_ng runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $syslog_ng_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $syslog_ng_protocol
#
#
# See README for usage patterns.
#
class syslog_ng (
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits syslog_ng::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)
  $bool_noops=any2bool($noops)

  ### Definition of some variables used in the module
  $manage_package = $syslog_ng::bool_absent ? {
    true  => 'absent',
    false => $syslog_ng::version,
  }

  $manage_service_enable = $syslog_ng::bool_disableboot ? {
    true    => false,
    default => $syslog_ng::bool_disable ? {
      true    => false,
      default => $syslog_ng::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $syslog_ng::bool_disable ? {
    true    => 'stopped',
    default =>  $syslog_ng::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $syslog_ng::bool_service_autorestart ? {
    true    => Service[syslog_ng],
    false   => undef,
  }

  $manage_file = $syslog_ng::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $syslog_ng::bool_absent == true
  or $syslog_ng::bool_disable == true
  or $syslog_ng::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $syslog_ng::bool_absent == true
  or $syslog_ng::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $syslog_ng::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $syslog_ng::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $syslog_ng::source ? {
    ''        => undef,
    default   => $syslog_ng::source,
  }

  $manage_file_content = $syslog_ng::template ? {
    ''        => undef,
    default   => template($syslog_ng::template),
  }

  ### Managed resources
  package { $syslog_ng::package:
    ensure  => $syslog_ng::manage_package,
    noop    => $syslog_ng::bool_noops,
  }

  service { 'syslog_ng':
    ensure     => $syslog_ng::manage_service_ensure,
    name       => $syslog_ng::service,
    enable     => $syslog_ng::manage_service_enable,
    hasstatus  => $syslog_ng::service_status,
    pattern    => $syslog_ng::process,
    require    => Package[$syslog_ng::package],
    noop       => $syslog_ng::bool_noops,
  }

  file { 'syslog_ng.conf':
    ensure  => $syslog_ng::manage_file,
    path    => $syslog_ng::config_file,
    mode    => $syslog_ng::config_file_mode,
    owner   => $syslog_ng::config_file_owner,
    group   => $syslog_ng::config_file_group,
    require => Package[$syslog_ng::package],
    notify  => $syslog_ng::manage_service_autorestart,
    source  => $syslog_ng::manage_file_source,
    content => $syslog_ng::manage_file_content,
    replace => $syslog_ng::manage_file_replace,
    audit   => $syslog_ng::manage_audit,
    noop    => $syslog_ng::bool_noops,
  }

  # The whole syslog_ng configuration directory can be recursively overriden
  if $syslog_ng::source_dir {
    file { 'syslog_ng.dir':
      ensure  => directory,
      path    => $syslog_ng::config_dir,
      require => Package[$syslog_ng::package],
      notify  => $syslog_ng::manage_service_autorestart,
      source  => $syslog_ng::source_dir,
      recurse => true,
      purge   => $syslog_ng::bool_source_dir_purge,
      force   => $syslog_ng::bool_source_dir_purge,
      replace => $syslog_ng::manage_file_replace,
      audit   => $syslog_ng::manage_audit,
      noop    => $syslog_ng::bool_noops,
    }
  }


  ### Include custom class if $my_class is set
  if $syslog_ng::my_class {
    include $syslog_ng::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $syslog_ng::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'syslog_ng':
      ensure    => $syslog_ng::manage_file,
      variables => $classvars,
      helper    => $syslog_ng::puppi_helper,
      noop      => $syslog_ng::bool_noops,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $syslog_ng::bool_monitor == true {
    if $syslog_ng::port != '' {
      monitor::port { "syslog_ng_${syslog_ng::protocol}_${syslog_ng::port}":
        protocol => $syslog_ng::protocol,
        port     => $syslog_ng::port,
        target   => $syslog_ng::monitor_target,
        tool     => $syslog_ng::monitor_tool,
        enable   => $syslog_ng::manage_monitor,
        noop     => $syslog_ng::bool_noops,
      }
    }
    if $syslog_ng::service != '' {
      monitor::process { 'syslog_ng_process':
        process  => $syslog_ng::process,
        service  => $syslog_ng::service,
        pidfile  => $syslog_ng::pid_file,
        user     => $syslog_ng::process_user,
        argument => $syslog_ng::process_args,
        tool     => $syslog_ng::monitor_tool,
        enable   => $syslog_ng::manage_monitor,
        noop     => $syslog_ng::bool_noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $syslog_ng::bool_firewall == true and $syslog_ng::port != '' {
    firewall { "syslog_ng_${syslog_ng::protocol}_${syslog_ng::port}":
      source      => $syslog_ng::firewall_src,
      destination => $syslog_ng::firewall_dst,
      protocol    => $syslog_ng::protocol,
      port        => $syslog_ng::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $syslog_ng::firewall_tool,
      enable      => $syslog_ng::manage_firewall,
      noop        => $syslog_ng::bool_noops,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $syslog_ng::bool_debug == true {
    file { 'debug_syslog_ng':
      ensure  => $syslog_ng::manage_file,
      path    => "${settings::vardir}/debug-syslog_ng",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $syslog_ng::bool_noops,
    }
  }

}
