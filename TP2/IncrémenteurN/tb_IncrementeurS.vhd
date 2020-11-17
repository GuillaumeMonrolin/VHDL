library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_IncrementeurS is
end tb_IncrementeurS;

architecture tb_Increm_test of tb_IncrementeurS is
	
	constant Nc:	natural := 4;

	signal sig_IN : std_logic_vector (Nc downto 0);
	signal sig_OUT : std_logic_vector (Nc downto 0);

component IncrementateurS is

	generic(
		N : natural := 4
	);

	port(
	
		X : in std_logic_vector (N downto 0);
	        C : in integer := 1;
	        Xplus1 : out std_logic_vector (N downto 0) 
	);

end component;

begin
	DUT : IncrementateurS
	port map(
		X => sig_IN,
		Xplus1 => sig_OUT
	);
	
	sig_IN <= "00000" after 10 ns, "00011" after 25 ns, "10001" after 40 ns, "00000" after 50 ns, "11100" after 60 ns, "00000" after 70 ns;
	
	
end architecture;
