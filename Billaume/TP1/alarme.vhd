--Entite add
library IEEE;
use IEEE.std_logic_1164.all;

--definition de l'entite
entity alarme is
	port(
		V : in std_logic;
		P : in std_logic;
		F : in std_logic;
		S : out std_logic
	);
end entity;

--definition de l'architecture
architecture flot of alarme is
begin
	S <= V and (P or F);
	
end architecture;
