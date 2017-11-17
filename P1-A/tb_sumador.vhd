--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   
-- Design Name:   
-- Module Name:   
-- Project Name:  P1.a
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sumador
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
use ieee.numeric_std.all;
 
entity tb_sumador is
end tb_sumador;
 
architecture behavior of tb_sumador is 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component sumador
    port(
         op1 : in  std_logic_vector(3 downto 0);
         op2 : in  std_logic_vector(3 downto 0);
         res : out  std_logic_vector(3 downto 0)
        );
    end component;
    

   --Inputs
   signal op1 : std_logic_vector(3 downto 0) := (others => '0');
   signal op2 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal res : std_logic_vector(3 downto 0);
 
begin
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador PORT MAP (
          op1 => op1,
          op2 => op2,
          res => res
        );

   -- Stimulus process
   p_stim: process
   begin		
	  op1<="0000";    
     op2<="0000";    
     wait for 100 ns;    
	  op1<="0101";    
	  op2<="0100";    
	  wait for 100 ns;    
	  op1<="0000";    
	  op2<="0111";  
	  wait for 100 ns;    
	  op1<="0011";    
	  op2<="1000";    
	  wait for 100 ns;    
     op1<="1011";    
     op2<="1111";    
     wait for 100 ns;    
     op1<="1001";    
     op2<="0110";    
     wait;
   end process;

end;
