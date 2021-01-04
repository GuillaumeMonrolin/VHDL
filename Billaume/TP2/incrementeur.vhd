--Entite add
library IEEE;
use IEEE.std_logic_1164.all;

--definition de l'entite
entity incrementeur is
	generic(
		N : natural
	);

	port(
		X : in std_logic_vector(N-1 downto 0);
		S : out std_logic_vector(N-1 downto 0);
		R : out std_logic
	);
end entity;

--definition de l'architecture
architecture flot of incrementeur is

component add is
	port(
		A : in std_logic;
		B : in std_logic;
		Cin : in std_logic;
		S : out std_logic;
		Cout : out std_logic
	);
end component;

signal carry : std_logic_vector(N downto 0);
signal incr_c : std_logic_vector(N downto 0);
begin
	incr_c(0) <= '1';
	carry(0) <= '0';
	incrementeur_inst : for i in N-1 downto 0 generate

	add_inst : add
		port map(A=>X(i),
		B=> incr_c(i),
		Cin => carry(i), 
		S => S(i),
		Cout => Carry(i+1));
	incr_c(i+1) <= '0';
	end generate;
	R <= carry(N);
	
end architecture;
