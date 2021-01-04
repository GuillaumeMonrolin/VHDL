library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;


-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.ModifIN;

entity bench_ModifIN is

end entity;

architecture str of bench_ModifIN is

	component ModifIN is
		generic(
			N : natural
		);

		port(
			X : in std_logic_vector(N-1 downto 0);
			zer : in std_logic;
			neg : in std_logic;
			sorti : out std_logic_vector(N-1 downto 0)
		);
	end component;
	
	constant N_c : natural := 4;
	
	-- definition de signaux de test	
	signal X_S : std_logic_vector(N_c-1 downto 0):= "0011";
	
	--selection
	signal SEL1_S : std_logic:='0';
	signal SEL2_S : std_logic:='0';
	
	-- sortie des composant
	signal SORTIE_S : std_logic_vector(N_c-1 downto 0);



begin
	ModifIN_test : ModifIN
		generic map(
		N => N_c)
		
		port map(
		X => X_S,
		zer => SEL1_S,
		neg => SEL2_S,
		sorti =>SORTIE_S
		);
		
	SEL1_S <= not SEL1_S after 10 ns;
	SEL2_S <= not SEL2_S after 20 ns;

end architecture;
