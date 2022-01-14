----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2021 15:04:51
-- Design Name: 
-- Module Name: VHDL_clock_divider - Behavioral
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

entity clk_divider is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           slow_clock : out STD_LOGIC);
end clk_divider;

 

architecture Behavioral of clk_divider is
signal count: natural range 0 to 100000-1;
signal clk_tmp : std_logic := '0';
begin
-- On fait un process qui dépend de la clk et de reset pour incrémenter le count et pouvoir le reset
process(clk,reset) 
    begin
        if reset='1' then
            count<=0;
        elsif clk'event and clk='1' then
            if count=100000-1 then
                count<=0;
            else
                count <= count+1;
            end if;
        end if;
end process;
process(clk)
begin
    if clk'event and clk='1' then
        if count = 100000/2-1 or count = 100000-1 then
            clk_tmp <= not(clk_tmp);
        end if;
    end if;
end process;
slow_clock<=clk_tmp;
end Behavioral;