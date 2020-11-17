library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_Mul21 is
end tb_Mul21;

architecture tb_multiplexeur_test of tb_Mul21 is
	
	constant Nc:	natural := 4;

	signal sig_D0 : std_logic_vector (Nc downto 0);
	signal sig_D1 : std_logic_vector (Nc downto 0);
	signal sig_Sel : std_logic; 
	signal sig_S : std_logic_vector (Nc downto 0);
 
component Mul21 is

	generic(
		N : natural := 4
	);

	port(
	
		D0 : in std_logic_vector (N downto 0);
		D1: in std_logic_vector (N downto 0);
		Sel : in std_logic;
		S : out std_logic_vector (N downto 0)  
	);

end component;

begin
	DUT : Mul21
	port map(
		D0 => sig_D0,
		D1 => sig_D1,
		Sel => sig_Sel,
		S => sig_S
	);
	
	sig_Sel <= '0' after 5 ns, '1' after 13 ns, '0' after 20 ns; 
	sig_D0 <= "10000" after 10 ns, "11000" after 40 ns;
	sig_D1 <= "00011" after 15 ns; 
	
	
	
end architecture;
