----------------------------------------------------------------------------------
-- Company:
-- Engineer: Juan Gomez Tarraga
-- 
-- Create Date:
-- Design Name: 
-- Module Name: iterative_1d - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.definitions.all;
use ieee.numeric_std.all;

entity iterative_1D is
	generic(g_width_data : natural := c_g_width_data;
			  g_width_count: natural := c_g_width_count);
	port   (din          : in std_logic_vector (g_width_data - 1 downto 0);
		     num_patterns : out std_logic_vector (g_width_count - 1 downto 0));
end iterative_1D;

architecture Behavioral of iterative_1D is

   -- Señal interna Count que une dos celdas adyacentes.
   signal count: t_count_vector;
   -- Señal interna Pattern que une dos celdas adyacentes.
   signal pattern: t_pattern_vector;

   component cell
	   generic (g_width: natural := c_g_width_count);
	   	port (d				: in std_logic;
			      pattern_in	: in t_pattern;
			      pattern_out	: out t_pattern;
			      count_in		: in signed (g_width - 1 downto 0);
			      count_out	: out signed (g_width - 1 downto 0));
   end component;

begin

-- Instanciamos g_width_data celdas básicas
cell_generation: for i in 0 to g_width_data-1 generate
	i_cell: cell
		generic map (g_width		=> g_width_count)
		port map (d				   => din(i),
					 pattern_in		=> pattern(i),
					 count_in		=> count(i),
					 pattern_out	=> pattern (i+1),
					 count_out		=> count (i+1));
end generate cell_generation;

-- Inicializa el contador.
count(0) <= (others => '0');

-- Patron Inicial.
pattern(0) <= no_pattern;

-- Se hace un casting a std_logic_vector en count 
-- y se le asigna a la salida num_patterns.
num_patterns <= std_logic_vector(count(g_width_data));

end Behavioral;