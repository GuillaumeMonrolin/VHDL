
library IEEE;
use     IEEE.std_logic_1164.all;

-- definition de l'entite
entity aig is
	port(
		ctl : in std_logic;
		A : in integer;
		B : in integer;
		C : out integer;
		D : out integer
	);
end entity;
-- definition de l'architecture
architecture flot of aig is
begin
	C <= A when ctl = '0' else B;
	D <= B when ctl = '0' else A;
end flot;

