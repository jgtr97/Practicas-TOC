----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Juan Gomez Tarraga
-- 
-- Create Date:
-- Design Name: 
-- Module Name: cell - Behavioral 
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
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
use work.definitions.all;

entity cell is
	generic (g_width     : natural := C_G_WIDTH_COUNT);
	port    (d		      : in std_logic;
		      pattern_in	: in t_pattern;
		      pattern_out	: out t_pattern;
		      count_in		: in signed (g_width - 1 downto 0);
		      count_out	: out signed (g_width - 1 downto 0));
end cell;

architecture Behavioral of cell is

   component multifunction
	   generic (g_width: natural := C_G_WIDTH_COUNT);
		port (op1: in signed (g_width - 1 downto 0);
		  op2: in signed (g_width - 1 downto 0);
		  sel: in std_logic_vector(2 downto 0);
		  res: out signed (g_width - 1 downto 0));
	end component;

   -- Señales intermedias
   signal pattern_cell: t_pattern;
	signal sel_i		: std_logic_vector (2 downto 0);
	signal count_i		: signed (g_width - 1 downto 0);

begin
   u_multifuncion: multifunction
	   generic map (g_width => g_width)
		port map(op1 	=> count_in,
				   op2	=> "0001",
					sel 	=> sel_i,
					res	=> count_i);
					
   -- Proceso que calcula el estado del patron a partir del
	-- estado anterior y de una entrada d.
	p_pattern : process (pattern_in, d) is
	begin
	   case pattern_in is
		   when no_pattern =>
			   if (d = '0') then
				   pattern_cell <= no_pattern;
				else
				   pattern_cell <= first_one;
				end if;
				
			when first_one =>
			   if (d = '0') then
				   pattern_cell <= second_zero;
				else
				   pattern_cell <= second_one;
				end if;
				
			when second_zero =>
			   if (d = '0') then
				   pattern_cell <= no_pattern;
				else 
				   pattern_cell <= pattern_rec;
				end if;
				
			when second_one =>
			   if (d = '0') then
				   pattern_cell <= second_zero;
				else
				   pattern_cell <= pattern_rec;
				end if;
			
			when pattern_rec =>
			   if (d = '0') then
				   pattern_cell <= no_pattern;
				else
				   pattern_cell <= first_one;
				end if;
		
		end case;
	end process p_pattern;
	
   pattern_out <= pattern_cell;

   -- Proceso que incrementa en uno count_out en caso de que 
   -- haya sido detectado el patron 1x1.
   process (count_in, pattern_cell) is
   begin
	   if pattern_cell = pattern_rec then
	   	sel_i <= "001";
			count_out <= count_i;
	   else
		   sel_i <= "000";
		   count_out <= count_in;
	   end if;
   end process;
end Behavioral;