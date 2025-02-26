library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity nes_in is 
	port (
			nes_clk: out std_logic; 
			nes_count: out unsigned(7 downto 0)
			);
	end nes_in ; 
Architecture driver of nes_in is
	component HSOSC is
	generic (CLKHF_DIV : String := "0b00"); 
		port(
				CLKHFPU : in std_logic := 'X'; -- Set to 1 to power up
				CLKHFEN : in std_logic := 'X'; -- Set to 1 to enable output
				CLKHF : out std_logic := 'X'); -- Clock output
				end component HSOSC;
	signal counter: unsigned( 19 downto 0):= 20b"0"; 
	signal clk: std_logic; 
begin 
		 osc : HSOSC generic map ( CLKHF_DIV => "0b00")
				port map (CLKHFPU => '1',
						  CLKHFEN => '1',
						  CLKHF => clk);
	process(clk) 
		begin 
			
			if (rising_edge(CLK)) then 
				counter <= counter + 20d"1";
			end if ;
			end process; 
	nes_clk <= counter(8); 
	nes_count <= counter(16 downto 9); 
end  driver; 