----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2021 12:11:57
-- Design Name: 
-- Module Name: Top_design_Range_Sensor_Module_and_Segment_Driver - Behavioral
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

entity Top_design_Range_Sensor_Module_and_Segment_Driver is
    Port ( FPGA_clk : in STD_LOGIC;
    
           Echo : in STD_LOGIC;
           Trigger : out STD_LOGIC;
           
           TopsegA : out STD_LOGIC;
           TopsegB : out STD_LOGIC;
           TopsegC : out STD_LOGIC;
           TopsegD : out STD_LOGIC;
           TopsegE : out STD_LOGIC;
           TopsegF : out STD_LOGIC;
           TopsegG : out STD_LOGIC;
           Topselect_Display_A : out STD_LOGIC;
           Topselect_Display_B : out STD_LOGIC;
           Topselect_Display_C : out STD_LOGIC;
           Topselect_Display_D : out STD_LOGIC;
           Topselect_Display_E : out STD_LOGIC;
           Topselect_Display_F : out STD_LOGIC;
           Topselect_Display_G : out STD_LOGIC;
           Topselect_Display_H : out STD_LOGIC;
           
           Top_IN1 : out STD_LOGIC;
           Top_IN2 : out STD_LOGIC;
           Top_IN3 : out STD_LOGIC;
           Top_IN4 : out STD_LOGIC;
           Top_ENA_switch : in STD_LOGIC;
           Top_ENB_switch : in STD_LOGIC;
           Top_ENA : out STD_LOGIC;
           Top_ENB : out STD_LOGIC);
end Top_design_Range_Sensor_Module_and_Segment_Driver;

architecture Behavioral of Top_design_Range_Sensor_Module_and_Segment_Driver is

-- component definition
component Range_Sensor_Module is
Port ( clk_range_sensor_module : in STD_LOGIC;
           echo_range_sensor_module : in STD_LOGIC;
           trigger_range_sensor_module : out STD_LOGIC;
           Meters_range_sensor_module : out STD_LOGIC_VECTOR (3 downto 0);
           Decimeters_range_sensor_module : out STD_LOGIC_VECTOR (3 downto 0);
           Centimeters_range_sensor_module : out STD_LOGIC_VECTOR (3 downto 0);
           DistanceForMotor_range_sensor_module : out STD_LOGIC_VECTOR (8 downto 0));
end component;

component segmentDriver is
Port ( display_A : in STD_LOGIC_VECTOR (3 downto 0);
        display_B : in STD_LOGIC_VECTOR (3 downto 0);
        display_C : in STD_LOGIC_VECTOR (3 downto 0);
        display_D : in STD_LOGIC_VECTOR (3 downto 0);
        segA : out STD_LOGIC;
        segB : out STD_LOGIC;
        segC : out STD_LOGIC;
        segD : out STD_LOGIC;
        segE : out STD_LOGIC;
        segF : out STD_LOGIC;
        segG : out STD_LOGIC;
        select_Display_A : out STD_LOGIC;
        select_Display_B : out STD_LOGIC;
        select_Display_C : out STD_LOGIC;
        select_Display_D : out STD_LOGIC;
        select_Display_E : out STD_LOGIC;
        select_Display_F : out STD_LOGIC;
        select_Display_G : out STD_LOGIC;
        select_Display_H : out STD_LOGIC;
        clk : in STD_LOGIC);
end component;

component Motor_Driver
Port (distance_motor_driver_module : in STD_LOGIC_VECTOR (8 downto 0);
        IN1_motor_driver_module : out STD_LOGIC;
        IN2_motor_driver_module : out STD_LOGIC;
        IN3_motor_driver_module : out STD_LOGIC;
        IN4_motor_driver_module : out STD_LOGIC;
        clk_motor_driver_module : in STD_LOGIC);
end component;


-- Signal
signal internal_Meters : STD_LOGIC_VECTOR (3 downto 0);
signal internal_Decimeters : STD_LOGIC_VECTOR (3 downto 0);
signal internal_Centimeters : STD_LOGIC_VECTOR (3 downto 0);
signal internal_DistanceForMotor : STD_LOGIC_VECTOR (8 downto 0);

begin

-- UUT

Top_ENA <= Top_ENA_switch;
Top_ENB <= Top_ENB_switch;

uut_Range_Sensor_Module : Range_Sensor_Module port map (clk_range_sensor_module => FPGA_clk,
                                                        echo_range_sensor_module => Echo,
                                                        trigger_range_sensor_module => Trigger,
                                                        Meters_range_sensor_module => internal_Meters,
                                                        Decimeters_range_sensor_module => internal_Decimeters,
                                                        Centimeters_range_sensor_module => internal_Centimeters,
                                                        DistanceForMotor_range_sensor_module => internal_DistanceForMotor);

uut_Segment_Driver : segmentDriver port map (display_A => internal_Centimeters,
                                             display_B => internal_Decimeters,
                                             display_C => internal_Meters,
                                             display_D => "0000",
                                             segA => TopsegA,
                                             segB => TopsegB,
                                             segC => TopsegC,
                                             segD => TopsegD,
                                             segE => TopsegE,
                                             segF => TopsegF,
                                             segG => TopsegG,
                                             select_Display_A => Topselect_Display_A,
                                             select_Display_B => Topselect_Display_B,
                                             select_Display_C => Topselect_Display_C,
                                             select_Display_D => Topselect_Display_D,
                                             select_Display_E => Topselect_Display_E,
                                             select_Display_F => Topselect_Display_F,
                                             select_Display_G => Topselect_Display_G,
                                             select_Display_H => Topselect_Display_H,
                                             clk => FPGA_clk);
                                             
uut_Motor_Driver : Motor_Driver port map (distance_motor_driver_module => internal_DistanceForMotor,
                                          clk_motor_driver_module => FPGA_clk,
                                          IN1_motor_driver_module => Top_IN1,
                                          IN2_motor_driver_module => Top_IN2,
                                          IN3_motor_driver_module => Top_IN3,
                                          IN4_motor_driver_module => Top_IN4);
end Behavioral;
