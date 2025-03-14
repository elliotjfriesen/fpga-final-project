library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all; 

entity buttons is 
    port (
	clk: in std_logic;
	vsync : in std_logic;
	leftbutton: in std_logic; 
	rightbutton : in std_logic;
	resetbutton: in std_logic;
	a_button: in std_logic;
	b_button: in std_logic;
	up_button : in std_logic;
	down_button : in std_logic;
	command: out unsigned(3 downto 0)
	);	
end entity;

architecture synth of buttons is

-- Location to update the command input
constant UPDATE_ROW: integer := 490;
	
-- Commands from the controller
constant LEFT_CMD: integer := 1;
constant RIGHT_CMD: integer := 2;
constant UP_CMD: integer := 3;
constant DOWN_CMD: integer := 4;
constant A_CMD: integer :=5;
constant B_CMD: integer :=6;
constant START_CMD: integer :=7;
constant SELECT_CMD: integer :=8;
constant STANDBY_CMD: integer := 9;
	
signal input: integer;
	
begin
-- Update memory in the dead zone
process (clk) is begin
	if rising_edge(clk) then
		
		-- Using pull up buttons so it's '0' instead of '1'
		if leftbutton = '0' then
			input <= LEFT_CMD;
		elsif rightbutton = '0' then
			input <= RIGHT_CMD;
		elsif resetbutton = '0' then
			input <= START_CMD;
		elsif a_button <= '0' then
			input <= A_CMD;
		elsif b_button <= '0' then
			input <= B_CMD;
		elsif up_button <= '0' then
			input <= UP_CMD;
		elsif down_button <= '0' then
			input <= DOWN_CMD;

		else
			input <= STANDBY_CMD;
		end if;
	end if;
end process;

-- Send out a command
command <= to_unsigned(input,4);
end;