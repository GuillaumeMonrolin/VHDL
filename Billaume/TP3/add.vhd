--Entite add
library IEEE;
use IEEE.std_logic_1164.all;

--definition de l'entite
entity add is
	port(
		A : in std_logic;
		B : in std_logic;
		Cin : in std_logic;
		S : out std_logic;
		Cout : out std_logic
	);
end entity;

--definition de l'architecture
architecture flot of add is
begin
	S <= A xor B xor Cin;
	Cout <= (A and B) or (A and Cin) or (B and Cin);
end architecture;
