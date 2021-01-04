
library IEEE;
use     IEEE.std_logic_1164.all;

-- definition de l'entite
entity res_aig is
	port(
		ctl : in std_logic_vector(4 downto 0);
		A : in integer;
		B : in integer;
		C : in integer;
		D : in integer;
		E : out integer;
		F : out integer;
		G : out integer;
		H : out integer
	);
end entity;

-- definition de l'architecture
architecture flot of res_aig is

component aig is
	port(
		ctl : in std_logic;
		A : in integer;
		B : in integer;
		C : out integer;
		D : out integer
	);
end component;

signal s1, s2, s3, s4, s5, s6 : integer;

begin
	aig1 : aig
		port map(
		ctl => ctl(0),
		A => A,
		B => B, 
		C => s1, 
		D => s2
		);
		
	aig2 : aig
		port map(
		ctl => ctl(1),
		A => C,
		B => D,
		C => s3, 
		D => s4
		);
		
	aig3 : aig
		port map(
		ctl => ctl(2),
		A => s1,
		B => s3,
		C => E, 
		D => s5
		);
		
	aig4 : aig
		port map(
		ctl => ctl(3),
		A => s2,
		B => s4,
		C => s6, 
		D => H
		);
		
	aig5 : aig
		port map(
		ctl => ctl(4),
		A => s5,
		B => s6,
		C => F, 
		D => G
		);
end architecture;

