library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;


entity Registre is
	generic(
		N : natural := 16
	);
	port(
		clk : in std_logic;
		load : in std_logic; 
		nrst : in std_logic; 
		D : in std_logic_vector (N downto 0);
		Q : out std_logic_vector (N downto 0)	  
	);
end entity;

architecture RegN of Registre is

begin

     PROCESS(clk,nrst) BEGIN
  	IF nrst='0' THEN
        	Q <=(OTHERS=>'0'); -- ou S <= "Nx0";
        ELSIF clk'event and clk='1' and load='1' THEN
        	Q <= D;
        END IF;
     END PROCESS;
	
end RegN;




