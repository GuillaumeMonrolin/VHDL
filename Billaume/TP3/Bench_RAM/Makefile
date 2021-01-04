TOP=bench_RAM
WAVE=$(TOP)_wave.vcd

all: analyze elaborate

analyze:
	#
	# etape d'analyse des entites/architectures
	#

	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../RAM.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit $(TOP).vhd

elaborate:
	#
	# etape d'elaboration
	#
	ghdl -e -fsynopsys --work=TP_LIB $(TOP) # elabore le modele

run:
	#
	# attention a definir le temps de simulation qu'il vous faut
	#
	ghdl -r -fsynopsys --work=TP_LIB $(TOP) --vcd=$(WAVE) --stop-time=100ns

view:
	gtkwave $(WAVE)

clean:
	rm -f $(WAVE) $(TOP)
	rm -f *.cf *.o
