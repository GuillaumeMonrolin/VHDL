--Entite add
library IEEE;
use IEEE.std_logic_1164.all;

--definition de l'entite
entity LoadCount is
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
end entity;

--definition de l'architecture
architecture flot of LoadCount is

signal IncrOutput : std_logic_vector(N-1 downto 0);
signal MuxInOutput : std_logic_vector(N-1 downto 0);
signal RegistreOut : std_logic_vector(N-1 downto 0);
signal load : std_logic;

component incrementeur is
	generic(
		N : natural
	);

	port(
		X : in std_logic_vector(N-1 downto 0);
		S : out std_logic_vector(N-1 downto 0);
		R : out std_logic
	);
end component;

component multiplexeur is
	generic(
		N : natural
	);
	port(
		D0 : in std_logic_vector(N-1 downto 0);
		D1 : in std_logic_vector(N-1 downto 0);
		sel : in std_logic;
		S : out std_logic_vector(N-1 downto 0)
	);
end component;

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
	

begin

load <= not (st and '0');
	
	Mul : multiplexeur
	generic map(N=>N)
	port map(
		D0 => IncrOutput,
		D1 => X,
		sel => st,
		S => MuxInOutput
		);

	incr : incrementeur
	generic map(N=>N)
	port map(
		X => RegistreOut,
		S => IncrOutput
		);

	reg: registre
	generic map(N=>N)
	port map(
		D => MuxInOutput,
		clk => clk,
		load => load,
		nrst => nrst,
		Q => RegistreOut
		);

		S <= RegistreOut;
	
end architecture;
