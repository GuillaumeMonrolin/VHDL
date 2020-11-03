-- Exercice1 - TP1
-- Guillaume Monrolin - Polytech Grenoble

library IEEE;
use     IEEE.std_logic_1164.all;

-- definition de l'entite
entity exercice1 is 
port (
    ctl : in  std_logic;
    A,B : in  integer;
    C,D : out integer;
);
end entity;

-- definition de l'architecture
architecture flot of exercice1 is
begin
	C <= A when ctl=0 else B;
	B <= B when ctl=0 else A;
end architecture;