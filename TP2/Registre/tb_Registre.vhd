library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_Registre is
end tb_Registre;

architecture tb_registre_test of tb_Registre is
	
	constant Nc:	natural := 16;

	signal sig_clk : std_logic := '0'; 
	signal sig_load : std_logic := '0';
	signal sig_nrst : std_logic := '1';
	signal sig_D : std_logic_vector (Nc downto 0);
	signal sig_Q : std_logic_vector (Nc downto 0);
 
component Registre is

	generic(
		N : natural := 16
	);

	port(
		clk : in std_logic;
		load : in std_logic; 
		nrst : in std_logic; 
		D : in std_logic_vector (N downto 0);
		Q : out std_logic_vector (N downto 0)
		 
	);

end component;

begin
	DUT : Registre
	port map(
		D => sig_D,
		Q => sig_Q,
		clk => sig_clk,
		load => sig_load,
		nrst => sig_nrst
		
	);
	
	sig_clk <= not sig_clk after 5 ns; 
	sig_load <= '1' after 15 ns, '0' after 65 ns; 
	sig_nrst <= '0' after 24 ns, '1' after 30 ns, '0' after 51 ns, '1' after 54 ns;   
	sig_D <= "11101010001010101" after 10 ns,"00001010001010101" after 30 ns ;
 
	
	
	
end architecture;
