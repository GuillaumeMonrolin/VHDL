-- Exemple d'une entite de test simple pour une porte logique xor
-- L. Andrade - Polytech Grenoble
library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.exercice1;

-- definition de l'entite de test
entity bench_exercice1_res is
end entity;

-- definition de l'architecture de test
architecture test of bench_exercice1_res is

component RES
	port (
	    ctl : in  std_logic_vector(0 to 4);
	    A,B,C,D : in  integer;
	    E,F,G,H : out integer
	);
end component;

	-- definition de signaux de test	
	signal A_S : integer;
	signal B_S : integer;
	signal C_S : integer;
	signal D_S : integer;
	signal E_S : integer;
	signal F_S : integer;
	signal G_S : integer;
	signal H_S : integer;
	signal ctl_S : std_logic_vector(0 to 4) := "00110";

begin

	-- design under test (dut)
    dut : RES
    port map (
        A   => A_S,
        B   => B_S,
        C   => C_S,
        D   => D_S,
        E   => E_S,
        F   => F_S,
        G   => G_S,
        H   => H_S,
        ctl => ctl_S
    );

    -- Generation des stimulis
    ctl_S   <= not ctl_S   	after 10 ns;
    A_S     <= 0     		after 10 ns, 1 after 30 ns;
    B_S     <= 1     		after 10 ns;
    C_S     <= 1     		after 10 ns;
    D_S     <= 1     		after 10 ns;

end architecture;
