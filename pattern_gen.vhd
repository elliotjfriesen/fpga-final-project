library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pattern_gen is
  port(
	  HSYNC : in std_logic;
	  VSYNC : in std_logic;
	  row_count : in unsigned(9 downto 0);
	  col_count : in unsigned(9 downto 0);
	  rgb : out std_logic_vector(5 downto 0);
	  valid : in std_logic;
	  menu_rgb : in std_logic_vector(5 downto 0);
	  gameover_rgb : in std_logic_vector(5 downto 0);
	  tens_zero_rgb :in std_logic_vector(5 downto 0);
	  tens_one_rgb :in std_logic_vector(5 downto 0);
	  tens_two_rgb :in std_logic_vector(5 downto 0);
	  tens_three_rgb :in std_logic_vector(5 downto 0);
	  tens_four_rgb :in std_logic_vector(5 downto 0);
	  tens_five_rgb :in std_logic_vector(5 downto 0);
	  tens_six_rgb :in std_logic_vector(5 downto 0);
	  tens_seven_rgb :in std_logic_vector(5 downto 0);
	  tens_eight_rgb :in std_logic_vector(5 downto 0);
	  tens_nine_rgb :in std_logic_vector(5 downto 0);
	  
	  ones_zero_rgb :in std_logic_vector(5 downto 0);
	  ones_one_rgb :in std_logic_vector(5 downto 0);
	  ones_two_rgb :in std_logic_vector(5 downto 0);
	  ones_three_rgb :in std_logic_vector(5 downto 0);
	  ones_four_rgb :in std_logic_vector(5 downto 0);
	  ones_five_rgb :in std_logic_vector(5 downto 0);
	  ones_six_rgb :in std_logic_vector(5 downto 0);
	  ones_seven_rgb :in std_logic_vector(5 downto 0);
	  ones_eight_rgb :in std_logic_vector(5 downto 0);
	  ones_nine_rgb :in std_logic_vector(5 downto 0);
	  tile_1_1_y_location : in unsigned(9 downto 0);
	  tile_1_2_y_location : in unsigned(9 downto 0);
	  tile_1_3_y_location : in unsigned(9 downto 0);
	  tile_1_4_y_location : in unsigned(9 downto 0);
	  tile_2_1_y_location : in unsigned(9 downto 0);
	  tile_2_2_y_location : in unsigned(9 downto 0);
	  tile_2_3_y_location : in unsigned(9 downto 0);
	  tile_2_4_y_location : in unsigned(9 downto 0);
	  tile_3_1_y_location : in unsigned(9 downto 0);
	  tile_3_2_y_location : in unsigned(9 downto 0);
	  tile_3_3_y_location : in unsigned(9 downto 0);
	  tile_3_4_y_location : in unsigned(9 downto 0);
	  tile_4_1_y_location : in unsigned(9 downto 0);
	  tile_4_2_y_location : in unsigned(9 downto 0);
	  tile_4_3_y_location : in unsigned(9 downto 0);
	  tile_4_4_y_location : in unsigned(9 downto 0);
	  tile_1_1_color : in std_logic_vector(5 downto 0);
	  tile_1_2_color : in std_logic_vector(5 downto 0);
	  tile_1_3_color : in std_logic_vector(5 downto 0);
	  tile_1_4_color : in std_logic_vector(5 downto 0);
	  tile_2_1_color : in std_logic_vector(5 downto 0);
	  tile_2_2_color : in std_logic_vector(5 downto 0);
	  tile_2_3_color : in std_logic_vector(5 downto 0);
	  tile_2_4_color : in std_logic_vector(5 downto 0);
	  tile_3_1_color : in std_logic_vector(5 downto 0);
	  tile_3_2_color : in std_logic_vector(5 downto 0);
	  tile_3_3_color : in std_logic_vector(5 downto 0);
	  tile_3_4_color : in std_logic_vector(5 downto 0);
	  tile_4_1_color : in std_logic_vector(5 downto 0);
	  tile_4_2_color : in std_logic_vector(5 downto 0);
	  tile_4_3_color : in std_logic_vector(5 downto 0);
	  tile_4_4_color : in std_logic_vector(5 downto 0);
	  
	  game_state : in std_logic_vector(1 downto 0);
	  
	  score : in unsigned(6 downto 0)
	  
  );
end pattern_gen;

