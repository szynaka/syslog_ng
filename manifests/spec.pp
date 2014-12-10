# Class: syslog_ng::spec
#
# This class is used only for rpsec-puppet tests
# Can be taken as an example on how to do custom classes but should not
# be modified.
#
# == Usage
#
# This class is not intended to be used directly.
# Use it as reference
#
class syslog_ng::spec inherits syslog_ng {

  # This just a test to override the arguments of an existing resource
  # Note that you can achieve this same result with just:
  # class { "syslog_ng": template => "syslog_ng/spec.erb" }

  File['syslog_ng.conf'] {
    content => template('syslog_ng/spec.erb'),
  }

}
