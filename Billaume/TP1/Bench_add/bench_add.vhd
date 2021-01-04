--Aiguillage téléphonique
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.add;

--definition de l'entite
entity bench_add is
end entity;

--definition de l'architecture de test
architecture test of bench_add is

  component add
  port(
	Cin : in std_logic;
	A : in std_logic;
	B : in std_logic;
        S : out std_logic;
        Cout : out std_logic

  );
  end component;

  --definition de signaux de test
  signal Cin_S : std_logic := '0' ;
  signal A_S : std_logic := '0' ;
  signal B_S : std_logic := '0' ;
  signal S_S : std_logic := '0' ;
  signal Cout_S : std_logic := '0' ;
  

begin

  --design under test (dut)
  dut : add
    port map(
      Cin => Cin_S,
      A => A_S,
      B => B_S,
      S => S_S,
      Cout => Cout_S
      
      
    );

  --Generation des stimulis
  A_S   <=  not A_S after 10 ns;
  B_S   <=  not B_S after 20 ns;
  Cin_S <=  not Cin_S after 30 ns;
  
end architecture; 
