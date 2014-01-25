# = Class: timezone
#
# This is the main timezone class
#
#== Requirements
# None
#
# == Parameters
#
# [*present*]
#   Set to 'false' to remove package
#
# [*timezone*]
#   Timezone to use
#
class timezone (
  # Parameters for Class
  $present = true,
  $timezone = 'UTC'
){
    include timezone::params
    include timezone::install
    include timezone::config
}
