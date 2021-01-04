library ieee;
use ieee.std_logic_textio.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use std.textio.all;


-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.InstDecodeur;

entity bench_InstDecodeur is

end entity;

architecture str of bench_InstDecodeur is

	component InstDecodeur is
		port(
			X : in std_logic_vector(15 downto 0);
			ci : out std_logic;
			sm : out std_logic;
			opc  : out std_logic_vector(5 downto 0);
			dst : out std_logic_vector(2 downto 0);
			cn : out std_logic_vector(2 downto 0);
			W : out std_logic_vector(15 downto 0));
		end component;
	
	
	-- definition de signaux de test	
	signal X_S : std_logic_vector(15 downto 0):= "1110101000001111";

	
	-- sortie des composant
	signal W_S : std_logic_vector(15 downto 0);
	signal ci_S : std_logic;
	signal sm_S : std_logic;
	signal opc_S : std_logic_vector(5 downto 0);
	signal dst_S : std_logic_vector(2 downto 0);
	signal cn_S : std_logic_vector(2 downto 0);


begin
	InstDecodeur_test : InstDecodeur
	
		port map(
			X => X_S,
			W => W_S,
			ci =>ci_S,
			sm =>sm_S,
			opc => opc_S,
			dst => dst_S,
			cn => cn_S
		);
		
	X_S <= "0000001000001111" after 20 ns , "1010101000001001" after 40 ns ,"0000101010001111" after 60 ns;
	

	

end architecture;
