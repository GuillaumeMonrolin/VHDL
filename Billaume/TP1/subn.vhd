--Entite add
library IEEE;
use IEEE.std_logic_1164.all;

--definition de l'entite
entity subn is
	generic(
		N : natural
	);

	port(
		A : in std_logic_vector(N-1 downto 0);
		B : in std_logic_vector(N-1 downto 0);
		S : out std_logic_vector(N-1 downto 0);
		R : out std_logic
	);
end entity;

--definition de l'architecture
architecture flot of subn is

signal carry : std_logic_vector(N downto 0);
component sub is
	port(
		A : in std_logic;
		B : in std_logic;
		Cin : in std_logic;
		S : out std_logic;
		Cout : out std_logic
	);
end component;

begin
	carry(0) <= '0';
	subn_inst : for i in N-1 downto 0 generate
	sub_inst : sub
		port map(A=>A(i),
		B=> B(i),
		Cin => carry(i), 
		S => S(i),
		Cout => Carry(i+1));
	end generate;
	R <= carry(N);
	
end architecture;
