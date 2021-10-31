onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Memory_in -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Memory_in xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {Memory_in.udo}

run -all

endsim

quit -force
