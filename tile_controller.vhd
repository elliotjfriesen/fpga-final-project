library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.time_array_pkg.all;


entity tile_controller is
  port(
	  V_SYNC : in std_logic;
	  second_timer : in unsigned(10 downto 0);
	  tile_1_1_y_pos_out : out unsigned(9 downto 0);
      tile_1_2_y_pos_out : out unsigned(9 downto 0);
	  tile_1_3_y_pos_out : out unsigned(9 downto 0);
	  tile_1_4_y_pos_out : out unsigned(9 downto 0);
	  tile_2_1_y_pos_out : out unsigned(9 downto 0);
	  tile_2_2_y_pos_out : out unsigned(9 downto 0);
	  tile_2_3_y_pos_out : out unsigned(9 downto 0);
	  tile_2_4_y_pos_out : out unsigned(9 downto 0);
	  tile_3_1_y_pos_out : out unsigned(9 downto 0);
	  tile_3_2_y_pos_out : out unsigned(9 downto 0);
	  tile_3_3_y_pos_out : out unsigned(9 downto 0);
	  tile_3_4_y_pos_out : out unsigned(9 downto 0);
	  tile_4_1_y_pos_out : out unsigned(9 downto 0);
	  tile_4_2_y_pos_out : out unsigned(9 downto 0);
	  tile_4_3_y_pos_out : out unsigned(9 downto 0);
	  tile_4_4_y_pos_out : out unsigned(9 downto 0);
	  time_array_1 : in time_array(9 downto 0);
	  time_array_2 : in time_array(9 downto 0);
	  time_array_3 : in time_array(9 downto 0);
	  time_array_4 : in time_array(9 downto 0);
	  velocity : in unsigned(3 downto 0);
	  
	  game_state : in std_logic_vector(1 downto 0)
	  
	  
	  
	 -- tile_left_time : in unsigned(10 downto 0)
	 
  );
end tile_controller;

architecture synth of tile_controller is

	--output positions of each one and then send that into the top.vhd modules
signal tile_1_1_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal tile_1_2_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal tile_1_3_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal tile_1_4_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal tile_2_1_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal tile_2_2_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal tile_2_3_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal tile_2_4_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal tile_3_1_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal tile_3_2_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal tile_3_3_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal tile_3_4_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal tile_4_1_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal tile_4_2_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal tile_4_3_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal tile_4_4_y_pos : unsigned(9 downto 0) := to_unsigned(690, 10);
signal display_tile_1 : std_logic_vector(3 downto 0) := "0000";
signal display_tile_2 : std_logic_vector(3 downto 0) := "0000";
signal display_tile_3 : std_logic_vector(3 downto 0) := "0000";
signal display_tile_4 : std_logic_vector(3 downto 0) := "0000";
signal matched_time_1 : boolean := false;
signal prev_second_1 : unsigned(10 downto 0) := to_unsigned(0, 11);
signal matched_time_2 : boolean := false;
signal prev_second_2 : unsigned(10 downto 0) := to_unsigned(0, 11);
signal matched_time_3 : boolean := false;
signal prev_second_3 : unsigned(10 downto 0) := to_unsigned(0, 11);
signal matched_time_4 : boolean := false;
signal prev_second_4 : unsigned(10 downto 0) := to_unsigned(0, 11);


