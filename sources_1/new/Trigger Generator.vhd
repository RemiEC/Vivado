----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2021 11:03:54 AM
-- Design Name: 
-- Module Name: Trigger_generator - Behavioral
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

entity Trigger_generator is
    Port ( clk : in STD_LOGIC;
           trigger : out STD_LOGIC);
end Trigger_generator;

architecture Behavioral of Trigger_generator is

begin
    trigger_process : process(clk)
    
    variable count_1: integer:= 0;
    variable count_0: integer:= 0;
    
    begin 
        if(Clk'event and Clk='1') then        
            if(count_0 <= 7000000) then
                count_1:=0;
                count_0:=count_0+1;
                trigger <= '0';  
            else
                count_1:=count_1+1;
                trigger <= '1';                 
                if (count_1 > 10000) then
                    count_0:=0;
                end if;
                
            end if;                 
        end if;               
        
    end process;
end Behavioral;