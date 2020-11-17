
library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;


entity IncrementateurS is
	generic(
		N : natural := 4
	);
	port(
		X : in std_logic_vector (N downto 0);
		C : in integer := 1;
		Xplus1 : out std_logic_vector (N downto 0) 
	);
end entity;

architecture increment of IncrementateurS is
begin
	Xplus1 <= std_logic_vector(to_unsigned(to_integer(unsigned( X )) + C, N+1));
	--Xplus1 <= X xor std_logic_vector(to_unsigned(C, X'length));
	
end increment;




