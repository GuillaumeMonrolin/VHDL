library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;


-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.subn;

entity bench_subn is

end entity;

architecture str of bench_subn is

	component subn is
		generic(
		N : natural
			);

		port(
			A : in std_logic_vector(N-1 downto 0);
			B : in std_logic_vector(N-1 downto 0);
			S : out std_logic_vector(N-1 downto 0);
			R : out std_logic
		);
	end component;
	
	constant N_c : natural := 4;
	
	-- definition de signaux de test	
	signal A_S : std_logic_vector(N_c-1 downto 0):= "0000";
	signal B_U : unsigned(N_c -1 downto 0):= (others =>'0');
	signal B_S : std_logic_vector(N_c-1 downto 0);
	signal R_S : std_logic;
	signal S_S : std_logic_vector(N_c-1 downto 0);


begin
	subn1 : subn
		generic map(
		N => N_c)
		
		port map(
		A => A_S,
		B => B_S,
		S => S_S,
		R => R_S
		);
		
	--pour incrementer la valeur de A_S toutes les 5 ns
	increment: process
	begin
	B_U <= B_U +1;
	wait for 5 ns;
	end process;
	B_S <= std_logic_vector(B_U);
		
    	A_S   <= "0110";	

 

end architecture;
