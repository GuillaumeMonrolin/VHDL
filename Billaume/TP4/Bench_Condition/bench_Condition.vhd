library ieee;
use ieee.std_logic_textio.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use std.textio.all;


-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.Condition;

entity bench_Condition is

end entity;

architecture str of bench_Condition is

	component Condition is
		generic(
			N : natural
		);
		port(
			Xin : in std_logic_vector(N-1 downto 0);
			lt : in std_logic;
			eq : in std_logic;
			gt : in std_logic;
			jmp : out std_logic);

	end component;
	
	constant N_c : natural := 5;
	-- definition de signaux de test	
	signal Xin_S : std_logic_vector(N_c -1 downto 0):= "01111";

	
	-- sortie des composant
	signal lt_S : std_logic := '0';
	signal eq_S : std_logic := '0';
	signal gt_S : std_logic := '0';
	signal jmp_S : std_logic;


begin
	Condition_test : Condition
		generic map(N => N_c)
		port map(
			Xin => Xin_S,
			lt => lt_S,
			eq =>eq_S,
			gt =>gt_S,
			jmp => jmp_S
		);
		
	Xin_S <= "00000" after 16 ns , "10101" after 32 ns ,"00101" after 48 ns ;
	gt_S <=  not gt_S after 2 ns;
	eq_S <=  not eq_S after 4 ns;
	lt_S <=  not lt_S after 8 ns;


end architecture;
