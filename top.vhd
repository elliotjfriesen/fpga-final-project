library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.time_array_pkg.all;
entity top is
	port(
	data: in std_logic;
	clock : in std_logic;
	output_clock : out std_logic;
	rgb_out : out std_logic_vector(5 downto 0);
	HSYNC_out : out std_logic;
	VSYNC_out : out std_logic;
	graphic_clock : out std_logic;
	latch : out std_logic;
	 tone : out std_logic;
	 tone2 : out std_logic;
	 tone3 : out std_logic;
	 tone4 : out std_logic;
	 tone5 : out std_logic;
	 nes_clk_out : out std_logic
	--a : out std_logic
	
	);
end top;

architecture synth of top is
component mypll is
    port(
        ref_clk_i: in std_logic;
        rst_n_i: in std_logic;
        outcore_o: out std_logic;
        outglobal_o: out std_logic
    );
end component;

component rom is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;
component gameover is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;


--component nes_in is 
	--port (  clk_in : in std_logic ; 
			--nes_clk: out std_logic; 
			--nes_count: out unsigned(7 downto 0)
			--);
	--end component nes_in ;
	--component nes_cntrl is 
	--port (
	    --clk_full: in std_logic; 
	    --data : in std_logic;
		--data_out : out std_logic_vector(7 downto 0);
		--nes_clk: in std_logic ;
		 --nes_count: in unsigned(7 downto 0);
		--latch : out std_logic;
		--nes_clk_out : out std_logic
		--a_p : out std_logic;
		--b_p : out std_logic;
		--up_p : out std_logic;
		--down_p : out std_logic;
		--start_p : out std_logic;
		--left_p : out std_logic;
		--right_p : out std_logic;
		--select_p : out std_logic
		--);
	--end component nes_cntrl;
--component buttons is 
    --port (
	--clk: in std_logic;
	--vsync : in std_logic;
	--leftbutton: in std_logic; 
	--rightbutton : in std_logic;
	--resetbutton: in std_logic;
	--a_button: in std_logic;
	--b_button: in std_logic;
	--up_button : in std_logic;
	--down_button : in std_logic;
	--command: out unsigned(3 downto 0)
	--);	
--end component;

component nes_in is 
	port (
			nes_clk: out std_logic; 
			nes_count: out unsigned(7 downto 0)
			);
	end component; 
	
component nes_control is 
port (  data : in std_logic;
		latch : out std_logic;
		clk_cntlr : out std_logic;
		data_out : out std_logic_vector(7 downto 0);
		nes_clk: in std_logic; 
		nes_count: in unsigned(7 downto 0)
		);
end component; 


component second_clock is
  port(
	  nes_b: in std_logic;
	  V_SYNC : in std_logic;
	  seconds : out unsigned(10 downto 0)
  );
end component;
component vga is
  port(
	  clock : in std_logic;
	  HSYNC : out std_logic;
	  VSYNC : out std_logic;
	  row_count : out unsigned(9 downto 0);
	  col_count : out unsigned(9 downto 0);
	  valid : out std_logic
  );
end component;
component tens_zero is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component tens_one is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component tens_two is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component tens_three is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component tens_four is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component tens_five is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component tens_six is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component tens_seven is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component tens_eight is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component tens_nine is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;


component ones_zero is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component ones_one is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component ones_two is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component ones_three is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component ones_four is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component ones_five is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component ones_six is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component ones_seven is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component ones_eight is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;

component ones_nine is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end component;



component pattern_gen is
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
end component;

component tile_controller is
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
  );
end component;
component Audio is
	port(
		enableaudio_in_Audio : in std_logic;
		seconds: in unsigned(10 downto 0);
		clk: in std_logic;
		tone : out std_logic
		);
end component;

component Audio2 is
	port(
		seconds: in unsigned(10 downto 0);
		clk: in std_logic;
		tone2 : out std_logic
		);
end component;

component Audio3 is
	port(
		seconds: in unsigned(10 downto 0);
		clk: in std_logic;
		tone3 : out std_logic
		);
end component;
component Audio4 is
	port(
		seconds: in unsigned(10 downto 0);
		clk: in std_logic;
		tone4 : out std_logic
		);
end component;

component Audio5 is
	port(
		seconds: in unsigned(10 downto 0);
		clk: in std_logic;
		tone5 : out std_logic
		);
end component;

signal latch_signal : std_logic;
signal nes_clk_signal : std_logic; 
signal nes_count_signal : unsigned(7 downto 0);
signal nes_clock_out_signal : std_logic;
signal gameover_rgb : std_logic_vector(5 downto 0);
signal pattern_gen_rgb : std_logic_vector(5 downto 0);

signal menu_rgb : std_logic_vector(5 downto 0);

signal tens_zero_rgb : std_logic_vector(5 downto 0);
signal tens_one_rgb : std_logic_vector(5 downto 0);
signal tens_two_rgb : std_logic_vector(5 downto 0);
signal tens_three_rgb : std_logic_vector(5 downto 0);
signal tens_four_rgb : std_logic_vector(5 downto 0);
signal tens_five_rgb : std_logic_vector(5 downto 0);
signal tens_six_rgb : std_logic_vector(5 downto 0);
signal tens_seven_rgb : std_logic_vector(5 downto 0);
signal tens_eight_rgb : std_logic_vector(5 downto 0);
signal tens_nine_rgb : std_logic_vector(5 downto 0);


