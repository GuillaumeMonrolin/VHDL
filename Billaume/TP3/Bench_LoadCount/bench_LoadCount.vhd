library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;


-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.LoadCount;

entity bench_LoadCount is

end entity;

architecture str of bench_LoadCount is

	component LoadCount is
		generic(
			N : natural
		);

		port(
			X : in std_logic_vector(N-1 downto 0);
			clk : in std_logic;
			st : in std_logic;
			nrst : in std_logic;
			S : out std_logic_vector(N-1 downto 0)
		);
	end component;
	
	constant N_c : natural := 4;
	
	-- definition de signaux de test	
	signal X_S : std_logic_vector(N_c-1 downto 0):= "0011";
	
	--selection
	signal SEL_S : std_logic:='0';
	signal clk_S : std_logic:='0';
	signal nrst_S : std_logic:='1';
	-- sortie des composant
	signal SORTIE_S : std_logic_vector(N_c-1 downto 0);



begin
	LoadCount_test : LoadCount
		generic map(
		N => N_c)
		
		port map(
		X => X_S,
		clk => clk_S,
		st => SEL_S,
		nrst =>nrst_S,
		S => SORTIE_S
		);
		
	clk_S <= not clk_S after 2 ns;
	SEL_S <= '1' after 7 ns, '0' after 12 ns, '1' after 50 ns, '0' after 55 ns;
	nrst_S <= '0' after 80 ns, '1' after 82 ns;

end architecture;