architecture synth of pattern_gen is
	signal tile_1_left_corner : unsigned(9 downto 0) := to_unsigned(0, 10);
	signal tile_2_left_corner : unsigned(9 downto 0) := to_unsigned(160, 10);
	signal tile_3_left_corner : unsigned(9 downto 0) := to_unsigned(320, 10);
	signal tile_4_left_corner : unsigned(9 downto 0) := to_unsigned(480, 10);
	signal tile_width : unsigned(9 downto 0) := to_unsigned(161, 10);
	signal tile_height : unsigned(9 downto 0) := to_unsigned(200, 10);
	signal piano_height : unsigned(9 downto 0) := to_unsigned(400, 10);
	signal digit1_bits, digit2_bits : unsigned(3 downto 0);
	

begin
   
	process (col_count, row_count) begin
		digit1_bits <= to_unsigned(to_integer(score) mod 10, 4);
	    digit2_bits <= to_unsigned(0, 4) when score <= 9 else
               to_unsigned(1, 4) when score <= 19 else
               to_unsigned(2, 4) when score <= 29 else
               to_unsigned(3, 4) when score <= 39 else
               to_unsigned(4, 4) when score <= 49 else
               to_unsigned(5, 4) when score <= 59 else
               to_unsigned(6, 4) when score <= 69 else
               to_unsigned(7, 4) when score <= 79 else
               to_unsigned(8, 4) when score <= 89 else
               to_unsigned(9, 4) when score <= 99 else
               to_unsigned(0, 4);

		
		if(valid = '1') then
		if(game_state = "00" or game_state = "01") then
			rgb <= menu_rgb;
		elsif(game_state = "11") then
		    if((col_count >= 400 and col_count <= 480) and (row_count >= 320 and row_count <= 400)) then
				if(digit2_bits = "0001") then
					rgb <= tens_one_rgb;
				elsif(digit2_bits = "0010") then
					rgb <= tens_two_rgb;
				elsif(digit2_bits = "0011") then
					rgb <= tens_three_rgb;
				elsif(digit2_bits = "0100") then
					rgb <= tens_four_rgb;
				elsif(digit2_bits = "0101") then
					rgb <= tens_five_rgb;
				elsif(digit2_bits = "0110") then
					rgb <= tens_six_rgb;
				elsif(digit2_bits = "0111") then
					rgb <= tens_seven_rgb;
				elsif(digit2_bits = "1000") then
					rgb <= tens_eight_rgb;
				elsif(digit2_bits = "1001") then
					rgb <= tens_nine_rgb;
				else
					rgb <= tens_zero_rgb;
				end if;
			elsif((col_count >= 520 and col_count <= 600) and (row_count >= 320 and row_count <= 400)) then
				if(digit1_bits = "0001") then
					rgb <= ones_one_rgb;
				elsif(digit1_bits = "0010") then
					rgb <= ones_two_rgb;
				elsif(digit1_bits = "0011") then
					rgb <= ones_three_rgb;
				elsif(digit1_bits = "0100") then
					rgb <= ones_four_rgb;
				elsif(digit1_bits = "0101") then
					rgb <= ones_five_rgb;
				elsif(digit1_bits = "0110") then
					rgb <= ones_six_rgb;
				elsif(digit1_bits = "0111") then
					rgb <= ones_seven_rgb;
				elsif(digit1_bits = "1000") then
					rgb <= ones_eight_rgb;
				elsif(digit1_bits = "1001") then
					rgb <= ones_nine_rgb;
				else
					rgb <= ones_zero_rgb;
				end if;
			else
				rgb <= gameover_rgb;
			end if;
		elsif(game_state = "10") then
		 if(((row_count > tile_1_1_y_location - tile_height or (tile_1_1_y_location - tile_height > tile_1_1_y_location)) and row_count < tile_1_1_y_location) and (col_count < tile_1_left_corner + tile_width and col_count > tile_1_left_corner + 3)) then
			rgb <= tile_1_1_color;
		 elsif(((row_count > tile_1_2_y_location - tile_height or (tile_1_2_y_location - tile_height > tile_1_2_y_location)) and row_count < tile_1_2_y_location) and (col_count < tile_1_left_corner + tile_width and col_count > tile_1_left_corner+ 3)) then
			rgb <= tile_1_2_color;
		elsif(((row_count > tile_1_3_y_location - tile_height or (tile_1_3_y_location - tile_height > tile_1_3_y_location)) and row_count < tile_1_3_y_location) and (col_count < tile_1_left_corner + tile_width and col_count > tile_1_left_corner+ 3)) then
			rgb <= tile_1_3_color;
		elsif(((row_count > tile_1_4_y_location - tile_height or (tile_1_4_y_location - tile_height > tile_1_4_y_location)) and row_count < tile_1_4_y_location) and (col_count < tile_1_left_corner + tile_width and col_count > tile_1_left_corner+ 3)) then
			rgb <= tile_1_4_color;
		elsif(((row_count > tile_2_1_y_location - tile_height or (tile_2_1_y_location - tile_height > tile_2_1_y_location)) and row_count < tile_2_1_y_location) and (col_count < tile_2_left_corner + tile_width and col_count > tile_2_left_corner+ 3)) then
			rgb <= tile_2_1_color;
		 elsif(((row_count > tile_2_2_y_location - tile_height or (tile_2_2_y_location - tile_height > tile_2_2_y_location)) and row_count < tile_2_2_y_location) and (col_count < tile_2_left_corner + tile_width and col_count > tile_2_left_corner+ 3)) then
			rgb <= tile_2_2_color;
		elsif(((row_count > tile_2_3_y_location - tile_height or (tile_2_3_y_location - tile_height > tile_2_3_y_location)) and row_count < tile_2_3_y_location) and (col_count < tile_2_left_corner + tile_width and col_count > tile_2_left_corner+ 3)) then
			rgb <= tile_2_3_color;
		elsif(((row_count > tile_2_4_y_location - tile_height or (tile_2_4_y_location - tile_height > tile_2_4_y_location)) and row_count < tile_2_4_y_location) and (col_count < tile_2_left_corner + tile_width and col_count > tile_2_left_corner+ 3)) then
			rgb <= tile_2_4_color;
		elsif(((row_count > tile_3_1_y_location - tile_height or (tile_3_1_y_location - tile_height > tile_3_1_y_location)) and row_count < tile_3_1_y_location) and (col_count < tile_3_left_corner + tile_width and col_count > tile_3_left_corner+ 3)) then
			rgb <= tile_3_1_color;
		 elsif(((row_count > tile_3_2_y_location - tile_height or (tile_3_2_y_location - tile_height > tile_3_2_y_location)) and row_count < tile_3_2_y_location) and (col_count < tile_3_left_corner + tile_width and col_count > tile_3_left_corner+ 3)) then
			rgb <= tile_3_2_color;
		elsif(((row_count > tile_3_3_y_location - tile_height or (tile_3_3_y_location - tile_height > tile_3_3_y_location)) and row_count < tile_3_3_y_location) and (col_count < tile_3_left_corner + tile_width and col_count > tile_3_left_corner+ 3)) then
			rgb <= tile_3_3_color;
		elsif(((row_count > tile_3_4_y_location - tile_height or (tile_3_4_y_location - tile_height > tile_3_4_y_location)) and row_count < tile_3_4_y_location) and (col_count < tile_3_left_corner + tile_width and col_count > tile_3_left_corner+ 3)) then
			rgb <= tile_3_4_color;
		elsif(((row_count > tile_4_1_y_location - tile_height or (tile_4_1_y_location - tile_height > tile_4_1_y_location)) and row_count < tile_4_1_y_location) and (col_count < tile_4_left_corner + tile_width and col_count > tile_4_left_corner+ 3)) then
			rgb <= tile_4_1_color;
		 elsif(((row_count > tile_4_2_y_location - tile_height or (tile_4_2_y_location - tile_height > tile_4_2_y_location)) and row_count < tile_4_2_y_location) and (col_count < tile_4_left_corner + tile_width and col_count > tile_4_left_corner+ 3)) then
			rgb <= tile_4_2_color;
		elsif(((row_count > tile_4_3_y_location - tile_height or (tile_4_3_y_location - tile_height > tile_4_3_y_location)) and row_count < tile_4_3_y_location) and (col_count < tile_4_left_corner + tile_width and col_count > tile_4_left_corner+ 3)) then
			rgb <= tile_4_3_color;
		elsif(((row_count > tile_4_4_y_location - tile_height or (tile_4_4_y_location - tile_height > tile_4_4_y_location)) and row_count < tile_4_4_y_location) and (col_count < tile_4_left_corner + tile_width and col_count > tile_4_left_corner+ 5)) then
			rgb <= tile_4_4_color;
		elsif(row_count > piano_height and row_count < piano_height + 10) then
			rgb <= "001100";
		else
		    rgb <= "000000";
		if(col_count > tile_1_left_corner and col_count < tile_1_left_corner + 5) then
			rgb <= "111111";
		end if;
		if(col_count > tile_2_left_corner and col_count < tile_2_left_corner + 5) then
			rgb <= "111111";
		end if;
		if(col_count > tile_3_left_corner and col_count < tile_3_left_corner + 5) then
			rgb <= "111111";
		end if;
		if(col_count > tile_4_left_corner and col_count < tile_4_left_corner + 5) then
			rgb <= "111111";
		end if;
		end if;
		
		end if;
		else
			rgb <= "000000";
		end if;
	end process;
end;