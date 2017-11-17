--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:46:18 11/15/2016
-- Design Name:   
-- Module Name:   D:/VHDL/Practica3.b/testbench.vhd
-- Project Name:  Practica3.b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UM
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
USE ieee.numeric_std.ALL;
 
ENTITY testbench IS
END testbench;
 
ARCHITECTURE behavior OF testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multifunction
    PORT(
         op1 : in  signed(3 downto 0);
         op2 : in  signed(3 downto 0);
         sel : in  std_logic_vector(2 downto 0);
         res : out  signed(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op1 : signed(3 downto 0) := (others => '0');
   signal op2 : signed(3 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal res : signed(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multifunction PORT MAP (
          op1 => op1,
          op2 => op2,
          sel => sel,
          res => res
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		op1 <= "0001";
		op2 <= "0010";
		sel <= "000";
		
		wait for 50 ns;
		
		op1 <= "0011";
		op2 <= "0100";
		sel <= "000";
		
		wait for 50 ns;
		
		op1 <= "0111";
		op2 <= "0010";
		sel <= "001";
		
		wait for 50 ns;
		
		op1 <= "0111";
		op2 <= "0010";
		sel <= "100";
		
		wait for 50 ns;
		
		op1 <= "0111";
		op2 <= "0010";
		sel <= "101";
		
		wait for 50 ns;
		
		op1 <= "0111";
		op2 <= "0010";
		sel <= "111";
      wait;
   end process;

END;
