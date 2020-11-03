TOP=bench_ou_ex_suite
WAVE=$(TOP)_wave.ghw

all: analyze elaborate

analyze:
	#
	# etape d'analyse des entites/architectures
	#
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../ou_ex.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../ou_ex_suite.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit $(TOP).vhd

elaborate:
	#
	# etape d'elaboration
	#
	ghdl -e --work=TP_LIB --ieee=synopsys -fexplicit $(TOP) # elabore le modele

run:
	#
	# attention a definir le temps de simulation qu'il vous faut
	#
	ghdl -r --work=TP_LIB --ieee=synopsys -fexplicit $(TOP) --wave=$(WAVE) --stop-time=200ns

view:
	gtkwave $(WAVE)

clean:
	rm -f $(WAVE) $(TOP)
	rm -f *.cf *.o *.ghw
