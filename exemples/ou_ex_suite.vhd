-- Exemple de definition d'une entite structural pour l'interconnexion 
-- de plusieurs portes ou_ex en cascade
-- L.Andrade - Polytech Grenoble

library IEEE;
use     IEEE.std_logic_1164.all;

-- definition de l'entite
entity ou_ex_suite is 
port (
	X : in  bit;
    Y : in  bit;
    Z : in  bit;
    R : out bit
);
end entity;

-- definition de l'architecture
architecture dataflow of ou_ex_suite is

component ou_ex is 
port (
    A : in  bit;
    B : in  bit;
    S : out bit
);
end component;

signal P1_to_P2 : bit;

begin

	-- instantiation de la 1ere porte xor
	P1 : ou_ex
	port map(
		A => X,
		B => Y,
		S => P1_to_P2		
	);

	-- instantiation de la 2eme porte xor
	P2 : ou_ex
	port map(
		A => P1_to_P2,
		B => Z,
		S => R
	);

end architecture;
