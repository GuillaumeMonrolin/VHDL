library IEEE;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use std.textio.all;

entity Condition is
	generic(
		N : natural
	);	
	port(
		Xin : in std_logic_vector(N-1 downto 0);
		lt : in std_logic;
		eq : in std_logic;
		gt : in std_logic;
		jmp : out std_logic);
	
end entity;

architecture beh of Condition is
signal isneg : std_logic;
signal iszero : std_logic;

begin
	iszero <= '1' when conv_integer(Xin) = 0 else '0';
	isneg <= '1' when Xin(N-1) = '1' else '0';
	jmp <= (not(iszero xor isneg) and gt) or (eq and iszero) or (lt and isneg);
	
end beh;
			 	
