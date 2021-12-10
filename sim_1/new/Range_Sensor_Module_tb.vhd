----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2021 11:34:34
-- Design Name: 
-- Module Name: Range_Sensor_Module_tb - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Range_Sensor_Module_tb is
--  Port ( );
end Range_Sensor_Module_tb;

architecture Behavioral of Range_Sensor_Module_tb is

component Range_Sensor_Module is
Port ( clk_range_sensor_module : in STD_LOGIC;
           echo_range_sensor_module : in STD_LOGIC;
           trigger_range_sensor_module : out STD_LOGIC;
           Meters_range_sensor_module : out STD_LOGIC_VECTOR (3 downto 0);
           Decimeters_range_sensor_module : out STD_LOGIC_VECTOR (3 downto 0);
           Centimeters_range_sensor_module : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal clk_range_sensor_module : STD_LOGIC;
signal echo_range_sensor_module : STD_LOGIC;
signal trigger_range_sensor_module : STD_LOGIC;
signal Meters_range_sensor_module : STD_LOGIC_VECTOR (3 downto 0);
signal Decimeters_range_sensor_module : STD_LOGIC_VECTOR (3 downto 0);
signal Centimeters_range_sensor_module : STD_LOGIC_VECTOR (3 downto 0);

 constant clock_period: time := 10 ns;
  --signal stop_the_clock: boolean;

begin

uut : Range_Sensor_Module port map (clk_range_sensor_module => clk_range_sensor_module,
                                    echo_range_sensor_module => echo_range_sensor_module,
                                    trigger_range_sensor_module => trigger_range_sensor_module,
                                    Meters_range_sensor_module => Meters_range_sensor_module,
                                    Decimeters_range_sensor_module => Decimeters_range_sensor_module,
                                    Centimeters_range_sensor_module => Centimeters_range_sensor_module);
                                    
                                    
clocking: process
  begin
        
      clk_range_sensor_module <= '0';
      wait for clock_period / 2;
      clk_range_sensor_module <= '1';
      wait for clock_period / 2;
  end process;
  
  simulu: process
  begin
        echo_range_sensor_module <= '0';
        
        
        wait for 20ms;
        echo_range_sensor_module <= '1';
        wait for 20ms;
        echo_range_sensor_module <= '0';
        
        --wait for next trigger
        wait for 30ms;
        
        wait for 20ms;
        echo_range_sensor_module <= '1';
        wait for 500 us;
        echo_range_sensor_module <= '0';
        
        --wait for next trigger
        wait for 49500us;
        
        wait for 20ms;
        echo_range_sensor_module <= '1';
        wait for 30ms;
        echo_range_sensor_module <= '0';
        
        
        
        
        
      wait;
  end process;
  

end Behavioral;