signal score : unsigned(6 downto 0) := "0000000";
signal ones_zero_rgb : std_logic_vector(5 downto 0);
signal ones_one_rgb : std_logic_vector(5 downto 0);
signal ones_two_rgb : std_logic_vector(5 downto 0);
signal ones_three_rgb : std_logic_vector(5 downto 0);
signal ones_four_rgb : std_logic_vector(5 downto 0);
signal ones_five_rgb : std_logic_vector(5 downto 0);
signal ones_six_rgb : std_logic_vector(5 downto 0);
signal ones_seven_rgb : std_logic_vector(5 downto 0);
signal ones_eight_rgb : std_logic_vector(5 downto 0);
signal ones_nine_rgb : std_logic_vector(5 downto 0);



signal tile_1_1_color : std_logic_vector(5 downto 0) := "100111";
signal tile_1_2_color : std_logic_vector(5 downto 0) := "100111";
signal tile_1_3_color : std_logic_vector(5 downto 0) := "100111";
signal tile_1_4_color : std_logic_vector(5 downto 0) := "100111";
signal tile_2_1_color : std_logic_vector(5 downto 0) := "100111";
signal tile_2_2_color : std_logic_vector(5 downto 0) := "100111";
signal tile_2_3_color : std_logic_vector(5 downto 0) := "100111";
signal tile_2_4_color : std_logic_vector(5 downto 0) := "100111";
signal tile_3_1_color : std_logic_vector(5 downto 0) := "100111";
signal tile_3_2_color : std_logic_vector(5 downto 0) := "100111";
signal tile_3_3_color : std_logic_vector(5 downto 0) := "100111";
signal tile_3_4_color : std_logic_vector(5 downto 0) := "100111";
signal tile_4_1_color : std_logic_vector(5 downto 0) := "100111";
signal tile_4_2_color : std_logic_vector(5 downto 0) := "100111";
signal tile_4_3_color : std_logic_vector(5 downto 0) := "100111";
signal tile_4_4_color : std_logic_vector(5 downto 0) := "100111";
signal clock_reset : std_logic := '1';
signal internal_clock : std_logic;
signal valid_signal : std_logic;
signal row_count_signal : unsigned(9 downto 0);
signal col_count_signal : unsigned(9 downto 0);
signal HSYNC_signal : std_logic;
signal VSYNC_signal : std_logic;
signal x_pos : unsigned(9 downto 0); --:= 10b"0";
signal draw_1 : std_logic := '0';
signal tile_1_1_y_pos : unsigned(9 downto 0);
signal tile_1_2_y_pos : unsigned(9 downto 0);
signal tile_1_3_y_pos : unsigned(9 downto 0);
signal tile_1_4_y_pos : unsigned(9 downto 0);
signal tile_2_1_y_pos : unsigned(9 downto 0);
signal tile_2_2_y_pos : unsigned(9 downto 0);
signal tile_2_3_y_pos : unsigned(9 downto 0);
signal tile_2_4_y_pos : unsigned(9 downto 0);
signal tile_3_1_y_pos : unsigned(9 downto 0);
signal tile_3_2_y_pos : unsigned(9 downto 0);
signal tile_3_3_y_pos : unsigned(9 downto 0);
signal tile_3_4_y_pos : unsigned(9 downto 0);
signal tile_4_1_y_pos : unsigned(9 downto 0);
signal tile_4_2_y_pos : unsigned(9 downto 0);
signal tile_4_3_y_pos : unsigned(9 downto 0);
signal tile_4_4_y_pos : unsigned(9 downto 0);
signal counter : unsigned(27 downto 0);-- := 26b"0";
signal counter_master : unsigned(5 downto 0) := to_unsigned(0, 6);
signal second_timer : unsigned(10 downto 0) := to_unsigned(0, 11);
signal drawn_tiles : unsigned(9 downto 0) := to_unsigned(0, 10);
signal display_tile_1 : std_logic_vector(3 downto 0) := "0000";
signal display_tile_2 : std_logic_vector(3 downto 0) := "0000";
signal display_tile_3 : std_logic_vector(3 downto 0) := "0000";
signal display_tile_4 : std_logic_vector(3 downto 0) := "0000";
signal time_array_1_input : time_array(9 downto 0);
signal time_array_2_input : time_array(9 downto 0);
signal time_array_3_input : time_array(9 downto 0);
signal time_array_4_input : time_array(9 downto 0);
--signal latch_signal : std_logic;
signal curr_velocity : unsigned(3 downto 0) := "0100";
--signal nes_clk: std_logic; 
--signal nes_count:  unsigned(7 downto 0);
--signal 	clk_cntlr: std_logic;
signal	data_out : std_logic_vector(7 downto 0);
--signal	A_p :  std_logic;
--signal B_p : std_logic;
--signal up_p :  std_logic;
--signal	down_p :  std_logic;
--signal	start_p :  std_logic;
--signal	left_p :  std_logic;
--signal	right_p :  std_logic;
--signal select_p : std_logic;
signal tiles_pressed: unsigned(15 downto 0) := 16x"0"; 
signal tile_1_1_pressed: std_logic := '0';
signal tile_1_2_pressed: std_logic := '0';
signal tile_1_3_pressed: std_logic := '0';
signal tile_1_4_pressed: std_logic := '0';
signal tile_2_1_pressed: std_logic := '0';
signal tile_2_2_pressed: std_logic := '0';
signal tile_2_3_pressed: std_logic := '0';
signal tile_2_4_pressed: std_logic := '0';
signal tile_3_1_pressed: std_logic := '0';
signal tile_3_2_pressed: std_logic := '0';
signal tile_3_3_pressed: std_logic := '0';
signal tile_3_4_pressed: std_logic := '0';
signal tile_4_1_pressed: std_logic := '0';
signal tile_4_2_pressed: std_logic := '0';
signal tile_4_3_pressed: std_logic := '0';
signal tile_4_4_pressed: std_logic := '0';
signal stop : std_logic := '0';
signal game_delay : std_logic := '0';
signal stop_1 : std_logic := '0';
signal game_delay_timer : unsigned(5 downto 0) := to_unsigned(0, 6);
signal change_to_stop : std_logic;
signal change_to_stop1 : std_logic;
signal change_to_play : std_logic;
signal change_to_play1 : std_logic;
signal change_to_begin : std_logic;

