-- Exemple d'une entite de test simple pour une porte logique xor
-- L. Andrade - Polytech Grenoble
library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.exercice1;

-- definition de l'entite de test
entity bench_exercice1 is
end entity;

-- definition de l'architecture de test
architecture test of bench_exercice1 is

	component exercice1
	port (
	    ctl : in  std_logic;
	    A,B : in  integer;
	    C,D : out integer
	);
	end component;

	-- definition de signaux de test	
	signal A_S : bit;
	signal B_S : bit;
	signal C_S : bit;
	signal D_S : bit;
	signal ctl_S : bit;

begin

	-- design under test (dut)
    dut : exercice1
    port map (
        A => A_S,
        B => B_S,
        C => C_S,
        D => D_S,
        ctl => ctl_S
    );

    -- Generation des stimulis
    A_S   <= not B_S   after 20 ns;
    ctl_S   <= not A_S   after 30 ns;
    B_S   <= not A_S   after 40 ns;
    A_S   <= not B_S   after 20 ns;

end architecture;
