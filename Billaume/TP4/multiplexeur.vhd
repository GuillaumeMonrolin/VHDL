--Entite add
library IEEE;
use IEEE.std_logic_1164.all;

--definition de l'entite
entity multiplexeur is
	generic(
		N : natural
	);
	port(
		D0 : in std_logic_vector(N-1 downto 0);
		D1 : in std_logic_vector(N-1 downto 0);
		sel : in std_logic;
		S : out std_logic_vector(N-1 downto 0)

	);
end entity;

--definition de l'architecture
architecture flot of multiplexeur is
begin
	S <= D0 when sel = '0' else D1;
end architecture;
