TOP=bench_add
WAVE=$(TOP)_wave.vcd

all: analyze elaborate

analyze:
	#
	# etape d'analyse des entites/architectures
	#
	ghdl -a --work=TP_LIB ../add.vhd
	ghdl -a --work=TP_LIB $(TOP).vhd #analyse le banc de test

elaborate:
	#
	#etape d'elaboration
	#
	ghdl -e --work=TP_LIB $(TOP) #elaborate le  modele

run:
	#
	#attention a definir le temps de simulation qu'il vous faut
	#
	ghdl -r --work=TP_LIB $(TOP) --vcd=$(WAVE) --stop-time=100ns

view:
	gtkwave $(WAVE)

clean:
	rm -f $(WAVE) $(TOP)
	rm -f *.cf *.0
