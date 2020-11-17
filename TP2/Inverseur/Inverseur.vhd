library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;


entity Inverseur is
	generic   N = 4 ;
 	port (
 		X : in std_logic_vector (N downto 0);
 		InverseX : out std_logic_vector (N downto 0);
end entity;

component Inv1
	port(
		e : in std_logic;
 		s : out std_logic;
end component;

architecture InvN of Inverseur is

begin

	InverseX <= not X;
--
G: for I in 0 to N-1 generate
 inst: FA port map(A(I), B(I), C(I), sum(I), C(I+1));
end generate G;
--
end arc;




