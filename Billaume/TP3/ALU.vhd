--Entite add
library IEEE;
use IEEE.std_logic_1164.all;

--definition de l'entite
entity ALU is
	generic(
		N : natural
	);

	port(
		X : in std_logic_vector(N-1 downto 0);
		Y : in std_logic_vector(N-1 downto 0);
		zx : in std_logic;
		nx : in std_logic;
		zy : in std_logic;
		ny : in std_logic;
		f : in std_logic; 	--selecteur premier mux
		n0 : in std_logic;	--selecteur deuxieme mux
		S : out std_logic_vector(N-1 downto 0)
	);
end entity;

--definition de l'architecture
architecture flot of ALU is

signal Mod1Out : std_logic_vector(N-1 downto 0);
signal Mod2Out : std_logic_vector(N-1 downto 0);

signal ADDOut : std_logic_vector(N-1 downto 0);
signal carry : std_logic;
signal ETOut : std_logic_vector(N-1 downto 0);

signal MuxInOutput : std_logic_vector(N-1 downto 0);
signal InvOut : std_logic_vector(N-1 downto 0);
signal MuxInvOutput : std_logic_vector(N-1 downto 0);

component ModifIN is
	generic(
		N : natural
	);

	port(
		X : in std_logic_vector(N-1 downto 0);
		zer : in std_logic;
		neg : in std_logic;
		sorti : out std_logic_vector(N-1 downto 0)
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

component inverseur is
	generic(
		N : natural
	);

	port(
		X : in std_logic_vector(N-1 downto 0);
		S : out std_logic_vector(N-1 downto 0)
	);
end component;

component addn is
	generic(
		N : natural
	);

	port(
		A : in std_logic_vector(N-1 downto 0);
		B : in std_logic_vector(N-1 downto 0);
		S : out std_logic_vector(N-1 downto 0);
		R : out std_logic
	);
end component;

begin

ETOut <=  (Mod1Out and Mod2Out);
	
	Modx : ModifIN
	generic map(N=>N)
	port map(
		X => X,
		zer => zx,
		neg => nx,
		sorti => Mod1Out
		);
	
	Mody : ModifIN
	generic map(N=>N)
	port map(
		X => Y,
		zer => zy,
		neg => ny,
		sorti => Mod2Out
		);
		
	ADD : addn
	generic map(N=>N)
	port map(
		A => Mod1Out,
		B => Mod2Out,
		S => ADDOut,
		R => carry
		);
		
	M1 : multiplexeur
	generic map(N=>N)
	port map(
		D0 => ETOut,
		D1 => ADDOut,
		sel => f,
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
		sel => n0,
		S => MuxInvOutput
		);
	
	S <= MuxInvOutput;
	
end architecture;
