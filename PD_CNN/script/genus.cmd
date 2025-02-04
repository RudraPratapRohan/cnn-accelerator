# Cadence Genus(TM) Synthesis Solution, Version 21.10-p002_1, built Aug 20 2021 10:13:13

# Date: Tue Feb 04 22:53:28 2025
# Host: cadencea19 (x86_64 w/Linux 4.18.0-305.el8.x86_64) (16cores*24cpus*1physical cpu*12th Gen Intel(R) Core(TM) i9-12900K 30720KB)
# OS:   Red Hat Enterprise Linux release 8.10 (Ootpa)

read_lib ../lib/slow.lib
read_hdl ../src/CONV_ACC.v
elaborate
create_clock -name clk -period 2 [get_ports "clk"]
set_clock_transition -rise 0.01 [get_clocks "clk"]
set_clock_transition -fall 0.01 [get_clocks "clk"]
set_clock_uncertainty 0.05 [get_clocks "clk"]
set_input_delay -max 1.0 [get_ports "rst"] -clock [get_clocks "clk"]
syn_generic
write_hdl
syn_map
report_area
syn_opt
report_area
write_hdl > syn.v
write_sdc >syn.sdc
report_area
report_gates
report_gates -power
report_timing
gui_show
exit
