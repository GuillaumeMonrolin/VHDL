-- Exemple de definition d'une entite de test pour l'entite structurale
-- L.Andrade - Polytech Grenoble

library IEEE;
use     IEEE.std_logic_1164.all;

-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.ou_ex_suite;

-- definition de l'entite de test
entity bench_ou_ex_suite is 
end entity;

-- definition de l'architecture de test
architecture test of bench_ou_ex_suite is

	component ou_ex_suite
	port (
		X : in  bit;
	    Y : in  bit;
		Z : in  bit;
	    R : out bit
	);
	end component;

	-- definition de signaux de test
	signal X_S : bit;
	signal Y_S : bit;
	signal Z_S : bit;
	signal R_S : bit;

begin

	-- design under test (dut)
	dut : ou_ex_suite
	port map (
		X => X_S,
	    Y => Y_S,
		Z => Z_S,
	    R => R_S
	);

	-- Generation des stimulis
	X_S <= not X_S after 80 ns;
	Y_S <= not Y_S after 40 ns;
	Z_S <= not Z_S after 20 ns;

end architecture;
