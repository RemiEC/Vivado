----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.10.2021 09:42:55
-- Design Name: 
-- Module Name: segmentDriver - Behavioral
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

 

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

 

entity segmentDriver is
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
end segmentDriver;

 

architecture Behavioral of segmentDriver is
component segmentDecoder is 
    Port ( Digit : in STD_LOGIC_VECTOR (3 downto 0);
        segment_A : out STD_LOGIC;
        segment_B : out STD_LOGIC;
        segment_C : out STD_LOGIC;
        segment_D : out STD_LOGIC;
        segment_E : out STD_LOGIC;
        segment_F : out STD_LOGIC;
        segment_G : out STD_LOGIC);
end component;

 

component clk_divider is
    Port ( clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        slow_clock : out STD_LOGIC);
end component;

 

signal temporary_data : STD_LOGIC_VECTOR(3 downto 0);
signal slow_clock: STD_LOGIC;

 

begin
uut: segmentDecoder port map (temporary_data, segA,segB,segC,segD,segE,segF,segG);
uut1: clk_divider port map (clk,'0',slow_clock);
process(slow_clock)
--On définit la valeur par défaut de display_selection
    variable display_selection: std_logic_vector(2 downto 0):= "000";
    begin
    
    if slow_clock'event and slow_clock = '1' then
    -- A chaque front montant de la clk, on veut changer quel afficheur est actif
    case display_selection is
        when "000" => temporary_data <= display_A;
            select_display_A <= '0';
            select_display_B <= '1';
            select_display_C <= '1';
            select_display_D <= '1';
            select_display_E <= '1';
            select_display_F <= '1';
            select_display_G <= '1';
            select_display_H <= '1';
            display_selection := "001";
        when "001" => temporary_data <= display_B;
            select_display_A <= '1';
            select_display_B <= '0';
            select_display_C <= '1';
            select_display_D <= '1';
            select_display_E <= '1';
            select_display_F <= '1';
            select_display_G <= '1';
            select_display_H <= '1';
            display_selection := "010";
        when "010" => temporary_data <= display_C;
            select_display_A <= '1';
            select_display_B <= '1';
            select_display_C <= '0';
            select_display_D <= '1';
            select_display_E <= '1';
            select_display_F <= '1';
            select_display_G <= '1';
            select_display_H <= '1';
            display_selection := "011";
        when "011" => temporary_data <= display_D;
            select_display_A <= '1';
            select_display_B <= '1';
            select_display_C <= '1';
            select_display_D <= '0';
            select_display_E <= '1';
            select_display_F <= '1';
            select_display_G <= '1';
            select_display_H <= '1';
            display_selection := "100";
        when "100" => temporary_data <= "0000";
            select_display_A <= '1';
            select_display_B <= '1';
            select_display_C <= '1';
            select_display_D <= '1';
            select_display_E <= '0';
            select_display_F <= '0';
            select_display_G <= '0';
            select_display_H <= '0';
            display_selection := "000";
         when others => temporary_data <= "0000";
            select_display_A <= '1';
            select_display_B <= '1';
            select_display_C <= '1';
            select_display_D <= '1';
            select_display_E <= '1';
            select_display_F <= '1';
            select_display_G <= '1';
            select_display_H <= '1';
            display_selection := "000";
        
        end case;
    end if;
  end process;
end Behavioral;
