library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Audio is
	port(
		
		enableaudio_in_Audio : in std_logic;
		seconds: in unsigned(10 downto 0);
		clk: in std_logic;
		tone : out std_logic;
		score: out integer
		);
end Audio;

architecture synth of Audio is
signal tile_pressed :  unsigned(20 downto 0);
signal count : unsigned(17 downto 0) := (others => '0');
signal limit : unsigned(17 downto 0) := (others => '0');

begin
 --tile_pressed <= 21x"1" when seconds = 11d"13" else --E6 1 1
	--21x"3" when seconds = 11d"15" else --D#6 2 
	--21x"7" when seconds = 11d"17" else --A5 3
	--21x"F" when seconds = 11d"19" else --C#5 4
	--21x"1F" when seconds = 11d"21"  else --E6 5    1
	--21x"3F" when seconds = 11d"23"  else -- 6 D#6
	--21x"7F" when seconds = 11d"25"  else -- 7 D#5
	--21x"FF" when seconds = 11d"27"  else -- 8  C#5
	--21x"1FF" when seconds = 11d"29"  else -- 9  E6  1
	--21x"3FF" when seconds = 11d"31"  else -- 10 2 D#6
	--21x"7FF"when seconds = 11d"33"  else -- 11 3 c#6
	--21x"FFF" when seconds = 11d"35"  else -- 12 4 c#6
	--21x"1FFF" when seconds = 11d"37"  else -- 13 E5  1 
	--21x"3FFF" when seconds = 11d"39"  else -- 14 2 C#6
	--21x"7FFF"  when seconds = 11d"41"  else --15 3 Stoped here
	--21x"FFFF"  when seconds = 11d"43"  else --15 3 Stoped here
	--21x"1FFFF"  when seconds = 11d"45"  else --15 3 Stoped here
	--21x"3FFFF"  when seconds = 11d"47"  else --15 3 Stoped here
	--21x"7FFFF"  when seconds = 11d"49"  else 
	--21x"0";              
tile_pressed<= 21d"13"  when seconds = 11d"13" else --E6 1 1
			   21d"15"  when seconds = 11d"15" else --D#6 2 
				21d"17"  when seconds = 11d"17" else --A5 3
				21d"19"  when seconds = 11d"19" else --C#5 4
				 21d"21" when seconds = 11d"21"else --E6 5    1
				 21d"23" when seconds = 11d"23"else -- 6 D#6
				 21d"25" when seconds = 11d"25"else -- 7 D#5
				 21d"27" when seconds = 11d"27"else -- 8  C#5
				 21d"29" when seconds = 11d"29"else -- 9  E6  1
				 21d"31" when seconds = 11d"31"else -- 10 2 D#6
			  	 21d"33" when seconds = 11d"33"  else -- 11 3 c#6
			  	 21d"35"  when seconds = 11d"35"  else -- 12 4 c#6
		   	    21d"37"    when seconds = 11d"37"  else -- 13 E5  1 
		   	    21d"39"    when seconds = 11d"39"  else -- 14 2 C#6
		   	    21d"41"    when seconds = 11d"41"  else --15 3 Stoped here
		   	    21d"43"    when seconds = 11d"43"  else --15 3 Stoped here
		   	    21d"45"    when seconds = 11d"45"  else --15 3 Stoped here
		   	    21d"47"    when seconds = 11d"47"  else --15 3 Stoped here
		   	    21d"49"    when seconds = 11d"49"  else 
				21d"51"   when seconds = 11d"51"   else
				21d"52"   when seconds = 11d"52"   else
				21d"53"   when seconds = 11d"53"   else
				21d"54"   when seconds = 11d"54"   else
				21d"56"   when seconds = 11d"56"   else
				21d"57"   when seconds = 11d"57"   else
				21d"58"   when seconds = 11d"58"   else
				21d"60"   when seconds = 11d"60"   else
				21d"61"   when seconds = 11d"61"   else
				21d"63"   when seconds = 11d"63"   else
				21d"65"   when seconds = 11d"65"   else
				21d"66"   when seconds = 11d"66"   else
				21d"67"   when seconds = 11d"67"   else
				21d"68"   when seconds = 11d"68"   else
				21d"71"   when seconds = 11d"71"   else
				21d"72"   when seconds = 11d"72"   else
				21d"73"   when seconds = 11d"73"   else
				21d"74"   when seconds = 11d"74"   else
				21d"76"   when seconds = 11d"76"   else
				21d"0";
