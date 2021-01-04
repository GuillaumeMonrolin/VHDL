library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.res_aig;

entity bench_res_aig is
end entity;

architecture str of bench_res_aig is
	component res_aig is
		port(
			ctl : in std_logic_vector(4 downto 0);
			A : in integer;
			B : in integer;
			C : in integer;
			D : in integer;
			E : out integer;
			F : out integer;
			G : out integer;
			H : out integer
		);
	end component;

	-- definition de signaux de test	
	signal A_S : integer;
	signal B_S : integer;
	signal C_S : integer;
	signal D_S : integer;
	signal E_S : integer;
	signal F_S : integer;
	signal G_S : integer;
	signal H_S : integer;
	signal ctl_S : std_logic_vector(4 downto 0):="00000";

begin
	res_aig1 : res_aig
		port map(
		ctl => ctl_S,
		A => A_S,
		B => B_S, 
		C => C_S, 
		D => D_S,
		E => E_S,
		F => F_S,
		G => G_S,
		H => H_S
		);
		

		
    A_S   <= 10;
    B_S   <= 20;	
    C_S   <= 30;
    D_S   <= 40;
    
    ctl_S(0) <= not ctl_S(0) after 10 ns;
    ctl_S(1) <= not ctl_S(1) after 20 ns;
    ctl_S(2) <= not ctl_S(2) after 40 ns;


end architecture;
