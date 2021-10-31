onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Mem_out_opt

do {wave.do}

view wave
view structure
view signals

do {Mem_out.udo}

run -all

quit -force
