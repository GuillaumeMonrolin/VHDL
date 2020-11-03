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
	signal A_S : integer;
	signal B_S : integer;
	signal C_S : integer;
	signal D_S : integer;
	signal ctl_S : std_logic;

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
    ctl_S <= '0'   after 10 ns;
    A_S   <= 0   after 10 ns;
    B_S   <= 1 after 10 ns;
    ctl_S <= '1'   after 30 ns;
    B_S   <= 1   after 40 ns;

end architecture;
