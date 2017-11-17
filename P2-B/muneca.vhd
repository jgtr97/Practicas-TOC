----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:25:41 10/21/2017 
-- Design Name: 
-- Module Name:    muneca - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity muneca is
    port (clk : in std_logic;   -- Clk a 25MHz.
	       rst_n : in std_logic; -- Reset asincrono activa baja.
	       r: in std_logic;      -- Entrada ruido.
	       c: in std_logic;      -- Chupete
	       g: out std_logic;     -- Generador ruido
	       l: out std_logic);    -- l=1 llora, l=0 habla si g=1.
end muneca;

architecture rtl of muneca is
    -- Estado tranquila codificado con "00".
    constant c_tranquila_st : std_logic_vector(1 downto 0) := "00"; 
	 -- Estado habla codificado con "01".
	 constant c_habla_st : std_logic_vector(1 downto 0) := "01"; 
	 -- Estado dormida codificado con "10".
	 constant c_dormida_st : std_logic_vector(1 downto 0) := "10"; 
	 -- Estado asustada codificado con "11".
	 constant c_asustada_st : std_logic_vector(1 downto 0) := "11"; 
	 
	 -- Señales para representar el estado actual y el estado siguiente.
	 signal current_state, next_state : std_logic_vector(1 downto 0);
    
begin
	
	-- Proceso para calcular el siguiente estado a partir de uno actual.
	p_next_state : process(current_state, r, c)
	begin
	   case current_state is
		   
			when c_tranquila_st => 
            if r='1' and c='0' then
               next_state <= c_habla_st;
            
				elsif r='0' and c='1' then
               next_state <= c_dormida_st;
            
				else
               next_state <= current_state;
				end if;
				
			when c_habla_st =>
				if c='1' then
				   next_state <= c_dormida_st;
				
				else
					next_state <= current_state;
				end if;
				
			when c_dormida_st =>
			   if r='1' then
				   next_state <= c_asustada_st;
				
				else
				   next_state <= current_state;
				end if;	
					
			when c_asustada_st =>
			   if c='0' and r='0' then
				   next_state <= c_tranquila_st;
				
				elsif c='1' and r='0' then
				   next_state <= c_dormida_st;
				
				else
				   next_state <= current_state;
				end if;
				
			when others =>
			   -- Caso en el que no esté inicializado current_state.
			   next_state <= c_tranquila_st; 
				
		end case;
	end process p_next_state;
	
	-- Proceso que actualiza las salidas del sistema a partir del estado actual.
	p_outputs : process(current_state)
	begin
      case current_state is

	      when c_tranquila_st =>
			   g <= '0';
				l <= '-';
			
			when c_habla_st =>
			   g <= '1';
				l <= '0';
				
			when c_dormida_st =>
			   g <= '0';
				l <= '-';
				
			when c_asustada_st =>
			   g <= '1';
				l <= '1';
				
			when others =>
			   g <= 'U'; -- No inicializado.
				l <= 'U'; -- No inicializado.
				
		end case;
	end process p_outputs;
	
	-- Proceso secuencial que controla la señal de reloj y el reset.
	p_reg : process(clk, rst_n)
	begin
	   if rst_n = '0' then   
         current_state <= c_tranquila_st; -- Estado inicial.
      elsif rising_edge(clk) then 
         current_state <= next_state; -- Transicion de estados.
      end if;
	end process p_reg;

end rtl;

