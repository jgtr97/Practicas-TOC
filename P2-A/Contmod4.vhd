----------------------------------------------------------------------------------
-- Company:        UCM
-- Engineer:       
-- 
-- Create Date:    11:07:57 10/22/2012 
-- Design Name:    counter
-- Module Name:    rtl 
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
use ieee.numeric_std.all;


entity contmod4 is
  generic (k : integer := 4;            -- Module value
           n : integer := 2);           -- Counter width
-- k < 2**n
  port (rst  : in  std_logic;           -- Synch reset
        clk  : in  std_logic;           -- Input clock
        cu   : in  std_logic;           -- Input cu
		  cntr : out std_logic_vector(n-1 downto 0));
end contmod4;

architecture rtl of contmod4 is
  signal cntr_reg : unsigned(n-1 downto 0);

begin

  cntr <= std_logic_vector(cntr_reg);

  -- Proceso que actualiza el contador si clk=1, rst=0 y no excede el tama�o
  -- del registro del contador.
  -- El reset es sincrono activo a nivel alto tal como detalla el enunciado. 
  p_cntr_reg : process(clk, rst)
  begin
    if rising_edge(clk) then
	   if rst = '1' then
        cntr_reg <= (others => '0');
		else
	     if cu = '1' then
	       if cntr_reg < (k-1) then
            cntr_reg <= cntr_reg+1;
          else
            cntr_reg <= (others => '0');
          end if;
        end if;
	   end if;
    end if;
  end process p_cntr_reg;

end rtl;