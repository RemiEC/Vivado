----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.12.2021 13:07:30
-- Design Name: 
-- Module Name: motor_control - Behavioral
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

entity Motor_Driver is
    Port (distance_motor_driver_module : in STD_LOGIC_VECTOR (8 downto 0);
        IN1_motor_driver_module : out STD_LOGIC;
        IN2_motor_driver_module : out STD_LOGIC;
        IN3_motor_driver_module : out STD_LOGIC;
        IN4_motor_driver_module : out STD_LOGIC;
        clk_motor_driver_module : in STD_LOGIC);
end Motor_Driver;

architecture Behavioral of Motor_Driver is
begin


    
motor_driver : process (clk_motor_driver_module)
    begin

    if (clk_motor_driver_module'event and clk_motor_driver_module='1')
    then
    
    
        if distance_motor_driver_module < "000011001" 
        then
            IN1_motor_driver_module <= '0';
            IN2_motor_driver_module <= '1';
            IN3_motor_driver_module <= '0';
            IN4_motor_driver_module <= '0';
        elsif distance_motor_driver_module < "000110010" 
        then
            IN1_motor_driver_module <= '1';
            IN2_motor_driver_module <= '0';
            IN3_motor_driver_module <= '0';
            IN4_motor_driver_module <= '0';
        elsif distance_motor_driver_module < "001001011"
        then
            IN1_motor_driver_module <= '0';
            IN2_motor_driver_module <= '0';
            IN3_motor_driver_module <= '0';
            IN4_motor_driver_module <= '1';
        else
            IN1_motor_driver_module <= '0';
            IN2_motor_driver_module <= '0';
            IN3_motor_driver_module <= '1';
            IN4_motor_driver_module <= '0';
        end if;
    end if;
    
    end process;
end Behavioral;