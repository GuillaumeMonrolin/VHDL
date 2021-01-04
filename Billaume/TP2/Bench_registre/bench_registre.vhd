--Aiguillage téléphonique
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.registre;

--definition de l'entite
entity bench_registre is
end entity;

--definition de l'architecture de test
architecture test of bench_registre is

  component registre
	generic(
		N : natural
	);

	port(
		D : in std_logic_vector(N-1 downto 0);
		clk : in std_logic;
		load : in std_logic;
		nrst : in std_logic;
		Q : out std_logic_vector(N-1 downto 0)

	);
  end component;

  constant N_c : natural := 4;
  --definition de signaux de test
  signal load_S : std_logic := '0' ;
  signal nrst_S : std_logic := '1' ;
  signal clk_S : std_logic := '0' ;
  signal D_S : std_logic_vector(N_c-1 downto 0) := "1010";
  signal Q_S : std_logic_vector(N_c-1 downto 0);

  

begin

  --design under test (dut)
  dut : registre
    generic map(
    N => N_c)
    port map(
      D => D_S,
      clk => clk_S,
      Q => Q_S,
      load => load_S,
      nrst => nrst_S
      
    );

  --Generation des stimulis
  
  clk_S <=  not clk_S after 5 ns;
  nrst_S <= not nrst_S after 35 ns, '1' after 40 ns;
  load_S <= not load_S after 30 ns, '0' after 35 ns; 
  
end architecture; 
