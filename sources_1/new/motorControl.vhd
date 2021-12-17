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

entity Motor_Driver is
    Port (right_distance_motor_driver_module : in STD_LOGIC_VECTOR (8 downto 0);
        left_distance_motor_driver_module : in STD_LOGIC_VECTOR (8 downto 0);
        IN1_right_motor_driver_module : out STD_LOGIC;
        IN2_right_motor_driver_module : out STD_LOGIC;
        IN3_left_motor_driver_module : out STD_LOGIC;
        IN4_left_motor_driver_module : out STD_LOGIC;
        clk_motor_driver_module : in STD_LOGIC);
end Motor_Driver;

architecture Behavioral of Motor_Driver is
begin

motor_driver : process (clk_motor_driver_module)
variable counter: integer := 100000;
variable right_speed: integer := 0;
variable right_sens: integer := 0;
variable left_speed: integer := 0;
variable left_sens: integer := 0;
begin
    
    if (right_distance_motor_driver_module >= 20 and left_distance_motor_driver_module >= 20) then 
        right_speed := 100000;
        left_speed := 100000;
        right_sens := 0; 
        left_sens := 0;-- En avant
    elsif (right_distance_motor_driver_module >= 10 and left_distance_motor_driver_module >= 20) then
        right_speed := (right_distance_motor_driver_module-10)*10000;
        left_speed := 100000;
        right_sens := 0; 
        left_sens := 0;-- En avant
    elsif (right_distance_motor_driver_module >= 20 and left_distance_motor_driver_module >= 10) then
        right_speed := 100000;
        left_speed := (left_distance_motor_driver_module-10)*10000;
        right_sens := 0; 
        left_sens := 0; --20 000 de speed ne suffit pas à le faire bouger
    elsif (right_distance_motor_driver_module < 10 and left_distance_motor_driver_module < 10) then
        right_speed := 100000;
        left_speed := 100000;
        right_sens := 1; 
        left_sens := 1;
    end if;
    
    if (clk_motor_driver_module'event and clk_motor_driver_module='1') then
        counter := counter+1;
        if counter =99999
        then
            counter := 0;
        end if;
        
        if counter < right_speed then
            if right_sens = 0 then
                IN1_right_motor_driver_module <= '1';
                IN2_right_motor_driver_module <= '0';
            else
                IN1_right_motor_driver_module <= '0';
                IN2_right_motor_driver_module <= '1';
            end if;
        else
            IN1_right_motor_driver_module <= '0';
            IN2_right_motor_driver_module <= '0'; 
        end if;
        
        if counter < left_speed then
            if right_sens = 0 then
                IN3_left_motor_driver_module <= '1';
                IN4_left_motor_driver_module <= '0';
            else
                IN3_left_motor_driver_module <= '0';
                IN4_left_motor_driver_module <= '1';
            end if;
        else
            IN3_left_motor_driver_module <= '0';
            IN4_left_motor_driver_module <= '0';
        end if;
    end if;
    
    end process;
end Behavioral;