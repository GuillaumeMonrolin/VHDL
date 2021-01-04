library IEEE;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use std.textio.all;

entity MemREGs is
	generic(
		load_file_name : string;
		dta : integer := 8;
		adr : integer := 4);	
	port(
		Xin : in std_logic_vector(dta-1 downto 0);
		a : in std_logic;
		d : in std_logic;
		sa  : in std_logic;
		clk : in std_logic;
		Reset : in std_logic;
		Aout : out std_logic_vector(adr-1 downto 0);
		Dout : out std_logic_vector(adr-1 downto 0);
		FromMem : out std_logic_vector(dta-1 downto 0));
	
end entity;

architecture beh of MemREGs is


signal RegistreDOut : std_logic_vector(adr-1 downto 0);
signal RegistreAOut : std_logic_vector(adr-1 downto 0);
signal RamOut : std_logic_vector(dta-1 downto 0);

		
component registre is
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

component RAM is
	generic(
		load_file_name : string;
		dta : integer := 8;
		adr : integer := 4);
		
	port(
		address : in std_logic_vector(adr-1 downto 0);
		datain : in std_logic_vector(dta-1 downto 0);
		wr_ena : in std_logic;
		dataout : out std_logic_vector(dta-1 downto 0));
end component;

begin

	regA: registre
	generic map(N=>adr)
	port map(
		D => Xin,
		clk => clk,
		load => a,
		nrst => Reset,
		Q => RegistreAOut
		);
		
	regD: registre
	generic map(N=>adr)
	port map(
		D => Xin,
		clk => clk,
		load => d,
		nrst => Reset,
		Q => RegistreDOut
		);

	ROM : RAM
	generic map
	(load_file_name=>load_file_name,
	dta => dta,
	adr => adr)

	port map(
		address => RegistreAOut,
		datain => Xin,
		wr_ena => sa,
		dataout => RamOut
		);
		
	Aout <= RegistreAOut;
	Dout <= RegistreDOut;
	FromMem <= RamOut;

end beh;
			 	
