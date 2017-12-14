--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

package definitions is
	constant c_g_width_data: integer := 16;
	constant c_g_width_count: integer := 4;
	type t_pattern is (no_pattern, first_one, second_bit, pattern_rec);
	type t_pattern_vector is array (c_g_width_data downto 0) of t_pattern;
	type t_count_vector is array (c_g_width_data downto 0)
							of unsigned (c_g_width_count - 1 downto 0);
end package definitions;