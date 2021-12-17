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
    right_enable : in STD_LOGIC;
    left_enable : in STD_LOGIC;
    reset : in STD_LOGIC;
    right_counter_pulse_out : out std_logic_vector (21 downto 0);
    left_counter_pulse_out : out std_logic_vector (21 downto 0)
    );
end Distance_Counter;

architecture Behavioral of Distance_Counter is
-- Definition of internal signal
signal temp_right_counter_pulse_out :  std_logic_vector (21 downto 0) := (others=>'0');
signal temp_left_counter_pulse_out :  std_logic_vector (21 downto 0) := (others=>'0');
begin
-- Définition combinatoire

-- Définition séquentielle


-- process of time measuring begins
counting : process (clk)
-- allow us to avoid sending data just after the trigger
variable send_data_right : std_logic := '0';
variable send_data_left : std_logic := '0';
begin


if clk'event and clk = '1'
    then if reset = '1' then 
            temp_right_counter_pulse_out <= (others=>'0');
            temp_left_counter_pulse_out <= (others=>'0');
            send_data_right := '0';
            send_data_left := '0';
         else
             if right_enable = '1' then 
                temp_right_counter_pulse_out <= temp_right_counter_pulse_out +1;
                send_data_right := '1';
             elsif right_enable = '0' and send_data_right = '1' then 
                right_counter_pulse_out <= temp_right_counter_pulse_out;
             end if;
             
             if left_enable = '1'
                then 
                temp_left_counter_pulse_out <= temp_left_counter_pulse_out +1;
                send_data_left := '1';
             elsif left_enable = '0' and send_data_left = '1'
                then left_counter_pulse_out <= temp_left_counter_pulse_out;
             end if;
         end if;
end if;

end process;

end Behavioral;
