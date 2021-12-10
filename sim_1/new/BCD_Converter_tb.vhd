----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2021 04:20:03 PM
-- Design Name: 
-- Module Name: Distance_calculations_tb - Behavioral
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


-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity BCD_Converter_tb is
end;

architecture Behaviour of BCD_Converter_tb is

component BCD_Converter
  Port ( Distance_in_binary : in STD_LOGIC_VECTOR (8 downto 0);
           Hundreds : out STD_LOGIC_VECTOR (3 downto 0);
           Tens : out STD_LOGIC_VECTOR (3 downto 0);
           Unitss : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Distance_in_binary :  STD_LOGIC_VECTOR (8 downto 0);
signal Hundreds :  STD_LOGIC_VECTOR (3 downto 0);
signal Tens :  STD_LOGIC_VECTOR (3 downto 0);
signal Unitss :  STD_LOGIC_VECTOR (3 downto 0);


begin

uut: BCD_Converter port map ( Distance_in_binary               => Distance_in_binary,
                                      Hundreds             => Hundreds,
                                      Tens           => Tens,
                                      Unitss => Unitss);


  stimulus: process
  begin
    Distance_in_binary <= "000001000";
    
    wait for 25ms;
    
    Distance_in_binary <= "101011000";
    wait for 25ms;
    
    Distance_in_binary <= "111111111";
    wait for 25ms;
    
    
    
    
    
        
    wait;
  end process;


end;