--Aiguillage téléphonique
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.alarme;

--definition de l'entite
entity bench_alarme is
end entity;

--definition de l'architecture de test
architecture test of bench_alarme is

  component alarme
	port(
		V : in std_logic;
		P : in std_logic;
		F : in std_logic;
		S : out std_logic
	);
  end component;

  --definition de signaux de test

  signal V_S : std_logic := '0' ;
  signal P_S : std_logic := '0' ;
  signal F_S : std_logic := '0' ;
  signal S_S : std_logic := '0' ;
  

begin

  --design under test (dut)
  dut : alarme
    port map(
      V => V_S,
      F => F_S,
      P => P_S,
      S => S_S
      
      
    );

  --Generation des stimulis
  V_S   <=  not V_S after 40 ns;
  P_S   <=  not P_S after 20 ns;
  F_S <=  not F_S after 10 ns;
  
end architecture; 
