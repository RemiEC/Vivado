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

entity motorControl is
    Port ( meters_motor_control_module : in STD_LOGIC_VECTOR (3 downto 0);
        decimeters_motor_control_module : in STD_LOGIC_VECTOR (3 downto 0);
        centimeters_motor_control_module : in STD_LOGIC_VECTOR (3 downto 0);
        IN1_motor_control_module : out STD_LOGIC;
        IN2_motor_control_module : out STD_LOGIC;
        IN3_motor_control_module : out STD_LOGIC;
        IN4_motor_control_module : out STD_LOGIC;
        clk_motor_control_module : in STD_LOGIC);
end motorControl;

architecture Behavioral of motorControl is
signal distance : integer := meters_motor_control_module*100 + decimeters_motor_control_module*10 + centimeters_motor_control_module;
begin
process (clk_motor_control_module, meters_motor_control_module, decimeters_motor_control_module, centimeters_motor_control_module)
    begin
    if distance <= 25 then
        IN1_motor_control_module <= '0';
        IN2_motor_control_module <= '1';
        IN3_motor_control_module <= '0';
        IN4_motor_control_module <= '0';
    elsif distance <= 50 then
        IN1_motor_control_module <= '1';
        IN2_motor_control_module <= '0';
        IN3_motor_control_module <= '0';
        IN4_motor_control_module <= '0';
    elsif distance <= 75 then
        IN1_motor_control_module <= '0';
        IN2_motor_control_module <= '0';
        IN3_motor_control_module <= '0';
        IN4_motor_control_module <= '1';
    else
        IN1_motor_control_module <= '0';
        IN2_motor_control_module <= '0';
        IN3_motor_control_module <= '1';
        IN4_motor_control_module <= '0';
    end if;
    end process;
end Behavioral;