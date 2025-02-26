library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity second_clock is
  port(
	  nes_b: in std_logic;
	  V_SYNC : in std_logic;
	  seconds : out unsigned(10 downto 0)
  );
end second_clock;

architecture synth of second_clock is
	signal counter_repeater : unsigned(9 downto 0) := to_unsigned(0, 10); -- changed from 5
	signal curr_seconds : unsigned(10 downto 0);
	
begin
	process (V_SYNC) begin
		if rising_edge(V_SYNC) then
		if (nes_b = '0') then
			if (counter_repeater < 60) then
					counter_repeater <= counter_repeater + 1;
			else
				
					curr_seconds <= curr_seconds + 3;
		
				
					counter_repeater <= to_unsigned(0, 10);
				--end if;
			end if;
		else
			curr_seconds <= to_unsigned(0, 11);
		end if;
		end if;
	end process;
	
	seconds <= curr_seconds;		
end;