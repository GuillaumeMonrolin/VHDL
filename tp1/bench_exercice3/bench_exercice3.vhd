-- Exemple d'une entite de test simple pour une porte logique xor
-- L. Andrade - Polytech Grenoble
library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.ADD;

-- definition de l'entite de test
entity bench_exercice2 is
end entity;

-- definition de l'architecture de test
architecture test of bench_exercice2 is

component ADD
	port (
	    A, B, Cin : in  std_logic;
	    S, Cout : out std_logic
	);
end component;

	-- definition de signaux de test	
	signal A_S, B_S, Cin_S, S_S, Cout_S : std_logic := '0';

begin

	-- design under test (dut)
    dut : ADD
    port map (
        A   => A_S,
        B   => B_S,
        Cin   => Cin_S,
        S   => S_S,
        Cout   => Cout_S
    );

    -- Generation des stimulis
    A_S     <= not A_S  after 10 ns;
    B_S     <= '1'      after 15 ns;

end architecture;
