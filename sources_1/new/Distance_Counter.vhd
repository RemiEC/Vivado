----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.11.2021 16:35:58
-- Design Name: 
-- Module Name: Distance_Counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Distance_Counter is
    Port ( 
    clk : in STD_LOGIC;
    enable : in STD_LOGIC;
    reset : in STD_LOGIC;
    counter_pulse_out : out std_logic_vector (21 downto 0)
    );
end Distance_Counter;

architecture Behavioral of Distance_Counter is
-- Definition of internal signal
signal temp_counter_pulse_out :  std_logic_vector (21 downto 0) := (others=>'0');
begin
-- Définition combinatoire

-- Définition séquentielle


-- process of time measuring begins
counting : process (clk)
-- allow us to avoid sending data just after the trigger
variable send_data : std_logic := '0';
begin


if clk'event and clk = '1'
    then if reset = '1'
            then 
            temp_counter_pulse_out <= (others=>'0');
            send_data := '0';
         elsif enable = '1'
            then 
            temp_counter_pulse_out <= temp_counter_pulse_out +1;
            send_data := '1';
         elsif enable = '0' and send_data = '1'
            then counter_pulse_out <= temp_counter_pulse_out;
         end if;
end if;

end process;


end Behavioral;
