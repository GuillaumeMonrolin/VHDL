--Aiguillage téléphonique
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.inverseur;

--definition de l'entite
entity bench_inverseur is
end entity;

--definition de l'architecture de test
architecture test of bench_inverseur is

  component inverseur
	generic(
		N : natural
	);

	port(
		X : in std_logic_vector(N-1 downto 0);
		S : out std_logic_vector(N-1 downto 0)

	);
  end component;

  constant N_c : natural :=4;
  --definition de signaux de test
  
  signal X_S : std_logic_vector(N_c-1 downto 0);
  signal S_S : std_logic_vector(N_c-1 downto 0);
  signal X_U : unsigned(N_c -1 downto 0):= (others =>'0');
  
  begin
  
    --design under test (dut)
  dut : inverseur
    generic map(
    N => N_c)
    port map(
	X => X_S,
	S => S_S 
    );

  addition: process
  	begin
	X_U <= X_U +1;
	wait for 5 ns;
	end process;
	X_S <= std_logic_vector(X_U);
  
end architecture; 
