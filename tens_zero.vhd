library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tens_zero is
  port(
	  clock : in std_logic;
	  row_count : in unsigned(5 downto 0);
	  col_count : in unsigned(6 downto 0);
	  rgb : out std_logic_vector(5 downto 0)
  );
end tens_zero;

architecture synth of tens_zero is
signal address : unsigned(12 downto 0);
signal rgb_signal : std_logic_vector(5 downto 0);
begin
address <= row_count & col_count;
	process (clock) begin
	if rising_edge(clock) then
rgb_signal <=             "111111" when address = "1001110110100" else
            "111111" when address = "1001110110101" else
            "111111" when address = "1001110110110" else
            "111111" when address = "1001110110111" else
            "111111" when address = "1001110111000" else
            "111111" when address = "1001110111001" else
            "111111" when address = "1010000110100" else
            "111111" when address = "1010000110101" else
            "111111" when address = "1010000110110" else
            "111111" when address = "1010000110111" else
            "111111" when address = "1010000111000" else
            "111111" when address = "1010000111001" else
            "111111" when address = "1010010110010" else
            "111111" when address = "1010010110011" else
            "111111" when address = "1010010111010" else
            "111111" when address = "1010010111011" else
            "111111" when address = "1010100110010" else
            "111111" when address = "1010100110011" else
            "111111" when address = "1010100111010" else
            "111111" when address = "1010100111011" else
            "111111" when address = "1010110110010" else
            "111111" when address = "1010110110011" else
            "111111" when address = "1010110111010" else
            "111111" when address = "1010110111011" else
            "111111" when address = "1011000110010" else
            "111111" when address = "1011000110011" else
            "111111" when address = "1011000111010" else
            "111111" when address = "1011000111011" else
            "111111" when address = "1011010110010" else
            "111111" when address = "1011010110011" else
            "111111" when address = "1011010111010" else
            "111111" when address = "1011010111011" else
            "111111" when address = "1011100110010" else
            "111111" when address = "1011100110011" else
            "111111" when address = "1011100111010" else
            "111111" when address = "1011100111011" else
            "111111" when address = "1011110110010" else
            "111111" when address = "1011110110011" else
            "111111" when address = "1011110111010" else
            "111111" when address = "1011110111011" else
            "111111" when address = "1100000110010" else
            "111111" when address = "1100000110011" else
            "111111" when address = "1100000111010" else
            "111111" when address = "1100000111011" else
            "111111" when address = "1100010110010" else
            "111111" when address = "1100010110011" else
            "111111" when address = "1100010111010" else
            "111111" when address = "1100010111011" else
            "111111" when address = "1100100110010" else
            "111111" when address = "1100100110011" else
            "111111" when address = "1100100111010" else
            "111111" when address = "1100100111011" else
            "111111" when address = "1100110110010" else
            "111111" when address = "1100110110011" else
            "111111" when address = "1100110111010" else
            "111111" when address = "1100110111011" else
            "111111" when address = "1101000110010" else
            "111111" when address = "1101000110011" else
            "111111" when address = "1101000111010" else
            "111111" when address = "1101000111011" else
            "111111" when address = "1101010110100" else
            "111111" when address = "1101010110101" else
            "111111" when address = "1101010110110" else
            "111111" when address = "1101010110111" else
            "111111" when address = "1101010111000" else
            "111111" when address = "1101010111001" else
            "111111" when address = "1101100110100" else
            "111111" when address = "1101100110101" else
            "111111" when address = "1101100110110" else
            "111111" when address = "1101100110111" else
            "111111" when address = "1101100111000" else
            "111111" when address = "1101100111001" else
                    "110000";

	end if;

	end process;
	
rgb <= rgb_signal;	
			
end;