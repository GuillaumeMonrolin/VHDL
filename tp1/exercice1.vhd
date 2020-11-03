-- Exercice1 - TP1
-- Guillaume Monrolin - Polytech Grenoble

library IEEE;
use     IEEE.std_logic_1164.all;

-- definition de l'entite
entity exercice1 is 
port (
    ctl : in  std_logic;
    A,B : in  integer;
    C,D : out integer
);
end entity;

-- definition de l'architecture
architecture flot of exercice1 is
begin
	C <= A when ctl='0' else B;
	D <= B when ctl='0' else A;
end architecture;

library IEEE;
use     IEEE.std_logic_1164.all;

entity RES is
	port(ctl: in std_logic_vector(0 to 4);
		 A, B, C, D: in integer;
		 E, F, G, H: out integer
		 );
end entity;

architecture str of RES is
	signal s1, s2, s3, s4, s5, s6 : integer;
	component exercice1 is
		port(ctl: in std_logic;
			 A, B : in integer;
			 C, D : out integer
			 );
 	end component;
begin
	AIG1 : exercice1 port map(ctl(0), A, B, s1, s2);
	AIG2 : exercice1 port map(ctl(1), C, D, s3, s4);
	AIG3 : exercice1 port map(ctl(2), s1, s3, E, s5);
	AIG4 : exercice1 port map(ctl(3), s2, s4, s6, H);
	AIG5 : exercice1 port map(ctl(4), s5, s6, F, G);
end architecture;