library ieee;
use ieee.std_logic_textio.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use std.textio.all;


-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.PGCounter;

entity bench_PGCounter is

end entity;

architecture str of bench_PGCounter is

	component PGCounter is
		generic(
			load_file_name : string;
			dta : integer := 8;
			adr : integer := 4);
		port(
			addr : in std_logic_vector(adr-1 downto 0);
			jmp : in std_logic;
			clk : in std_logic;
			reset : in std_logic;
			inst : out std_logic_vector(dta-1 downto 0));
	end component;
	
	constant load_file_name_C : string := "monFichier.txt";
	constant dta_c : integer := 8;
	constant adr_c : integer := 4;
	
	-- definition de signaux de test	
	signal addr_S : std_logic_vector(adr_c-1 downto 0):= "0000";
	signal jmp_S : std_logic := '0';
	signal clk_S : std_logic := '0';
	signal reset_S : std_logic := '0';
	
	-- sortie des composant
	signal inst_S : std_logic_vector(dta_c-1 downto 0);



begin
	PGCounter_test : PGCounter
		generic map(
		load_file_name => load_file_name_C,
		dta => dta_C,
		adr => adr_C)
		
	
		port map(
			addr => addr_S,
			jmp =>jmp_S,
			clk =>clk_S,
			reset =>reset_S,
			inst => inst_S
		);
		
	reset_S <= '1' after 15 ns, '0' after 50 ns , '1' after 52 ns;
	clk_S <= not clk_S after 2 ns;
	jmp_S <= '1' after 30 ns , '0' after 35 ns, '1' after 80 ns, '0' after 85 ns;
	addr_S <= "0011" after 10 ns, "0101" after 70 ns;
	

	

end architecture;