signal keep_playing :std_logic;
signal keep_playing1 : std_logic;
signal curr_state : std_logic_vector(1 downto 0) := "00";

type Tstate is (menu, playing, game_over);
signal state : Tstate := menu;
signal mispress_flag : std_logic := '0';
signal start_flag : std_logic := '0';
signal tile_past_flag : std_logic := '0';
signal o_pressed : std_logic := '0';
signal enableaudio_in_Audio : std_logic := '0';
--TYPE Tstate IS (stopped, idle, play);
--SIGNAL state : Tstate := stopped;
--constant LEFT_CMD: integer := 1;
--constant RIGHT_CMD: integer := 2;
--constant UP_CMD: integer := 3;
--constant DOWN_CMD: integer := 4;
--constant A_CMD: integer :=5;
--constant B_CMD: integer :=6;
--constant START_CMD: integer :=7;
--constant SELECT_CMD: integer :=8;
--constant STANDBY_CMD: integer := 9;
--signal can_start : std_logic := '0';
--signal cmd: unsigned(3 downto 0);
begin


time_array_1_input(0) <= to_unsigned(10, 11); --1
time_array_1_input(1) <= to_unsigned(22, 11);--7
time_array_1_input(2) <= to_unsigned(34, 11); --13
time_array_1_input(3) <= to_unsigned(46, 11); --19 G#
time_array_1_input(4) <= to_unsigned(50, 11); --E
time_array_1_input(5) <= to_unsigned(54, 11); --G#
time_array_1_input(6) <= to_unsigned(56, 11); --E
time_array_1_input(7) <= to_unsigned(63, 11); --G#
time_array_1_input(8) <= to_unsigned(65, 11); --G#
time_array_1_input(9) <= to_unsigned(74, 11);

time_array_2_input(0) <= to_unsigned(12, 11); --2
time_array_2_input(1) <= to_unsigned(20, 11); --6
time_array_2_input(2) <= to_unsigned(24, 11); --8
time_array_2_input(3) <= to_unsigned(32, 11); --12
time_array_2_input(4) <= to_unsigned(36, 11); --14
time_array_2_input(5) <= to_unsigned(44, 11); --18
time_array_2_input(6) <= to_unsigned(51, 11); --B
time_array_2_input(7) <= to_unsigned(69, 11); --B
time_array_2_input(8) <= to_unsigned(71, 11);

time_array_3_input(0) <= to_unsigned(14, 11); --3
time_array_3_input(1) <= to_unsigned(18, 11); --5
time_array_3_input(2) <= to_unsigned(26, 11); --9
time_array_3_input(3) <= to_unsigned(30, 11); --11
time_array_3_input(4) <= to_unsigned(38, 11);  --15
time_array_3_input(5) <= to_unsigned(42, 11); --17
time_array_3_input(6) <= to_unsigned(48, 11); --g#
time_array_3_input(7) <= to_unsigned(58, 11); --B
time_array_3_input(8) <= to_unsigned(66, 11);


time_array_4_input(0) <= to_unsigned(16, 11); --4
time_array_4_input(1) <= to_unsigned(28, 11); --10
time_array_4_input(2) <= to_unsigned(40, 11); --16
time_array_4_input(3) <= to_unsigned(49, 11); --G#
time_array_4_input(5) <= to_unsigned(55, 11); --G#
time_array_4_input(4) <= to_unsigned(59, 11); --G#
time_array_4_input(6) <= to_unsigned(61, 11); --G#
time_array_4_input(7) <= to_unsigned(64, 11); --G#
time_array_4_input(8) <= to_unsigned(70, 11); --G#
time_array_4_input(9) <= to_unsigned(72, 11);


my_pll : mypll port map(ref_clk_i => clock, rst_n_i => clock_reset, outcore_o => output_clock, outglobal_o => internal_clock);

my_vga : vga port map(clock => internal_clock,
	  HSYNC => HSYNC_signal,
	  VSYNC => VSYNC_signal,
	  row_count => row_count_signal,
	  col_count => col_count_signal,
	  valid => valid_signal
);


my_rom : rom 
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => menu_rgb
  );
  
  my_gameover : gameover
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => gameover_rgb
  );
  
  

--my_nes_in :  nes_in port map ( clk_in => internal_clock, 
								--nes_clk =>  nes_clk,
								--nes_count => nes_count);
--my_nes_cntrl : nes_cntrl port map(
		--clk_full => internal_clock,
	    --data =>  data ,
		--data_out => data_out ,
		 --nes_count => nes_count,
		--latch => latch,
		--nes_clk => nes_clk,
		--nes_clk_out => nes_clk_out
		--A_p => A_p ,
		--B_p => B_p ,
		--up_p => up_p,
		--down_p => down_p,
		--start_p => start_p,
		--left_p => left_p,
		--right_p => right_p,
		--select_p => select_p
		--);