begin
	
	
	process (V_SYNC) begin
		
		if rising_edge(V_SYNC) then
            for i in time_array_1'range loop
                if second_timer = time_array_1(i) and time_array_1(i) /= to_unsigned(0, 11) and prev_second_1 /= second_timer then
                    matched_time_1 <= true;
					prev_second_1 <= second_timer;
                    exit; 
                end if;
            end loop;
        if matched_time_1 then
			if(display_tile_1(3) = '0') then
				tile_1_1_y_pos <= to_unsigned(0,10);
				display_tile_1(3) <= '1';
				matched_time_1 <= false;
			elsif(display_tile_1(2) = '0') then
				tile_1_2_y_pos <= to_unsigned(0,10);
				display_tile_1(2) <= '1';
				matched_time_1 <= false;
			elsif(display_tile_1(1) = '0') then
				tile_1_3_y_pos <= to_unsigned(0,10);
				display_tile_1(1) <= '1';
				matched_time_1 <= false;
			elsif(display_tile_1(0) = '0') then
				tile_1_4_y_pos <= to_unsigned(0,10);
				display_tile_1(0) <= '1';
				matched_time_1 <= false;
			end if;
         end if;
		 
            for i in time_array_2'range loop
                if second_timer = time_array_2(i) and time_array_2(i) /= to_unsigned(0, 11) and prev_second_2 /= second_timer then
                    matched_time_2 <= true;
					prev_second_2 <= second_timer;
                    exit; 
                end if;
            end loop;
        if matched_time_2 then
			if(display_tile_2(3) = '0') then
				tile_2_1_y_pos <= to_unsigned(0,10);
				display_tile_2(3) <= '1';
				matched_time_2 <= false;
			elsif(display_tile_2(2) = '0') then
				tile_2_2_y_pos <= to_unsigned(0,10);
				display_tile_2(2) <= '1';
				matched_time_2 <= false;
			elsif(display_tile_2(1) = '0') then
				tile_2_3_y_pos <= to_unsigned(0,10);
				display_tile_2(1) <= '1';
				matched_time_2 <= false;
			elsif(display_tile_2(0) = '0') then
				tile_2_4_y_pos <= to_unsigned(0,10);
				display_tile_2(0) <= '1';
				matched_time_2 <= false;
			end if;
         end if;
		 
		 
		 for i in time_array_3'range loop
                if second_timer = time_array_3(i) and time_array_3(i) /= to_unsigned(0, 11) and prev_second_3 /= second_timer then
                    matched_time_3 <= true;
					prev_second_3 <= second_timer;
                    exit; 
                end if;
            end loop;
        if matched_time_3 then
			if(display_tile_3(3) = '0') then
				tile_3_1_y_pos <= to_unsigned(0,10);
				display_tile_3(3) <= '1';
				matched_time_3 <= false;
			elsif(display_tile_3(2) = '0') then
				tile_3_2_y_pos <= to_unsigned(0,10);
				display_tile_3(2) <= '1';
				matched_time_3 <= false;
			elsif(display_tile_3(1) = '0') then
				tile_3_3_y_pos <= to_unsigned(0,10);
				display_tile_3(1) <= '1';
				matched_time_3 <= false;
			elsif(display_tile_3(0) = '0') then
				tile_3_4_y_pos <= to_unsigned(0,10);
				display_tile_3(0) <= '1';
				matched_time_3 <= false;
			end if;
         end if;
		
		 for i in time_array_4'range loop
                if second_timer = time_array_4(i) and time_array_4(i) /= to_unsigned(0, 11) and prev_second_4 /= second_timer then
                    matched_time_4 <= true;
					prev_second_4 <= second_timer;
                    exit; 
                end if;
            end loop;
        if matched_time_4 then
			if(display_tile_4(3) = '0') then
				tile_4_1_y_pos <= to_unsigned(0,10);
				display_tile_4(3) <= '1';
				matched_time_4 <= false;
			elsif(display_tile_4(2) = '0') then
				tile_4_2_y_pos <= to_unsigned(0,10);
				display_tile_4(2) <= '1';
				matched_time_4 <= false;
			elsif(display_tile_4(1) = '0') then
				tile_4_3_y_pos <= to_unsigned(0,10);
				display_tile_4(1) <= '1';
				matched_time_4 <= false;
			elsif(display_tile_4(0) = '0') then
				tile_4_4_y_pos <= to_unsigned(0,10);
				display_tile_4(0) <= '1';
				matched_time_4 <= false;
			end if;
         end if;
		
--			if(second_timer = to_unsigned(10,11) and display_tile_1(3) = '0') then -- if tile 1 of left column not displayed and 10 seconds have gone by
--		display_tile_1(3) <= '1';
--	elsif(second_timer = to_unsigned(13,11) and display_tile_1(2) = '0') then
--		tile_1_2_y_pos <= to_unsigned(0,10);
--		display_tile_1(2) <= '1';
--	elsif(second_timer = to_unsigned(16,11) and display_tile_1(1) = '0') then
--		tile_1_3_y_pos <= to_unsigned(0,10);
--		display_tile_1(1) <= '1';
--	elsif(second_timer = to_unsigned(19,11) and display_tile_1(0) = '0') then
--		tile_1_4_y_pos <= to_unsigned(0,10);
--		display_tile_1(0) <= '1';
--	end if;
--	if(second_timer = to_unsigned(11,11) and display_tile_2(3) = '0') then
--		display_tile_2(3) <= '1';
--	elsif(second_timer = to_unsigned(14,11) and display_tile_2(2) = '0') then
--		tile_2_2_y_pos <= to_unsigned(0,10);
--		display_tile_2(2) <= '1';
--	elsif(second_timer = to_unsigned(17,11) and display_tile_2(1) = '0') then
	--	tile_2_3_y_pos <= to_unsigned(0,10);
