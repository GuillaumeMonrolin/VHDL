--Entite add
library IEEE;
use IEEE.std_logic_1164.all;

--definition de l'entite
entity inverseur is
	generic(
		N : natural
	);

	port(
		X : in std_logic_vector(N-1 downto 0);
		S : out std_logic_vector(N-1 downto 0)

	);
end entity;

--definition de l'architecture
architecture flot of inverseur is
begin
	inverse_inst : for i in N-1 downto 0 generate
		S(i) <= not X(i);
	end generate;
		
end architecture;