--my_buttons :buttons port map (
		--clk => nes_clk ,
		--vsync => vsync_signal,
	--leftbutton => left_p,
	--rightbutton => right_p,
	--resetbutton => start_p, 
	--a_button => A_p,
	--b_button => B_p,
	--up_button => up_p,
	--down_button => down_p,
	--command => cmd);
				
 my_tile_controller : tile_controller port map(
	  V_SYNC => VSYNC_signal,
	  second_timer => second_timer,
	  tile_1_1_y_pos_out => tile_1_1_y_pos,
	  tile_1_2_y_pos_out => tile_1_2_y_pos,
	  tile_1_3_y_pos_out => tile_1_3_y_pos,
	  tile_1_4_y_pos_out => tile_1_4_y_pos,
	  tile_2_1_y_pos_out => tile_2_1_y_pos,
	  tile_2_2_y_pos_out => tile_2_2_y_pos,
	  tile_2_3_y_pos_out => tile_2_3_y_pos,
	  tile_2_4_y_pos_out => tile_2_4_y_pos,
	  tile_3_1_y_pos_out => tile_3_1_y_pos,
	  tile_3_2_y_pos_out => tile_3_2_y_pos,
	  tile_3_3_y_pos_out => tile_3_3_y_pos,
	  tile_3_4_y_pos_out => tile_3_4_y_pos,
	  tile_4_1_y_pos_out => tile_4_1_y_pos,
	  tile_4_2_y_pos_out => tile_4_2_y_pos,
	  tile_4_3_y_pos_out => tile_4_3_y_pos,
	  tile_4_4_y_pos_out => tile_4_4_y_pos,
	  time_array_1 => time_array_1_input,
	  time_array_2 => time_array_2_input,
	  time_array_3 => time_array_3_input,
	  time_array_4 => time_array_4_input,
	  velocity => curr_velocity,
	  game_state => curr_state
  );
my_pattern_gen : pattern_gen port map(
	  HSYNC => HSYNC_signal,
	  VSYNC => VSYNC_signal,
	  row_count => row_count_signal,
	  col_count => col_count_signal,
	  rgb => rgb_out,
	  menu_rgb => menu_rgb,
	  gameover_rgb => gameover_rgb,
	  tens_zero_rgb =>  tens_zero_rgb,
	  tens_one_rgb =>  tens_one_rgb,
	  tens_two_rgb =>  tens_two_rgb,
	  tens_three_rgb =>  tens_three_rgb,
	  tens_four_rgb =>  tens_four_rgb,
	  tens_five_rgb =>  tens_five_rgb,
	  tens_six_rgb =>  tens_six_rgb,
	  tens_seven_rgb =>  tens_seven_rgb,
	  tens_eight_rgb =>  tens_eight_rgb,
	  tens_nine_rgb =>  tens_nine_rgb,
	
	  ones_zero_rgb =>  ones_zero_rgb,
	  ones_one_rgb =>  ones_one_rgb,
	  ones_two_rgb =>  ones_two_rgb,
	  ones_three_rgb =>  ones_three_rgb,
	  ones_four_rgb =>  ones_four_rgb,
	  ones_five_rgb =>  ones_five_rgb,
	  ones_six_rgb =>  ones_six_rgb,
	  ones_seven_rgb =>  ones_seven_rgb,
	  ones_eight_rgb =>  ones_eight_rgb,
	  ones_nine_rgb =>  ones_nine_rgb,
	  valid => valid_signal,
	  tile_1_1_y_location => tile_1_1_y_pos,
	  tile_1_2_y_location => tile_1_2_y_pos,
	  tile_1_3_y_location => tile_1_3_y_pos,
	  tile_1_4_y_location => tile_1_4_y_pos,
	  tile_2_1_y_location => tile_2_1_y_pos,
	  tile_2_2_y_location => tile_2_2_y_pos,
	  tile_2_3_y_location => tile_2_3_y_pos,
	  tile_2_4_y_location => tile_2_4_y_pos,
	  tile_3_1_y_location => tile_3_1_y_pos,
	  tile_3_2_y_location => tile_3_2_y_pos,
	  tile_3_3_y_location => tile_3_3_y_pos,
	  tile_3_4_y_location => tile_3_4_y_pos,
	  tile_4_1_y_location => tile_4_1_y_pos,
	  tile_4_2_y_location => tile_4_2_y_pos,
	  tile_4_3_y_location => tile_4_3_y_pos,
	  tile_4_4_y_location => tile_4_4_y_pos,
	  tile_1_1_color => tile_1_1_color,
	  tile_1_2_color => tile_1_2_color,
	  tile_1_3_color => tile_1_3_color,
	  tile_1_4_color => tile_1_4_color,
	  tile_2_1_color => tile_2_1_color,
	  tile_2_2_color => tile_2_2_color,
	  tile_2_3_color => tile_2_3_color,
	  tile_2_4_color => tile_2_4_color,
	  tile_3_1_color => tile_3_1_color,
	  tile_3_2_color => tile_3_2_color,
	  tile_3_3_color => tile_3_3_color,
	  tile_3_4_color => tile_3_4_color,
	  tile_4_1_color => tile_4_1_color,
	  tile_4_2_color => tile_4_2_color,
	  tile_4_3_color => tile_4_3_color,
	  tile_4_4_color => tile_4_4_color,
	  game_state => curr_state,
	  
	  score => score
	  
  );
  
  my_tens_zero : tens_zero
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => tens_zero_rgb
  );
  
  my_tens_one : tens_one
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => tens_one_rgb
  );
  
  my_tens_two : tens_two
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => tens_two_rgb
  );
  
  my_tens_three : tens_three
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => tens_three_rgb
  );
  
  my_tens_four : tens_four
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => tens_four_rgb
  );
  
  my_tens_five : tens_five
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => tens_five_rgb
  );
  
  my_tens_six : tens_six
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => tens_six_rgb
  );
  
  my_tens_seven : tens_seven
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => tens_seven_rgb
  );
  
  my_tens_eight : tens_eight
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => tens_eight_rgb
  );
  
  my_nine_zero : tens_nine
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => tens_nine_rgb
  );
  
  
  
