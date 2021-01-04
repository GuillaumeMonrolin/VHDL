--Entite add
library IEEE;
use IEEE.std_logic_1164.all;

--definition de l'entite
entity multiplexeur is
	port(
		D0 : in integer;
		D1 : in integer;
		sel : in std_logic;
		S : out integer

	);
end entity;

--definition de l'architecture
architecture flot of multiplexeur is
begin
	S <= D0 when sel = '0' else D1;
end architecture;
