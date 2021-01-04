library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;


-- bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.ALU;

entity bench_ALU is

end entity;

architecture str of bench_ALU is

	component ALU is
		generic(
			N : natural
		);

		port(
			X : in std_logic_vector(N-1 downto 0);
			Y : in std_logic_vector(N-1 downto 0);
			zx : in std_logic;
			nx : in std_logic;
			zy : in std_logic;
			ny : in std_logic;
			f : in std_logic; 	--selecteur premier mux
			n0 : in std_logic;	--selecteur deuxieme mux
			S : out std_logic_vector(N-1 downto 0)
		);
	end component;
	
	constant N_c : natural := 4;
	
	-- definition de signaux de test	
	signal X_S : std_logic_vector(N_c-1 downto 0):= "0011";
	signal Y_S : std_logic_vector(N_c-1 downto 0):= "0101";
	
	-- selection
	signal zx_S : std_logic:='1';
	signal nx_S : std_logic:='0';
	signal zy_S : std_logic:='1';
	signal ny_S : std_logic:='0';
	signal f_S : std_logic :='1';
	signal n0_S : std_logic:='0';
	
	-- sortie des composant
	signal SORTIE_S : std_logic_vector(N_c-1 downto 0);



begin
	ALU_test : ALU
		generic map(
		N => N_c)
		
		port map(
			X => X_S,
			Y => Y_S,
			zx => zx_S,
			nx => nx_S,
			zy => zy_S,
			ny => ny_S,
			f => f_S,
			n0 => n0_S,
			S => SORTIE_S
		);
		
	zx_S <= '0' after 15 ns,'1' after 20 ns,'0' after 25 ns,'1' after 30 ns,'0' after 35 ns,'1' after 40 ns, '0' after 45 ns,'1' after 50 ns,'0' after 55 ns,'1' after 65 ns,'0' after 70 ns;
	nx_S <= '1' after 5 ns,'0' after 15 ns,'1' after 20 ns,'0' after 25 ns,'1' after 30 ns,'0' after 35 ns,'1' after 40 ns,'0' after 55 ns,'1' after 65 ns,'0' after 75 ns,'1' after 85 ns;
	zy_S <= '0' after 20 ns,'1' after 25 ns,'0' after 30 ns,'1' after 35 ns,'0' after 40 ns,'1' after 45 ns,'0' after 50 ns,'1' after 60 ns,'0' after 65 ns;
	ny_S <= '1' after 5 ns,'0' after 10 ns,'1' after 15 ns,'0' after 20 ns,'1' after 25 ns,'0' after 30 ns,'1' after 35 ns,'0' after 40 ns,'1' after 45 ns,'0' after 55 ns,'1' after 60 ns,'0' after 65 ns,'1' after 75 ns,'0' after 80 ns,'1' after 85 ns;
	
	f_S <= '0' after 15 ns,'1' after 35 ns, '0' after 80 ns;
	n0_S <='1' after 5 ns,'0' after 10 ns,'1' after 25 ns,'0' after 55 ns,'1' after 70 ns,'0' after 80 ns,'1' after 85 ns;


end architecture;