my_ones_zero : ones_zero
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => ones_zero_rgb
  );
  
  my_ones_one : ones_one
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => ones_one_rgb
  );
  
  my_ones_two : ones_two
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => ones_two_rgb
  );
  
  my_ones_three : ones_three
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => ones_three_rgb
  );
  
  my_ones_four : ones_four
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => ones_four_rgb
  );
  
  my_ones_five : ones_five
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => ones_five_rgb
  );
  
  my_ones_six : ones_six
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => ones_six_rgb
  );
  
  my_ones_seven : ones_seven
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => ones_seven_rgb
  );
  
  my_ones_eight : ones_eight
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => ones_eight_rgb
  );
  
  my_ones_nine : ones_nine
  port map(
	  clock => internal_clock,
	  row_count => row_count_signal(8 downto 3),
	  col_count => col_count_signal(9 downto 3),
	  rgb => ones_nine_rgb
  );



  my_second_clock : second_clock port map(
   nes_b => game_delay,
   V_SYNC => VSYNC_signal,
   seconds => second_timer
);

my_nes_in : nes_in port map (
			nes_clk => nes_clk_signal,
			nes_count => nes_count_signal
);
 
	
my_nes_control : nes_control port map (  
		data => data,
		latch => latch_signal,
		clk_cntlr => nes_clock_out_signal,
		data_out => data_out,
		nes_clk => nes_clk_signal,
		nes_count => nes_count_signal
		);
my_pianoA:  Audio port map(
		enableaudio_in_Audio => enableaudio_in_Audio  ,
		seconds => second_timer,
		clk => internal_clock,
		tone => tone
		);
my_pianoA2:  Audio2 port map(
		seconds => second_timer,
		clk => internal_clock,
		tone2 => tone2
		);
my_pianoA3:  Audio3 port map(
		seconds => second_timer,
		clk => internal_clock,
		tone3 => tone3
		);
		
my_pianoA4:  Audio4 port map(
		seconds => second_timer,
		clk => internal_clock,
		tone4 => tone4
		);
my_pianoA5:  Audio5 port map(
		seconds => second_timer,
		clk => internal_clock,
		tone5 => tone5
		);
   nes_clk_out <= nes_clock_out_signal;
   latch <= latch_signal;
  -- a <= data_out(1);
  
	
