library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package time_array_pkg is
    -- Declare the array type
    type time_array is array (natural range <>) of unsigned(10 downto 0);
end time_array_pkg;