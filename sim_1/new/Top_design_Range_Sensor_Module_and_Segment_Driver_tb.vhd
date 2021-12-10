----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2021 12:44:17
-- Design Name: 
-- Module Name: Top_design_Range_Sensor_Module_and_Segment_Driver_tb - Behavioral
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

entity Top_design_Range_Sensor_Module_and_Segment_Driver_tb is
--  Port ( );
end Top_design_Range_Sensor_Module_and_Segment_Driver_tb;

architecture Behavioral of Top_design_Range_Sensor_Module_and_Segment_Driver_tb is

component Top_design_Range_Sensor_Module_and_Segment_Driver is
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
           Topselect_Display_D : out STD_LOGIC);
end component;

signal FPGA_clk :  STD_LOGIC;
signal Echo :  STD_LOGIC;
signal Trigger : STD_LOGIC;
signal TopsegA : STD_LOGIC;
signal TopsegB : STD_LOGIC;
signal TopsegC : STD_LOGIC;
signal TopsegD : STD_LOGIC;
signal TopsegE : STD_LOGIC;
signal TopsegF : STD_LOGIC;
signal TopsegG : STD_LOGIC;
signal Topselect_Display_A : STD_LOGIC;
signal Topselect_Display_B : STD_LOGIC;
signal Topselect_Display_C : STD_LOGIC;
signal Topselect_Display_D : STD_LOGIC;

constant clock_period: time := 10 ns;
  --signal stop_the_clock: boolean;
  
begin

uut : Top_design_Range_Sensor_Module_and_Segment_Driver port map (FPGA_clk => FPGA_clk,
                                                                  Echo => Echo,
                                                                  Trigger => Trigger,
                                                                  TopsegA => TopsegA,
                                                                  TopsegB => TopsegB,
                                                                  TopsegC => TopsegC,
                                                                  TopsegD => TopsegD,
                                                                  TopsegE => TopsegE,
                                                                  TopsegF => TopsegF,
                                                                  TopsegG => TopsegG,
                                                                  Topselect_Display_A => Topselect_Display_A,
                                                                  Topselect_Display_B => Topselect_Display_B,
                                                                  Topselect_Display_C => Topselect_Display_C,
                                                                  Topselect_Display_D => Topselect_Display_D);
                                                                  
                                                                  
clocking: process
  begin
        
      FPGA_clk <= '0';
      wait for clock_period / 2;
      FPGA_clk <= '1';
      wait for clock_period / 2;
  end process;
  
simulu: process
  begin
        Echo <= '0';
        
        
        wait for 20ms;
        Echo <= '1';
        wait for 20ms;
        Echo <= '0';
        
        --wait for next trigger
        wait for 30ms;
        
        wait for 20ms;
        Echo <= '1';
        wait for 500 us;
        Echo <= '0';
        
        --wait for next trigger
        wait for 49500us;
        
        wait for 20ms;
        Echo <= '1';
        wait for 30ms;
        Echo <= '0';
        
        
        
        
        
      wait;
  end process;  
  
  
end Behavioral;
