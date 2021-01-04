--Entite add
library IEEE;
use IEEE.std_logic_1164.all;

--definition de l'entite
entity ModifIN is
	generic(
		N : natural
	);

	port(
		X : in std_logic_vector(N-1 downto 0);
		zer : in std_logic;
		neg : in std_logic;
		sorti : out std_logic_vector(N-1 downto 0)
	);
end entity;

--definition de l'architecture
architecture flot of ModifIN is

signal zero : std_logic_vector(N-1 downto 0):= (others =>'0');
signal MuxInOutput : std_logic_vector(N-1 downto 0);
signal InvOut : std_logic_vector(N-1 downto 0);
signal MuxInvOutput : std_logic_vector(N-1 downto 0);

component inverseur is
	generic(
		N : natural
	);

	port(
		X : in std_logic_vector(N-1 downto 0);
		S : out std_logic_vector(N-1 downto 0)
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
	

begin
	
	M1 : multiplexeur
	generic map(N=>N)
	port map(
		D0 => X,
		D1 => zero,
		sel => zer,
		S => MuxInOutput
		);

	inv : inverseur
	generic map(N=>N)
	port map(
		X => MuxInOutput,
		S => InvOut
		);

	M2 : multiplexeur
	generic map(N=>N)
	port map(
		D0 => MuxInOutput,
		D1 => InvOut,
		sel => neg,
		S => MuxInvOutput
		);
	
		sorti <= MuxInvOutput;
	
end architecture;
