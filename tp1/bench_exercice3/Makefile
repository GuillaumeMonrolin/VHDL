TOP=bench_exercice2
WAVE=$(TOP)_wave.ghw

all: analyze elaborate

analyze:
	#
	# etape d'analyse des entites/architectures
	#
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../exercice2.vhd
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
	ghdl -r --work=TP_LIB --ieee=synopsys -fexplicit $(TOP) --wave=$(WAVE) --stop-time=50ns

view:
	gtkwave $(WAVE)

clean:
	rm -f $(WAVE) $(TOP)
	rm -f *.cf *.o *.ghw
