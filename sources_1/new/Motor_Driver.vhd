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
variable speed: integer := 0;
variable counter: integer := 100000;
variable sens: integer := 0;
begin
    
    if distance_motor_driver_module >= 25
    then
        speed := 100000;
        sens := 0; -- En avant
    elsif (distance_motor_driver_module < 25 and distance_motor_driver_module >= 15) then
        speed := 70000;
        --(conv_integer(distance_motor_driver_module)-15) *10000;
        sens := 0; -- En avant
    elsif (distance_motor_driver_module < 15 and distance_motor_driver_module >= 10) then
        speed := 0;
        sens := 0; -- En avant
    else
        speed := 70000;
        sens := 1; -- En arrière, 20 000 de speed ne suffit pas à le faire bouger
    end if;
    
    if (clk_motor_driver_module'event and clk_motor_driver_module='1') then
        counter := counter+1;
        if counter =99999
        then
            counter := 0;
        end if;
        
        if counter < speed then
            if sens = 0 then
                IN1_motor_driver_module <= '1';
                IN2_motor_driver_module <= '0';
                IN3_motor_driver_module <= '1';
                IN4_motor_driver_module <= '0';
            else
                IN1_motor_driver_module <= '0';
                IN2_motor_driver_module <= '1';
                IN3_motor_driver_module <= '0';
                IN4_motor_driver_module <= '1';
            end if;
        else
            IN1_motor_driver_module <= '0';
            IN2_motor_driver_module <= '0';
            IN3_motor_driver_module <= '0';
            IN4_motor_driver_module <= '0';
        
        end if;
    end if;
    
    end process;
end Behavioral;