--score <= 1 whe21d"73"21d"55"n seconds = 11d"13" and enableaudio_in_Audio = '1' else --E6 1 1
	--2 when sec21d"74"21d"56"onds = 11d"15" and enableaudio_in_Audio = '1' else --D#6 2 
	--3 when sec21d"76"onds = 11d"17" and enableaudio_in_Audio = '1' else --A5 3
	--4 when seconds = 11d"19" and enableaudio_in_Audio = '1' else --C#5 4
	--5 when seconds = 11d"21"  and enableaudio_in_Audio = '1' else --E6 5    1
	--6 when seconds = 11d"23"  and enableaudio_in_Audio = '1' else -- 6 D#6
	--7 when seconds = 11d"25"  and enableaudio_in_Audio = '1' else -- 7 D#5
	--8 when seconds = 11d"27"  and enableaudio_in_Audio = '1' else -- 8  C#5
	--9 when seconds = 11d"29"  and enableaudio_in_Audio = '1' else -- 9  E6  1
	--10 when seconds = 11d"31"  and enableaudio_in_Audio = '1' else -- 10 2 D#6
	--11 when seconds = 11d"33"  and enableaudio_in_Audio = '1' else -- 11 3 c#6
	--12 when seconds = 11d"35" and enableaudio_in_Audio = '1' else -- 12 4 c#6
	--13 when seconds = 11d"37"  and enableaudio_in_Audio = '1' else -- 13 E5  1 
	--14 when seconds = 11d"39"  and enableaudio_in_Audio = '1' else -- 14 2 C#6
	--15  when seconds = 11d"41" and enableaudio_in_Audio = '1'  else --15 3 Stoped here
	--16 when seconds = 11d"43"  and enableaudio_in_Audio = '1' else --15 3 Stoped here
	--17  when seconds = 11d"45" and enableaudio_in_Audio = '1'  else --15 3 Stoped here
	--18  when seconds = 11d"47" and enableaudio_in_Audio = '1'  else --15 3 Stoped here
	--19 when seconds = 11d"49"  and enableaudio_in_Audio = '1' else 
	--score;
limit <= 18d"19057" when tile_pressed = 21d"13" else --E6 1 1
	     18d"19057" when tile_pressed = 21d"15" else --E6 2 
	     18d"19057" when tile_pressed = 21d"17"else --E6 3
	     18d"38114" when tile_pressed = 21d"19"else --E5 4
	     18d"20190" when tile_pressed =  21d"21"  else --D#6 5    1
	     18d"20190" when tile_pressed =  21d"23" else -- 6 D#6
	     18d"20190" when tile_pressed =  21d"25" else -- 7 D#6
	     18d"40381" when tile_pressed =  21d"27"  else -- 8  D#5
	     18d"22663" when tile_pressed =  21d"29"  else -- 9 c#6  1
	     18d"22663" when tile_pressed =  21d"31"  else -- 10 2 c#6
	     18d"22663" when tile_pressed =  21d"33"  else -- 11 3 c#6
	     18d"45326" when tile_pressed =  21d"35"  else -- 12 4 c#5
	     18d"28553" when tile_pressed =  21d"37"  else -- 13 A4  1 
	     18d"28553" when tile_pressed =  21d"39"  else -- 14 2 A5
	     18d"30251" when tile_pressed =  21d"41"  else --15 G#6 
	     18d"19057" when tile_pressed =  21d"43" else --E6
	     18d"19057" when tile_pressed =  21d"45"  else --E6
	     18d"19057" when tile_pressed =  21d"47"  else --E6	
	     18d"38114" when tile_pressed =  21d"49"  else --E5
		 18d"28553" when tile_pressed =  21d"51"  else --A4
		 18d"28553" when tile_pressed =  21d"52"  else --A4
		 18d"38114" when tile_pressed =  21d"53"  else --E5 -- add another E5 to make it seem longer
		 18d"50882" when tile_pressed =  21d"54"  else --B
		 18d"60502" when tile_pressed =  21d"56"  else --G#5
		 18d"60502" when tile_pressed =  21d"57"  else --G#5
		 18d"38114" when tile_pressed =  21d"58"  else --E5 
		 18d"50882" when tile_pressed =  21d"60"  else --B
		 18d"60502" when tile_pressed =  21d"61"  else --G#5
		 18d"60502" when tile_pressed =  21d"63"  else --G#5
		 18d"60502" when tile_pressed =  21d"65"  else --G#5
		 18d"40381" when tile_pressed =  21d"66" else -- 7 D#6
		 18d"45326" when tile_pressed =  21d"67"  else -- 12 4 c#5
		 18d"40381" when tile_pressed =  21d"68" else -- 7 D#6 -- make longer
		 18d"30251" when tile_pressed =  21d"71"  else --15 G#6 
		 18d"35949" when tile_pressed =  21d"72"  else --15 f#6 
		 18d"35949" when tile_pressed =  21d"73"  else --15 f#6 
		 18d"35949" when tile_pressed =  21d"74"  else --15 f#6 
		 18d"38114" when tile_pressed =  21d"76"  else --E5
		 
	     18d"1";

process (clk)
begin
	if rising_edge(clk) then
		count <= count + 1;
		if tile_pressed = 21d"0" then 
			tone <= '0';
			
		else
			if (count < limit) and (enableaudio_in_Audio = '1') then
				tone <= '1';
			elsif (count < limit&"0") and (count > limit - 1) then
				tone <= '0';
			elsif (enableaudio_in_Audio = '0') then
				tone <= '0';
			else 
				count <= (others => '0');
			end if;
		end if;

	end if;
end process;


end;
