if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name MIN\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fast.lib]
create_library_set -name MAX\
   -timing\
    [list ${::IMEX::libVar}/mmmc/slow.lib]
create_rc_corner -name default_rc_corner\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0
create_delay_corner -name max_delay\
   -library_set MAX
create_delay_corner -name min_delay\
   -library_set MIN
create_constraint_mode -name top\
   -sdc_files\
    [list ${::IMEX::libVar}/mmmc/syn.sdc]
create_analysis_view -name Hold -constraint_mode top -delay_corner min_delay
create_analysis_view -name Setup -constraint_mode top -delay_corner max_delay
set_analysis_view -setup [list Setup] -hold [list Hold]