--		display_tile_2(1) <= '1';
--	elsif(second_timer = to_unsigned(20,11) and display_tile_2(0) = '0') then
--		tile_2_4_y_pos <= to_unsigned(0,10);
--		display_tile_2(0) <= '1';
	--end if;
--	if(second_timer = to_unsigned(12,11) and display_tile_3(3) = '0') then
	--	display_tile_3(3) <= '1';
--	elsif(second_timer = to_unsigned(18,11) and display_tile_3(2) = '0') then
--		tile_3_2_y_pos <= to_unsigned(0,10);
--		display_tile_3(2) <= '1';
--	elsif(second_timer = to_unsigned(20,11) and display_tile_3(1) = '0') then
--		tile_3_3_y_pos <= to_unsigned(0,10);
--		display_tile_3(1) <= '1';
--	elsif(second_timer = to_unsigned(25,11) and display_tile_3(0) = '0') then
--		tile_3_4_y_pos <= to_unsigned(0,10);
	--	display_tile_3(0) <= '1';
--	end if;
	
--	if(second_timer = to_unsigned(8,11) and display_tile_4(3) = '0') then
--		display_tile_4(3) <= '1';
--	elsif(second_timer = to_unsigned(11,11) and display_tile_4(2) = '0') then
--		tile_4_2_y_pos <= to_unsigned(0,10);
--		display_tile_4(2) <= '1';
--	elsif(second_timer = to_unsigned(16,11) and display_tile_4(1) = '0') then
--		tile_4_3_y_pos <= to_unsigned(0,10);
--		display_tile_4(1) <= '1';
--elsif(second_timer = to_unsigned(25,11) and display_tile_4(0) = '0') then
--	tile_4_4_y_pos <= to_unsigned(0,10);
--	display_tile_4(0) <= '1';
-- end if;

if (game_state = "10" ) then
	if(display_tile_1(3) = '1') then 
		tile_1_1_y_pos <= tile_1_1_y_pos + velocity;
		if(tile_1_1_y_pos >= 690) then
		display_tile_1(3) <= '0';
		end if;
end if;
	if(display_tile_1(2) = '1') then 
		tile_1_2_y_pos <= tile_1_2_y_pos  + velocity;
		if(tile_1_2_y_pos >= 690) then
		display_tile_1(2) <= '0';
		end if;
end if;
	if(display_tile_1(1) = '1') then 
	tile_1_3_y_pos <= tile_1_3_y_pos  + velocity;
	if(tile_1_3_y_pos >= 690) then
			display_tile_1(1) <= '0';
	end if;
end if;
if(display_tile_1(0) = '1') then 
	tile_1_4_y_pos <= tile_1_4_y_pos  + velocity;
		if(tile_1_4_y_pos >= 690) then
		display_tile_1(0) <= '0';
	end if;
	end if;
	
