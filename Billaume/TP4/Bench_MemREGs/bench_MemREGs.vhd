library ieee;
use ieee.std_logic_textio.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use std.textio.all;


-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.MemREGs;

entity bench_MemREGs is

end entity;

architecture str of bench_MemREGs is

	component MemREGs is
		generic(
			load_file_name : string;
			dta : integer := 8;
			adr : integer := 4);	
		port(
			Xin : in std_logic_vector(dta-1 downto 0);
			a : in std_logic;
			d : in std_logic;
			sa  : in std_logic;
			clk : in std_logic;
			Reset : in std_logic;
			Aout : out std_logic_vector(dta-1 downto 0);
			Dout : out std_logic_vector(dta-1 downto 0);
			FromMem : out std_logic_vector(dta-1 downto 0));
	end component;
	
	constant load_file_name_C : string := "monFichier.txt";
	constant dta_c : integer := 8;
	constant adr_c : integer := 8;
	
	-- definition de signaux de test	
	signal Xin_S : std_logic_vector(dta_c-1 downto 0):= "00011111";
	signal a_S : std_logic := '0';
	signal d_S : std_logic := '0';
	signal sa_S : std_logic := '0';
	signal clk_S : std_logic := '0';
	signal reset_S : std_logic := '0';
	
	-- sortie des composant
	signal FromMem_S : std_logic_vector(dta_c-1 downto 0);
	signal Aout_S : std_logic_vector(adr_c-1 downto 0);
	signal Dout_S : std_logic_vector(adr_c-1 downto 0);


begin
	MemRegs_test : MemREGs
		generic map(
		load_file_name => load_file_name_C,
		dta => dta_C,
		adr => adr_C)
		
		port map(
			Xin => Xin_S ,
			a => a_S ,
			d => d_S ,
			sa => sa_S ,
			clk => clk_S ,
			Reset => reset_S  ,
			Aout => Aout_S,
			Dout => Dout_S ,
			FromMem => FromMem_S
	
		);
		
	reset_S <= '1' after 15 ns, '0' after 50 ns , '1' after 52 ns;
	clk_S <= not clk_S after 2 ns;
	sa_S <= '1' after 40 ns , '0' after 45 ns, '1' after 80 ns, '0' after 85 ns;
	a_S <= '1' after 20 ns , '0' after 25 ns, '1' after 80 ns, '0' after 85 ns;
	d_S <= '1' after 30 ns , '0' after 35 ns, '1' after 80 ns, '0' after 85 ns;
	Xin_S <= "00000010" after 10 ns, "00000110" after 60 ns;
	

	

end architecture;
