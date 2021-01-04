library IEEE;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use std.textio.all;

entity PGCounter is
	generic(
		load_file_name : string;
		dta : integer := 8;
		adr : integer := 4);	
	port(
		addr : in std_logic_vector(adr-1 downto 0);
		jmp : in std_logic;
		clk : in std_logic;
		Reset : in std_logic;
		inst : out std_logic_vector(dta-1 downto 0));
	
end entity;

architecture beh of PGCounter is

signal wr_ena_sig : std_logic :='0';

signal dtain : std_logic_vector(dta-1 downto 0) := (others => '0');
signal LoadOut : std_logic_vector(adr-1 downto 0);
signal RamOut : std_logic_vector(dta-1 downto 0);
signal load : std_logic;
		
component LoadCount is
	generic(
		N : natural
	);

	port(
		X : in std_logic_vector(N-1 downto 0);
		clk : in std_logic;
		st : in std_logic;
		nrst : in std_logic;
		S : out std_logic_vector(N-1 downto 0)
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
	counter : LoadCount
	generic map(N=>adr)
	port map(
		X => addr,
		clk => clk,
		st => jmp,
		nrst => reset,
		S => LoadOut
		);

	ROM : RAM
	generic map
	(load_file_name=>load_file_name,
	dta => dta,
	adr => adr)

	port map(
		address => LoadOut,
		datain => dtain,
		wr_ena => wr_ena_sig,
		dataout => RamOut
		);
	
	inst <= RamOut;

end beh;
			 	
