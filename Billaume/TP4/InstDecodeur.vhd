library IEEE;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use std.textio.all;

entity InstDecodeur is	
	port(
		X : in std_logic_vector(15 downto 0);
		ci : out std_logic;
		sm : out std_logic;
		opc  : out std_logic_vector(5 downto 0);
		dst : out std_logic_vector(2 downto 0);
		cn : out std_logic_vector(2 downto 0);
		W : out std_logic_vector(15 downto 0));
	
end entity;

architecture beh of InstDecodeur is

begin
	update: process(X)
	begin 
		if(X(15) = '1') then
			W <= X;
		else
			ci <= X(15);
			sm <= X(12);
			opc <= X(11 downto 6);
			dst <= X(5 downto 3);
			cn <= X(2 downto 0);
		end if;
	end process;
end beh;
			 	
