-- Exemple de definition d'une entite pour une porte xor
-- L.Andrade - Polytech Grenoble

library IEEE;
use     IEEE.std_logic_1164.all;

-- definition de l'entite
entity ou_ex is 
port (
    A : in  bit;
    B : in  bit;
    S : out bit
);
end entity;

-- definition de l'architecture
architecture dataflow of ou_ex is
begin
	S <= A xor B;
end architecture;
