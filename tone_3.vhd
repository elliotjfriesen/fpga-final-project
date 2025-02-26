library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Audio3 is
	port(
		
		--enableaudio_in_Audio : in std_logic;
		seconds: in unsigned(10 downto 0);
		clk: in std_logic;
		tone3 : out std_logic
		);
end Audio3;

architecture synth of Audio3 is
--signal tile_pressed :  unsigned(20 downto 0);
signal count : unsigned(19 downto 0) := (others => '0');
signal limit2 : unsigned(19 downto 0) := (others => '0');
begin
 
limit2 <= 20d"152457" when seconds > 11d"49" and seconds < 11d"53" else --E2 1 1
	--20d"152457" when seconds = 11d"45"  else  --E3 2 
	--20d"152457" when seconds = 11d"47"  else  --E3 3
	--20d"304913" when seconds = 11d"49"  else  --E2 4
	--20d"161523" when seconds = 11d"51"  else  --D#3 5    1
	--20d"161523" when seconds = 11d"53"  else  -- 6 D#3
	--20d"161523" when seconds = 11d"55"  else  -- 7 D#3
	20d"161523" when seconds > 11d"59" and seconds < 11d"62" else  -- 8  D#3
	--20d"181303" when seconds = 11d"59"  else  -- 9 c#6  1
	--20d"181303" when seconds = 11d"61"  else  -- 10 2 c#6
	--20d"181303" when seconds = 11d"63"  else  -- 11 3 c#6
	20d"181303" when seconds > 11d"64" and seconds < 11d"68" else  -- 12 4 c#3
	--20d"228427" when seconds = 11d"67"  else  -- 13 A5  1 
	--20d"228427" when seconds = 11d"69"  else  -- 14 2 A5
	20d"121021" when seconds > 11d"70" and seconds < 11d"73" else  --15 G#3 
	--20d"152457" when seconds = 11d"73"  else  --E6
	--20d"19057" when tile_pressed = 21x"1FFFF"  else --E6
	--20d"19057" when tile_pressed = 21x"3FFFF"  else --E6	
	--20d"38114" when tile_pressed = 21x"7FFFF"  else --E5
	
	20d"1";
process (clk)
begin
	if rising_edge(clk) then
		count <= count + 1;
		if  limit2 = 20d"1" then 
			tone3 <= '0';
			
		else
			if (count < limit2) then
				tone3 <= '1';
			elsif (count < limit2&"0") and (count > limit2 - 1) then
				tone3 <= '0';
			else 
				count <= (others => '0');
			end if;
		end if;

	end if;
end process;


end;