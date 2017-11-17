--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:51:47 10/10/2017
-- Design Name:   
-- Module Name:   C:/Users/jg/Documents/VHDL/P1.b/tb_registro_siso.vhd
-- Project Name:  P1.b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registro_siso
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
 
ENTITY tb_registro_siso IS
END tb_registro_siso;
 
ARCHITECTURE behavior OF tb_registro_siso IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registro_siso
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         es : IN  std_logic;
         ss : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal es : std_logic := '0';

 	--Outputs
   signal ss : std_logic;

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registro_siso PORT MAP (
          rst => rst,
          clk => clk,
          es => es,
          ss => ss
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   p_stim: process
   begin		
     -- se mantiene el rst activado durante 50 ns.
    rst <= '1';
    es  <= '0';
    wait for 50 ns;
    rst <= '0';
    es  <= '0';
    wait for 50 ns;
    rst <= '0';
    es  <= '1';
    wait for 50 ns;
    rst <= '0';
    es  <= '0';
    wait for 50 ns;
    rst <= '0';
    es  <= '1';
    wait for 50 ns;
    rst <= '0';
    es  <= '1';
    wait for 50 ns;
    rst <= '0';
    es  <= '0';
    wait for 50 ns;
    rst <= '0';
    es  <= '1';
    wait for 50 ns;
    rst <= '0';
    es  <= '1';
    wait for 50 ns;
    rst <= '0';
    es  <= '0';
    wait for 50 ns;
    rst <= '0';
    es  <= '0';
    wait;
   end process;

END;
