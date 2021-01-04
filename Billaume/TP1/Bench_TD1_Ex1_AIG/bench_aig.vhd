
architecture str of bench_aig is

component aig is
	port(
		ctl : in std_logic;
		A : in integer;
		B : in integer;
		C : out integer;
		D : out integer
	);
end component;

	-- definition de signaux de test	
	signal A_S : integer;
	signal B_S : integer;
	signal C_S : integer;
	signal D_S : integer;
	signal ctl_S : std_logic := '0';

begin
	aig1 : aig
		port map(
		ctl => ctl_S,
		A => A_S,
		B => B_S,
		C => C_S, 
		D => D_S
		);
		
    A_S   <= 10   after 10 ns, 40 after 60 ns;
    B_S   <= 50 after 10 ns , 60 after 30 ns , 120 after 40 ns;
    ctl_S <= '1' after 15 ns;

end architecture;