if(display_tile_2(3) = '1') then 
	tile_2_1_y_pos <= tile_2_1_y_pos + velocity;
	if(tile_2_1_y_pos >= 690) then
		display_tile_2(3) <= '0';
		end if;
	end if;
	if(display_tile_2(2) = '1') then 
		tile_2_2_y_pos <= tile_2_2_y_pos + velocity;
		if(tile_2_2_y_pos >= 690) then
			display_tile_2(2) <= '0';
		end if;
	end if;
	if(display_tile_2(1) = '1') then 
		tile_2_3_y_pos <= tile_2_3_y_pos + velocity;
		if(tile_2_3_y_pos >= 690) then
			display_tile_2(1) <= '0';
		end if;
	end if;
	if(display_tile_2(0) = '1') then 
		tile_2_4_y_pos <= tile_2_4_y_pos  + velocity;
		if(tile_2_4_y_pos >= 690) then
			display_tile_2(0) <= '0';
		end if;
	end if;
	if(display_tile_3(3) = '1') then 
		tile_3_1_y_pos <= tile_3_1_y_pos + velocity;
		if(tile_3_1_y_pos >= 690) then
			display_tile_3(3) <= '0';
		end if;
	end if;
	if(display_tile_3(2) = '1') then 
		tile_3_2_y_pos <= tile_3_2_y_pos + velocity;
		if(tile_3_2_y_pos >= 690) then
			display_tile_3(2) <= '0';
		end if;
	end if;
	if(display_tile_3(1) = '1') then 
		tile_3_3_y_pos <= tile_3_3_y_pos + velocity;
		if(tile_3_3_y_pos >= 690) then
			display_tile_3(1) <= '0';
		end if;
	end if;
	if(display_tile_3(0) = '1') then 
		tile_3_4_y_pos <= tile_3_4_y_pos + velocity;
		if(tile_3_4_y_pos >= 690) then
			display_tile_3(0) <= '0';
		end if;
	end if;
	
	if(display_tile_4(3) = '1') then 
		tile_4_1_y_pos <= tile_4_1_y_pos + velocity;
		if(tile_4_1_y_pos >= 690) then
			display_tile_4(3) <= '0';
		end if;
	end if;
	if(display_tile_4(2) = '1') then 
		tile_4_2_y_pos <= tile_4_2_y_pos + velocity;
		if(tile_4_2_y_pos >= 690) then
			display_tile_4(2) <= '0';
		end if;
	end if;
	if(display_tile_2(1) = '1') then 
		tile_4_3_y_pos <= tile_4_3_y_pos + velocity;
		if(tile_4_3_y_pos >= 690) then
			display_tile_4(1) <= '0';
		end if;
	end if;
	if(display_tile_4(0) = '1') then 
		tile_4_4_y_pos <= tile_4_4_y_pos + velocity;
		if(tile_4_4_y_pos >= 690) then
			display_tile_4(0) <= '0';
		end if;
	end if;
	else
		tile_1_1_y_pos <= to_unsigned(690, 10);
		tile_1_2_y_pos <= to_unsigned(690, 10);
		tile_1_3_y_pos <= to_unsigned(690, 10);
		tile_1_4_y_pos <= to_unsigned(690, 10);
		tile_2_1_y_pos <= to_unsigned(690, 10);
		tile_2_2_y_pos <= to_unsigned(690, 10);
		tile_2_3_y_pos <= to_unsigned(690, 10);
		tile_2_4_y_pos <= to_unsigned(690, 10);
		tile_3_1_y_pos <= to_unsigned(690, 10);
		tile_3_2_y_pos <= to_unsigned(690, 10);
		tile_3_3_y_pos <= to_unsigned(690, 10);
		tile_3_4_y_pos <= to_unsigned(690, 10);
		tile_4_1_y_pos <= to_unsigned(690, 10);
		tile_4_2_y_pos <= to_unsigned(690, 10);
		tile_4_3_y_pos <= to_unsigned(690, 10);
		tile_4_4_y_pos <= to_unsigned(690, 10);
		matched_time_1 <= false;
prev_second_1 <= to_unsigned(0, 11);
matched_time_2 <= false;
 prev_second_2 <= to_unsigned(0, 11);
matched_time_3 <= false;
prev_second_3 <= to_unsigned(0, 11);
 matched_time_4 <= false;
prev_second_4 <= to_unsigned(0, 11);
display_tile_1<= "0000";
 display_tile_2 <= "0000";
display_tile_3 <= "0000";
display_tile_4 <=  "0000";
	 end if;
end if;
	end process;
	
	  tile_1_1_y_pos_out <= tile_1_1_y_pos;
      tile_1_2_y_pos_out <= tile_1_2_y_pos;
	  tile_1_3_y_pos_out <= tile_1_3_y_pos;
	  tile_1_4_y_pos_out <= tile_1_4_y_pos;
	  tile_2_1_y_pos_out <= tile_2_1_y_pos;
	  tile_2_2_y_pos_out <= tile_2_2_y_pos;
	  tile_2_3_y_pos_out <= tile_2_3_y_pos;
	  tile_2_4_y_pos_out <= tile_2_4_y_pos;
	  tile_3_1_y_pos_out <= tile_3_1_y_pos;
	  tile_3_2_y_pos_out <= tile_3_2_y_pos;
	  tile_3_3_y_pos_out <= tile_3_3_y_pos;
	  tile_3_4_y_pos_out <= tile_3_4_y_pos;
	  tile_4_1_y_pos_out <= tile_4_1_y_pos;
	  tile_4_2_y_pos_out <= tile_4_2_y_pos;
	  tile_4_3_y_pos_out <= tile_4_3_y_pos;
	  tile_4_4_y_pos_out <= tile_4_4_y_pos;
	
end;