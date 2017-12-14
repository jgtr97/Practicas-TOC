--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:17:33 11/15/2016
-- Design Name:   
-- Module Name:   D:/VHDL/Practica3/testbench.vhd
-- Project Name:  Practica3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: iterative_1D
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testbench IS
END testbench;
 
ARCHITECTURE behavior OF testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT iterative_1D
    PORT(
         din : IN  std_logic_vector(9 downto 0);
         num_patterns : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal din : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal num_patterns : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: iterative_1d PORT MAP (
          din => din,
          num_patterns => num_patterns
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		din <= "1111011111";
		
		wait for 100 ns;
		
      wait;
   end process;
END;
