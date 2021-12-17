----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2021 09:56:11
-- Design Name: 
-- Module Name: Range_Sensor_Module - Behavioral
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

entity Range_Sensor_Module is
    Port ( clk_range_sensor_module : in STD_LOGIC;
           right_echo_range_sensor_module : in STD_LOGIC;
           left_echo_range_sensor_module : in STD_LOGIC;
           trigger_range_sensor_module : out STD_LOGIC;
           Meters_range_sensor_module : out STD_LOGIC_VECTOR (3 downto 0);
           Decimeters_range_sensor_module : out STD_LOGIC_VECTOR (3 downto 0);
           Centimeters_range_sensor_module : out STD_LOGIC_VECTOR (3 downto 0));
end Range_Sensor_Module;

architecture Behavioral of Range_Sensor_Module is

-- Component definition
component Trigger_Generator is
Port ( clk : in STD_LOGIC;
       trigger : out STD_LOGIC);
end component;

component Distance_Counter is 
Port ( clk : in STD_LOGIC;
       right_enable : in STD_LOGIC;
       left_enable : in STD_LOGIC;
       reset : in STD_LOGIC;
       right_counter_pulse_out : out std_logic_vector (21 downto 0);
       left_counter_pulse_out : out std_logic_vector (21 downto 0));
end component;

component Distance_calculations is
Port ( clk : in STD_LOGIC;
     --pulse : in STD_LOGIC;
     --trigger : in STD_LOGIC;
       right_counter_pulse_out : in STD_LOGIC_VECTOR (21 downto 0);
       left_counter_pulse_out : in STD_LOGIC_VECTOR (21 downto 0);
       right_distance : out STD_LOGIC_VECTOR (8 downto 0);
       left_distance : out STD_LOGIC_VECTOR (8 downto 0));
end component;

component BCD_Converter is
Port ( right_Distance_in_binary : in STD_LOGIC_VECTOR (8 downto 0);
       left_Distance_in_binary : in STD_LOGIC_VECTOR (8 downto 0);
       Hundreds : out STD_LOGIC_VECTOR (3 downto 0);
       Tens : out STD_LOGIC_VECTOR (3 downto 0);
       Unitss : out STD_LOGIC_VECTOR (3 downto 0));
end component;

-- Internal signal definition
signal right_internal_distance_9_bits : STD_LOGIC_VECTOR(8 downto 0);
signal left_internal_distance_9_bits : STD_LOGIC_VECTOR(8 downto 0);
signal right_internal_counter_pulse_out : STD_LOGIC_VECTOR(21 downto 0);
signal left_internal_counter_pulse_out : STD_LOGIC_VECTOR(21 downto 0);
signal internal_trigger : STD_LOGIC;

begin

trigger_range_sensor_module <= internal_trigger;
uut_trigger_generator : Trigger_Generator port map (clk => clk_range_sensor_module, 
                                                    trigger => internal_trigger);
uut_distance_counter : Distance_Counter port map (clk => clk_range_sensor_module, 
                                                    right_enable => right_echo_range_sensor_module,
                                                    left_enable => left_echo_range_sensor_module, 
                                                    reset => internal_trigger,
                                                    right_counter_pulse_out => right_internal_counter_pulse_out,
                                                    left_counter_pulse_out => left_internal_counter_pulse_out);
uut_distance_calculation : Distance_Calculations port map ( clk => clk_range_sensor_module,
                                                           --pulse => echo_range_sensor_module,
                                                           --trigger => internal_trigger,
                                                           right_counter_pulse_out => right_internal_counter_pulse_out,
                                                           left_counter_pulse_out => left_internal_counter_pulse_out,
                                                           right_distance => right_internal_distance_9_bits,
                                                           left_distance => left_internal_distance_9_bits);
                                                           
uut_BCD_Converter : BCD_Converter port map (right_Distance_in_binary => right_internal_distance_9_bits,
                                            left_Distance_in_binary => left_internal_distance_9_bits,
                                            Hundreds => Meters_range_sensor_module,
                                            Tens => Decimeters_range_sensor_module,
                                            Unitss => Centimeters_range_sensor_module);

end Behavioral;
