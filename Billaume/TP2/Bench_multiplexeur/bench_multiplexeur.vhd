--Aiguillage téléphonique
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--bibliotheque indique dans votre Makefile
library TP_LIB;
use     TP_LIB.multiplexeur;

--definition de l'entite
entity bench_multiplexeur is
end entity;

--definition de l'architecture de test
architecture test of bench_multiplexeur is

  component multiplexeur
  port(
    D0 : in integer;
    D1 : in integer;
    sel : in std_logic;
    S : out integer

  );
  end component;

  --definition de signaux de test
  signal sel_S : std_logic := '0' ;
  signal D0_S : integer := 520;
  signal D1_S : integer := 360 ;
  signal S_S : integer;

  

begin

  --design under test (dut)
  dut : multiplexeur
    port map(
      D0 => D0_S,
      D1 => D1_S,
      S => S_S,
      sel => sel_S
      
    );

  --Generation des stimulis
  
  sel_S <=  not sel_s after 20 ns;
  D0_S <= 700 after 35 ns;
  
end architecture; 
