--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:16:29 10/11/2017
-- Design Name:   
-- Module Name:   C:/Users/jg/Documents/VHDL/P1.c/tb_registro_par.vhd
-- Project Name:  P1.c
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registro_par
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
library ieee;
use ieee.std_logic_1164.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
entity tb_registro_par is
end tb_registro_par;
 
architecture behavior of tb_registro_par is 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component registro_par
    port(
         rst : in  std_logic;
         clk : in  std_logic;
         es : in  std_logic;
         ss : out  std_logic_vector(7 downto 0)
        );
    end component;
    
   --Inputs
   signal rst : std_logic;
   signal clk : std_logic;
   signal es : std_logic;

 	--Outputs
   signal ss : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
begin
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registro_par port map (
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

end;
