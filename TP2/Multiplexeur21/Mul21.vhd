library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;


entity Mul21 is
	generic(
		N : natural := 4
	);
	port(
		D0 : in std_logic_vector (N downto 0);
		D1: in std_logic_vector (N downto 0);
		Sel : in std_logic;
		S : out std_logic_vector (N downto 0)
	);
end entity;

architecture multiplexeur of Mul21 is
begin
	S <= D0 when (Sel = '0') else D1;
	
end multiplexeur;




