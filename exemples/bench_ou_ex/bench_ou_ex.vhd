-- Exemple d'une entite de test simple pour une porte logique xor
-- L. Andrade - Polytech Grenoble
library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.ou_ex;

-- definition de l'entite de test
entity bench_ou_ex is
end entity;

-- definition de l'architecture de test
architecture test of bench_ou_ex is

	component ou_ex
	port (
	    A : in  bit;
	    B : in  bit;
	    S : out bit
	);
	end component;

	-- definition de signaux de test	
	signal A_S : bit;
	signal B_S : bit;
	signal S_S : bit;

begin

	-- design under test (dut)
    dut : ou_ex
    port map (
        A => A_S, 
        B => B_S,
        S => S_S
    );

    -- Generation des stimulis
    A_S   <= not A_S   after 40 ns;
    B_S   <= not B_S   after 20 ns;

end architecture;
