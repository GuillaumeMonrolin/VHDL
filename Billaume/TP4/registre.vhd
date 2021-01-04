--Entite add
library IEEE;
use IEEE.std_logic_1164.all;

--definition de l'entite
entity registre is
	generic(
		N : natural
	);

	port(
		D : in std_logic_vector(N-1 downto 0);
		clk : in std_logic;
		load : in std_logic;
		nrst : in std_logic;
		Q : out std_logic_vector(N-1 downto 0)

	);
end entity;

--definition de l'architecture
architecture flot of registre is
begin
	update: process(clk,nrst)
	begin
		if(nrst = '0') then
			Q <= (others =>'0');
		elsif(clk'event and  clk = '1' and load = '1') then
			Q<=D;
		end if;
	end process;
		
end architecture;
