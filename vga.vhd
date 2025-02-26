library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity vga is
  port(
	  clock : in std_logic;
	  HSYNC : out std_logic;
	  VSYNC : out std_logic;
	  row_count : out unsigned(9 downto 0);
	  col_count : out unsigned(9 downto 0);
	  valid : out std_logic
  );
end vga;

architecture synth of vga is
	signal row_count_sig : unsigned(9 downto 0) := "0000000000";
	signal col_count_sig : unsigned(9 downto 0) := "0000000000";
begin
	row_count <= row_count_sig;
	col_count <= col_count_sig;
	
	process (clock) begin
	if rising_edge(clock) then
		col_count_sig <= col_count_sig + 1;
		if col_count_sig = 799 then 
			row_count_sig <= row_count_sig + 1;
			col_count_sig <= "0000000000";
		end if;
		
		if row_count_sig = 524 then
			row_count_sig <= "0000000000";
		end if;
	end if;
	end process;
	
	valid <= '1' when col_count_sig <= 639 and row_count_sig <= 479 else '0';
    HSYNC <= '1' when col_count_sig < 656 or col_count_sig > 751 else '0';
	VSYNC <= '1' when row_count_sig < 490 or row_count_sig > 491 else '0';
			
end;