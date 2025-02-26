library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Audio4 is
	port(
		
		--enableaudio_in_Audio : in std_logic;
		seconds: in unsigned(10 downto 0);
		clk: in std_logic;
		tone4 : out std_logic
		);
end Audio4;

architecture synth of Audio4 is
--signal tile_pressed :  unsigned(20 downto 0);
signal count : unsigned(19 downto 0) := (others => '0');
signal limit : unsigned(19 downto 0) := (others => '0');

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
limit <= 20d"38114" when seconds > 11d"53" and seconds < 11d"55"  else --E4 1 1
	--20d"152457" when seconds = 11d"45"  else  --E3 2 
	--20d"152457" when seconds = 11d"47"  else  --E3 3
	--20d"304913" when seconds = 11d"49"  else  --E2 4
	20d"60502" when seconds > 11d"55" and seconds < 11d"58"  else  --D#4 5    1
	--20d"161523" when seconds = 11d"53"  else  -- 6 D#3
	--20d"161523" when seconds = 11d"55"  else  -- 7 D#3
	--20d"322898" when seconds = 11d"57"  else  -- 8  D#2
    20d"38114" when seconds > 11d"58" and seconds < 11d"61" else  -- 9 c#4  1
	--20d"181303" when seconds = 11d"61"  else  -- 10 2 c#6
	--20d"181303" when seconds = 11d"63"  else  -- 11 3 c#6
	--20d"362808" when seconds = 11d"65"  else  -- 12 4 c#5
	20d"60502" when seconds > 11d"61" and  seconds < 11d"65" else  -- 13 A3  1 
	--20d"228427" when seconds = 11d"69"  else  -- 14 2 A5
	--20d"121005" when seconds = 11d"71"  else  --15 G#6 
	20d"35949" when seconds > 11d"74" and seconds < 11d"75" else  --E6
	--20d"19057" when tile_pressed = 21x"1FFFF"  else --E6
	--20d"19057" when tile_pressed = 21x"3FFFF"  else --E6	
	--20d"38114" when tile_pressed = 21x"7FFFF"  else --E5

	20d"1";

process (clk)
begin
	if rising_edge(clk) then
		count <= count + 1;
		if limit = 20d"1" then 
			tone4 <= '0';
			
		else
			if (count < limit) then
				tone4 <= '1';
			elsif (count < limit&"0") and (count > limit - 1) then
				tone4 <= '0';
			else 
				count <= (others => '0');
			end if;
		end if;

	end if;
end process;


end;