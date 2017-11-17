--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   
-- Design Name:   
-- Module Name:   
-- Project Name:  P2.a
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cntr
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
 
ENTITY tb_cntr IS
END tb_cntr;
 
ARCHITECTURE behavior OF tb_cntr IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT contmod4
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         cu : IN  std_logic;
         cntr : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    
	 signal clk, rst, cu : std_logic;
	 signal cntr : std_logic_vector(1 downto 0);
 
begin
 
	-- Instantiate the Unit Under Test (UUT)
   uut: contmod4 PORT MAP (
          rst => rst,
          clk => clk,
          cu => cu,
          cntr => cntr
        );

   -- Input clock
  p_clk : process
  begin
    clk <= '0', '1' after 5 ns;
    wait for 10 ns;
  end process p_clk;
 
   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '1';
		cu <= '1';
		wait for 200 ns;
		rst <= '0';
		cu <= '0';
		wait for 100 ns;
		cu <= '1';
      wait;
   end process;

END;
