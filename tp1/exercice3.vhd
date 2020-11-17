-- Exercice2 - TP1
-- Guillaume Monrolin - Polytech Grenoble

library IEEE;
use     IEEE.std_logic_1164.all;

-- definition de l'entite
entity ADD is 
port (
    A,B,Cin : in  std_logic;
    S,Cout : out std_logic
);
end entity;

-- definition de l'architecture
architecture flot of ADD is
begin
	S <= A xor B xor Cin;
	Cout <= (A and B) or (A and Cin) or (B and Cin);
end architecture;
