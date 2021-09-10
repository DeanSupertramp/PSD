onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ADDER_PROVA_opt

do {wave.do}

view wave
view structure
view signals

do {ADDER_PROVA.udo}

run -all

quit -force
