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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Range_Sensor_Module is
    Port ( clk_range_sensor_module : in STD_LOGIC;
           echo_range_sensor_module : in STD_LOGIC;
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
Port ( 
    clk : in STD_LOGIC;
    enable : in STD_LOGIC;
    reset : in STD_LOGIC;
    counter_pulse_out : out std_logic_vector (21 downto 0)
    );
end component;

component Distance_calculations is
Port ( clk : in STD_LOGIC;
--pulse : in STD_LOGIC;
--trigger : in STD_LOGIC;
counter_pulse_out : in STD_LOGIC_VECTOR (21 downto 0);
distance : out STD_LOGIC_VECTOR (8 downto 0));
end component;

component BCD_Converter is
Port ( Distance_in_binary : in STD_LOGIC_VECTOR (8 downto 0);
           Hundreds : out STD_LOGIC_VECTOR (3 downto 0);
           Tens : out STD_LOGIC_VECTOR (3 downto 0);
           Unitss : out STD_LOGIC_VECTOR (3 downto 0));
end component;

-- Internal signal definition
signal internal_distance_9_bits : STD_LOGIC_VECTOR(8 downto 0);
signal internal_counter_pulse_out : STD_LOGIC_VECTOR(21 downto 0);
signal internal_trigger : STD_LOGIC;

begin

trigger_range_sensor_module <= internal_trigger;
uut_trigger_generator : Trigger_Generator port map (clk => clk_range_sensor_module, 
                                                    trigger => internal_trigger);
uut_distance_counter : Distance_Counter port map (clk => clk_range_sensor_module, 
                                                    enable => echo_range_sensor_module, 
                                                    reset => internal_trigger,
                                                    counter_pulse_out => internal_counter_pulse_out);
uut_distance_calculation : Distance_Calculations port map ( clk => clk_range_sensor_module,
                                                           --pulse => echo_range_sensor_module,
                                                           --trigger => internal_trigger,
                                                           counter_pulse_out => internal_counter_pulse_out,
                                                           distance => internal_distance_9_bits);
                                                           
uut_BCD_Converter : BCD_Converter port map (Distance_in_binary => internal_distance_9_bits,
                                            Hundreds => Meters_range_sensor_module,
                                            Tens => Decimeters_range_sensor_module,
                                            Unitss => Centimeters_range_sensor_module);

end Behavioral;
