library ieee;
use ieee.std_logic_textio.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use std.textio.all;


-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.RAM;

entity bench_RAM is

end entity;

architecture str of bench_RAM is

	component RAM is
		generic(
			load_file_name : string;
			dta : integer := 8;
			adr : integer := 4);
		
		port(
			address : in std_logic_vector(adr-1 downto 0);
			datain : in std_logic_vector(dta-1 downto 0);
			wr_ena : in std_logic;
			dataout : out std_logic_vector(dta-1 downto 0));
	end component;
	
	constant load_file_name_C : string := "monFichier.txt";
	constant dta_c : integer := 8;
	constant adr_c : integer := 4;
	-- definition de signaux de test	
	signal address_S : std_logic_vector(adr_c-1 downto 0):= "0000";
	signal datain_S : std_logic_vector(dta_c-1 downto 0):= "00000000";

	
	--selection
	signal wr_ena_S : std_logic := '0';
	-- sortie des composant
	signal dataout_S : std_logic_vector(dta_c-1 downto 0);



begin
	RAM_test : RAM
		generic map(
		load_file_name => load_file_name_C,
		dta => dta_C,
		adr => adr_C)
		
	
		port map(
		address => address_S,
		datain => datain_S,
		wr_ena => wr_ena_S,
		dataout => dataout_S
		);
		
	--wr_ena_S <= not wr_ena_S after 2 ns, '0' after 35 ns;
	address_S <= "0001" after 10 ns, "0010" after 20 ns , "0011" after 30 ns , "0000" after 40 ns , "0000" after 50 ns, "0001" after 60 ns, "0010" after 70 ns , "0011" after 80 ns;
	--datain_S <= "00000001" after 10 ns,"00000100" after 20 ns,"00110100" after 30 ns;
	

end architecture;
