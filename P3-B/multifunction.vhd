----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name:
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity multifunction is
	generic (g_width: natural := 4);
	port (op1: in signed (g_width - 1 downto 0);
		  op2: in signed (g_width - 1 downto 0);
		  sel: in std_logic_vector(2 downto 0);
		  res: out signed (g_width - 1 downto 0));
end multifunction;

architecture Behavioral of multifunction is
   constant c_add : std_logic_vector(2 downto 0) := "000";
	constant c_sub : std_logic_vector(2 downto 0) := "001";
	constant c_min : std_logic_vector(2 downto 0) := "100";
	constant c_max : std_logic_vector(2 downto 0) := "101";
	constant c_abs : std_logic_vector(2 downto 0) := "111";

begin
	-- Proceso que realiza una funcion dependiendo del valor de sec.
   process (sel, op1, op2) is
	   begin
		   case sel is
		   	when c_add =>
				   res <= op1 + op2;
			   when c_sub =>
				   res <= op1 - op2;
			   when c_min =>
				   if (op1 < op2) then 
					   res <= op1;
				   else 
					   res <= op2;
				   end if;
			   when c_max =>
				   if (op1 > op2) then 
					   res <= op1;
				   else 
					   res <= op2;
				   end if;
			   when c_abs =>
				   res <= abs op1;
			   when others =>
				   res <= (others=>'0');
		   end case;
   end process;

end Behavioral;