process(VSYNC_signal) begin
	if(rising_edge(VSYNC_SIGNAL)) then

	if (curr_state = "00") then
		state <= menu;
		score <= "0000000";
		curr_state <= "01";
		tile_1_1_color <= "100111";
		tile_1_2_color <= "100111";
		tile_1_3_color <= "100111";
		tile_1_4_color <= "100111";
		
		tile_2_1_color <= "100111";
		tile_2_2_color <= "100111";
		tile_2_3_color <= "100111";
		tile_2_4_color <= "100111";
		
		tile_3_1_color <= "100111";
		tile_3_2_color <= "100111";
		tile_3_3_color <= "100111";
		tile_3_4_color <= "100111";
		
		tile_4_1_color <= "100111";
		tile_4_2_color <= "100111";
		tile_4_3_color <= "100111";
		tile_4_4_color <= "100111";
		--mispress_flag <= '0';
	    --start_flag <= '0';
		--tile_past_flag <= '0';
		enableaudio_in_Audio <= '0';
	else
		tile_past_flag <= '0';
		--tiles_pressed <= tiles_pressed;
	--	tile_1_1_color <= "100111";
		--mispress_flag <= '0';
		--start_flag <= '0';
		--tile_past_flag <= '0';
		enableaudio_in_Audio <= '0'; 
		case state is 
			when (menu) => 
			   
				curr_state <= "01";
				game_delay <= '1';
				curr_velocity <= "0000";
				start_flag <= data_out(4);
				if (start_flag = '1') then
					state <= playing;
					start_flag <= '0'; 
				end if;
			when (playing) =>
			
				game_delay <= '0'; -- make timer count
				curr_velocity <= "0100"; -- make tiles move with speed two
				curr_state <= "10"; -- set state encoding to 10
				
				
				--if (data_out(1) = '1') then
					--if((tile_1_1_y_pos > 400 and tile_1_1_y_pos < 680) or (tile_1_2_y_pos > 400 and tile_1_2_y_pos < 680)or (tile_1_3_y_pos > 400 and tile_1_3_y_pos < 680) or (tile_1_4_y_pos > 400 and tile_1_4_y_pos < 680)) then	
						--mispress_flag <= '0';
						--tile_past_flag <= '0';
						
					--else
						--mispress_flag <= '1';
					--end if;
				--else
					--mispress_flag <= '0';
				--end if;
				if (data_out(1) = '1') then
					if((tile_1_1_y_pos > 400 and tile_1_1_y_pos < 680) or (tile_1_2_y_pos > 400 and tile_1_2_y_pos < 680)or (tile_1_3_y_pos > 400 and tile_1_3_y_pos < 680) or (tile_1_4_y_pos > 400 and tile_1_4_y_pos < 680)) then	
						mispress_flag <= '0';
						tile_past_flag <= '0';
						enableaudio_in_Audio <= '1';
						if(((tile_1_1_y_pos > 400 and tile_1_1_y_pos < 680) and tile_1_1_color <= "100111") or ((tile_1_2_y_pos > 400 and tile_1_2_y_pos < 680) and tile_1_2_color <= "100111") or ((tile_1_3_y_pos > 400 and tile_1_3_y_pos < 680) and tile_1_3_color <= "100111") or ((tile_1_4_y_pos > 400 and tile_1_4_y_pos < 680) and tile_1_4_color <= "100111")) then	
							score <= score + 1;
						end if;
						
						if(tile_1_1_y_pos > 400 and tile_1_1_y_pos < 685) then	
							
							tile_1_1_color <= "111111";
							
						else
							tile_1_1_color <= "100111";
						end if;
						if(tile_1_2_y_pos > 400 and tile_1_2_y_pos < 685) then
					
							tile_1_2_color <= "111111";
						else
							tile_1_2_color <= "100111";
						end if;
						if(tile_1_3_y_pos > 400 and tile_1_3_y_pos < 685) then
						
							tile_1_3_color <= "111111";
						else
							tile_1_3_color <= "100111";
						end if;
						if(tile_1_4_y_pos > 400 and tile_1_4_y_pos < 685) then
					
							tile_1_4_color <= "111111";
						else
							tile_1_4_color <= "100111";
						end if;
					else
						mispress_flag <= '1';
					end if;
				elsif  (data_out(0) = '1') then
					if((tile_2_1_y_pos > 400 and tile_2_1_y_pos < 680) or (tile_2_2_y_pos > 400 and tile_2_2_y_pos < 680)or (tile_2_3_y_pos > 400 and tile_2_3_y_pos < 680) or (tile_2_4_y_pos > 400 and tile_2_4_y_pos < 680)) then	
						mispress_flag <= '0';
						tile_past_flag <= '0';
						enableaudio_in_Audio <= '1';
						if(((tile_2_1_y_pos > 400 and tile_2_1_y_pos < 680) and tile_2_1_color <= "100111") or ((tile_2_2_y_pos > 400 and tile_2_2_y_pos < 680) and tile_2_2_color <= "100111") or ((tile_2_3_y_pos > 400 and tile_2_3_y_pos < 680) and tile_2_3_color <= "100111") or ((tile_2_4_y_pos > 400 and tile_2_4_y_pos < 680) and tile_2_4_color <= "100111")) then	
							score <= score + 1;
						end if; 
						if(tile_2_1_y_pos > 400 and tile_2_1_y_pos < 685) then
							tile_2_1_color <= "111111";
						else
							tile_2_1_color <= "100111";
						end if;
						if(tile_2_2_y_pos > 400 and tile_2_2_y_pos < 685) then
							tile_2_2_color <= "111111";
							
						else
							tile_2_2_color <= "100111";
						end if;
						if(tile_2_3_y_pos > 400 and tile_2_3_y_pos < 685) then
							tile_2_3_color <= "111111";
							
				
						else
							tile_2_3_color <= "100111";
						end if;
						if(tile_2_4_y_pos > 400 and tile_2_4_y_pos < 685) then
							tile_2_4_color <= "111111";
							
			
						else
							tile_2_4_color <= "100111";
						end if;
						
					else
						mispress_flag <= '1';
						end if;
					elsif  (data_out(6) = '1') then
					if((tile_3_1_y_pos > 400 and tile_3_1_y_pos < 680) or (tile_3_2_y_pos > 400 and tile_3_2_y_pos < 680)or (tile_3_3_y_pos > 400 and tile_3_3_y_pos < 680) or (tile_3_4_y_pos > 400 and tile_3_4_y_pos < 680)) then	
						mispress_flag <= '0';
						tile_past_flag <= '0';
						enableaudio_in_Audio <= '1';
						if(((tile_3_1_y_pos > 400 and tile_3_1_y_pos < 680) and tile_3_1_color <= "100111") or ((tile_3_2_y_pos > 400 and tile_3_2_y_pos < 680) and tile_3_2_color <= "100111") or ((tile_3_3_y_pos > 400 and tile_3_3_y_pos < 680) and tile_3_3_color <= "100111") or ((tile_3_4_y_pos > 400 and tile_3_4_y_pos < 680) and tile_3_4_color <= "100111")) then	
							score <= score + 1;
						end if;
						if(tile_3_1_y_pos > 400 and tile_3_1_y_pos < 685) then
							tile_3_1_color <= "111111";
							
							
						else
							tile_3_1_color <= "100111";
						end if;
						if(tile_3_2_y_pos > 400 and tile_3_2_y_pos < 685) then
							tile_3_2_color <= "111111";
							
						else
							tile_3_2_color <= "100111";
						end if;
						if(tile_3_3_y_pos > 400 and tile_3_3_y_pos < 685) then
							tile_3_3_color <= "111111";
							
					
						else
							tile_3_3_color <= "100111";
						end if;
						if(tile_3_4_y_pos > 400 and tile_3_4_y_pos < 685) then
							tile_3_4_color <= "111111";
							
						else
							tile_3_4_color <= "100111";
						end if;
						
					else
						mispress_flag <= '1';
						end if;
						
						elsif  (data_out(7) = '1') then
					if((tile_4_1_y_pos > 400 and tile_4_1_y_pos < 680) or (tile_4_2_y_pos > 400 and tile_4_2_y_pos < 680)or (tile_4_3_y_pos > 400 and tile_4_3_y_pos < 680) or (tile_4_4_y_pos > 400 and tile_4_4_y_pos < 680)) then	
						mispress_flag <= '0';
						tile_past_flag <= '0';
						enableaudio_in_Audio <= '1';
						if(((tile_4_1_y_pos > 400 and tile_4_1_y_pos < 680) and tile_4_1_color <= "100111") or ((tile_4_2_y_pos > 400 and tile_4_2_y_pos < 680) and tile_4_2_color <= "100111") or ((tile_4_3_y_pos > 400 and tile_4_3_y_pos < 680) and tile_4_3_color <= "100111") or ((tile_4_4_y_pos > 400 and tile_4_4_y_pos < 680) and tile_4_4_color <= "100111")) then	
							score <= score + 1;
						end if;
						if(tile_4_1_y_pos > 400 and tile_4_1_y_pos < 685) then
							tile_4_1_color <= "111111";
							
						else
							tile_4_1_color <= "100111";
						end if;
						if(tile_4_2_y_pos > 400 and tile_4_2_y_pos < 685) then
							tile_4_2_color <= "111111";
							
						else
							tile_4_2_color <= "100111";
						end if;
						if(tile_4_3_y_pos > 400 and tile_4_3_y_pos < 685) then
							tile_4_3_color <= "111111";
						else
							tile_4_3_color <= "100111";
						end if;
						if(tile_4_4_y_pos > 400 and tile_4_4_y_pos < 685) then
							tile_4_4_color <= "111111";
							
						else
							tile_4_4_color <= "100111";
						end if;
						
					else
						mispress_flag <= '1';
						end if;
						
						
					else
					tile_1_1_color <= tile_1_1_color;
					tile_1_2_color <= tile_1_2_color;
					tile_1_3_color <= tile_1_3_color;
					tile_1_4_color <= tile_1_4_color;
					mispress_flag <= '0';
					tile_2_1_color <= tile_2_1_color;
					tile_2_2_color <= tile_2_2_color;
					tile_2_3_color <= tile_2_3_color;
					tile_2_4_color <= tile_2_4_color;
					tile_3_1_color <= tile_3_1_color;
					tile_3_2_color <= tile_3_2_color;
					tile_3_3_color <= tile_3_3_color;
					tile_3_4_color <= tile_3_4_color;
					tile_4_1_color <= tile_4_1_color;
					tile_4_2_color <= tile_4_2_color;
					tile_4_3_color <= tile_4_3_color;
					tile_4_4_color <= tile_4_4_color;
				end if;
				
					
					if(tile_1_1_y_pos = 680) then
						if(tile_1_1_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_1_1_color <= "100111";
						end if;
					elsif(tile_1_2_y_pos = 680) then
						if(tile_1_2_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_1_2_color <= "100111";
						end if;
					elsif(tile_1_3_y_pos = 680) then
						if(tile_1_3_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_1_3_color <= "100111";
						end if;
					elsif(tile_1_4_y_pos = 680) then
						if(tile_1_4_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_1_4_color <= "100111";
						end if;
						
					elsif(tile_2_1_y_pos = 680) then
						if(tile_2_1_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_2_1_color <= "100111";
						end if;
					elsif(tile_2_2_y_pos = 680) then
						if(tile_2_2_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_2_2_color <= "100111";
						end if;
					elsif(tile_2_3_y_pos = 680) then
						if(tile_2_3_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_2_3_color <= "100111";
						end if;
					elsif(tile_2_4_y_pos = 680) then
						if(tile_2_4_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_2_4_color <= "100111";
						end if;
					elsif(tile_3_1_y_pos = 680) then
						if(tile_3_1_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_3_1_color <= "100111";
						end if;
					elsif(tile_3_2_y_pos = 680) then
						if(tile_3_2_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_3_2_color <= "100111";
						end if;
					elsif(tile_3_3_y_pos = 680) then
						if(tile_3_3_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_3_3_color <= "100111";
						end if;
					elsif(tile_3_4_y_pos = 680) then
						if(tile_3_4_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_3_4_color <= "100111";
						end if;
					elsif(tile_4_1_y_pos = 680) then
						if(tile_4_1_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_4_1_color <= "100111";
						end if;
					elsif(tile_4_2_y_pos = 680) then
						if(tile_4_2_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_4_2_color <= "100111";
						end if;
					elsif(tile_4_3_y_pos = 680) then
						if(tile_4_3_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_4_3_color <= "100111";
						end if;
					elsif(tile_4_4_y_pos = 680) then
						if(tile_4_4_color /= "111111") then
							tile_past_flag <= '1';
						else
							tile_4_4_color <= "100111";
						end if;
					end if;
					
					--elsif (tile_1_2_y_pos >= 680 and tile_1_2_y_pos < 690) then
						--if(tile_1_2_color /= "111111") then
							--tile_past_flag <= '1';
						--else
							--tile_1_2_color <= "100111";
						--end if;
					--elsif(tile_1_3_y_pos >= 680 and tile_1_3_y_pos < 690) then 
						--if(tile_1_3_color /= "111111") then
							--tile_past_flag <= '1';
						--else
							--tile_1_3_color <= "100111";
						--end if;
					--elsif(tile_1_4_y_pos >= 680 and tile_1_4_y_pos < 690) then
						--if(tile_1_4_color /= "111111") then
							--tile_past_flag <= '1';
						--else
							--tile_1_4_color <= "100111";
						--end if;
					--end if;
				
				
				if (mispress_flag = '1' or tile_past_flag = '1') then 
					state <= game_over;
				end if;
			when (game_over) =>
				curr_state <= "11";
				start_flag <= data_out(4);
				if (start_flag = '1') then
				curr_state <= "00";
					 state <= menu;
					 start_flag <= '0'; 
				else
					state <= game_over;
				end if;
	end case;
		end if;	
		--if(data_out(4) = '1' and curr_state = "00") then
			--start_flag <= '1';
		--elsif(data_out(4) = '1') then
			--start_flag <= '1';
		--end if;
		
	--end if;
	
	--if curr_state = "10" then -- game state is playing
		--game_delay <= '0';
		--curr_velocity <= "10";
		--if (data_out(1) = '1') then
			    --if((tile_1_1_y_pos > 400 and tile_1_1_y_pos < 680)) then	
					--change_to_play <= '1';
				--elsif((tile_1_2_y_pos > 400 and tile_1_2_y_pos < 680)) then
					--change_to_play <= '1';
					
				--elsif((tile_1_3_y_pos > 400 and tile_1_3_y_pos < 680)) then
					--change_to_play <= '1';
					
				--elsif((tile_1_4_y_pos > 400 and tile_1_4_y_pos < 680)) then	
					--change_to_play <= '1';
					
				--else
					
					--change_to_stop <= '1';
				--end if;
		   
		--end if;
		--if (tile_1_1_y_pos = 680 or tile_1_2_y_pos = 680 or tile_1_3_y_pos = 680 or tile_1_4_y_pos = 680) then
		--if (o_pressed = '0') then
		    --keep_playing1 <= '0';
			--change_to_stop1 <= '1';
		--elsif (o_pressed = '1') then
		   --change_to_stop1 <= '0';
			--keep_playing1 <= '1';
		--end if;
	--end if;
		
	--else -- in menu 
		--game_delay <= '1';
		--curr_velocity <= "00";
		
		
	--end if;
	--if(curr_state = "00" and change_to_begin = '1') then
		--curr_state <= "01";
		--change_to_begin <= '0';
	--elsif(curr_state = "10" and (change_to_stop = '1' or change_to_stop1 = '1')) then
		--o_pressed <= '0';
		--curr_state <= "01";
		--change_to_stop <= '0';
		--change_to_stop1 <= '0';
	--elsif(curr_state = "10" and (keep_playing = '1' or keep_playing1 = '1')) then
		--curr_state <= "10";
		--o_pressed <= '0';
		--keep_playing <= '0';
		--keep_playing1 <= '0';
	--elsif(curr_state = "01" and (start_flag = '1')) then
		--curr_state <= "10";
		--start_flag <= '0';
	--elsif(curr_state = "10" and change_to_play = '1') then
		--o_pressed <= '1';
		--curr_state <= "10";
		--change_to_play <= '0';
end if;
	
	
	
end process;
  
--	curr_velocity <= "00" when data_out(7) = '1' else "10";
	
	
	--process (VSYNC_signal, latch_signal) begin
	--if (rising_edge(latch_signal)) then
		--can_start <= '1';
	--end if;
	
	 --if(rising_edge(VSYNC_signal)) then
	        --if (game_delay = '1') then
				--game_delay_timer <= game_delay_timer + 1;
				--if (game_delay_timer >= to_unsigned(60, 6)) then
					--stop <= '0';
					--stop_1 <= '0';
					--game_delay_timer <= to_unsigned(0, 6);
				--end if;
			--end if;
			
		--end if;
	  
	  
		--if data_output(1) = '1' then
			-- left pressed
				--if((tile_1_1_y_pos > 400 and tile_1_1_y_pos < 680)) then
					
					--tile_1_1_pressed <= '1';
				    --stop <= '0';
					--stop_1 <= '0';
				--elsif((tile_1_2_y_pos > 400 and tile_1_2_y_pos < 680)) then
					
					--tile_1_2_pressed <= '1';
					--stop <= '0';
					--stop_1 <= '0';
				--elsif((tile_1_3_y_pos > 400 and tile_1_3_y_pos < 680)) then
					
					--tile_1_3_pressed <= '1';	
					--stop <= '0';
					--stop_1 <= '0';
				--elsif((tile_1_4_y_pos > 400 and tile_1_4_y_pos < 680)) then
					
					--tile_1_4_pressed <= '1';
					--stop <= '0';
					--stop_1 <= '0';
				--else 
				
					--stop_1 <= '1';
					--stop <= '1';
				--end if;
		--elsif data_output(0) = '1'then	
				--stop <= '0';
				
		--elsif data_output(2) = '1'then	
		
				--stop <= '0';
			   
		--elsif data_output(3) = '1' then	
		
				--stop <= '0';
				
		--elsif data_output(4) = '1' then	
			
				--stop <= '0';
				
		--elsif data_output(5) = '1' then	
		
				--stop <= '0';
				
		--elsif data_output(6) = '1' then	
			
				--stop <= '0';
				
		--elsif data_output(7) = '1' then	
			
				--stop <= '0';
				
		
	--else
		
			
		    --if (tile_1_1_pressed = '1') then
				--tile_1_1_color <= "111111";
			--else
				--tile_1_1_color <= "100111";
		   --end if;
		  --if (tile_1_2_pressed = '1') then
				--tile_1_2_color <= "111111";
		--else
				--tile_1_2_color <= "100111";
		  --end if;
		  --if (tile_1_3_pressed = '1') then
				--tile_1_3_color <= "111111";
		--else
		    --tile_1_3_color <= "100111";
		 --end if;
		--if (tile_1_4_pressed = '1') then
				--tile_1_4_color <= "111111";
		--else
				--tile_1_4_color <= "100111";
		  --end if;
		--if (tile_1_1_pressed = '1' and tile_1_1_y_pos >= 680) then 
			--tile_1_1_pressed <= '0';
		--end if;
		--if (tile_1_2_pressed = '1' and tile_1_2_y_pos >= 680) then 
			--tile_1_2_pressed <= '0';
		--end if;
		--if (tile_1_3_pressed = '1' and tile_1_3_y_pos >= 680) then 
			--tile_1_3_pressed <= '0';
		--end if;
		--if (tile_1_4_pressed = '1' and tile_1_4_y_pos >= 680) then 
			--tile_1_4_pressed <= '0';
		--end if;
	--end if;
	
	
	
	
	--if stop = '1' then
		--curr_velocity <= "00";
		--game_delay <= '1';
	--else
		--curr_velocity <= "10";
		--game_delay <= '0';
	--end if;
	--end process;
	
   
  --latch <= latch_signal;
	
 HSYNC_out <= HSYNC_signal;
 VSYNC_out <= VSYNC_signal;


end;