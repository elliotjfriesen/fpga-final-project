library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity nes_control is 
port (  data : in std_logic;
		latch : out std_logic;
		clk_cntlr : out std_logic;
		data_out : out std_logic_vector(7 downto 0);
		nes_clk: in std_logic; 
		nes_count: in unsigned(7 downto 0)
		);
end nes_control; 


Architecture synth of nes_control is 
signal data_output : std_logic_vector(7 downto 0);
begin 

	
latch <= '1' when nes_count = 8x"FF" else '0'; 
clk_cntlr <= nes_clk when (nes_count < 8x"08") else '0' ; 

process (clk_cntlr) 
begin 
	if rising_edge(clk_cntlr) then
		data_output(0) <= data; --right
		data_output(1) <= data_output(0); --left
		data_output(2) <= data_output(1); --down
		data_output(3) <= data_output(2); --up
		data_output(4) <= data_output(3); --start
		data_output(5) <= data_output(4); --select
		data_output(6) <= data_output(5); --B
		data_output(7) <= data_output(6); --A
end if;

data_out <= not data_output when nes_count = x"08";
end process;
end synth; 
	




	

		
		