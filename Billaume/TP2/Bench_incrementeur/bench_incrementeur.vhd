library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;


-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.incrementeur;

entity bench_incrementeur is

end entity;

architecture str of bench_incrementeur is

	component incrementeur is
		generic(
			N : natural
		);
		port(
			X : in std_logic_vector(N-1 downto 0);
			S : out std_logic_vector(N-1 downto 0);
			R : out std_logic
		);
	end component;
	
	constant N_c : natural := 4;
	
	-- definition de signaux de test	
	signal X_S : std_logic_vector(N_c-1 downto 0):= "0000";
	signal X_U : unsigned(N_c -1 downto 0):= (others =>'0');
	signal R_S : std_logic;
	signal S_S : std_logic_vector(N_c-1 downto 0);


begin
	increment_test : incrementeur
		generic map(
		N => N_c)
		
		port map(
		X => X_S,
		S => S_S,
		R => R_S
		);
		
	--pour incrementer la valeur de A_S toutes les 5 ns
	adition: process
	begin
	X_U <= X_U +1;
	wait for 5 ns;
	end process;
	X_S <= std_logic_vector(X_U);
			

 

end architecture;
