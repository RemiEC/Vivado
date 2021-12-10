----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.11.2021 15:44:08
-- Design Name: 
-- Module Name: BCD_Converter - Behavioral
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

library STD;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- libraries necessary to display messages
--use STD.textio.all;
--use IEEE.std_logic_textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_Converter is
    Port ( Distance_in_binary : in STD_LOGIC_VECTOR (8 downto 0);
           Hundreds : out STD_LOGIC_VECTOR (3 downto 0);
           Tens : out STD_LOGIC_VECTOR (3 downto 0);
           Unitss : out STD_LOGIC_VECTOR (3 downto 0));
end BCD_Converter;

architecture Behavioral of BCD_Converter is


begin




-- process is sensitive to changes in Distance_in_binary as it defines when the numbers displayed need to change
BCD_Converter : process (Distance_in_binary)

-- temporary values of the different columns
variable temp_Distance_in_binary : STD_LOGIC_VECTOR (8 downto 0) := (others=>'0'); 
variable temp_Hundreds : STD_LOGIC_VECTOR (3 downto 0) := (others=>'0'); 
variable temp_Tens : STD_LOGIC_VECTOR (3 downto 0) := (others=>'0'); 
variable temp_Unitss : STD_LOGIC_VECTOR (3 downto 0) := (others=>'0'); 

-- temporary value of the whole line (as defined in the example of the course)
variable temp_all : STD_LOGIC_VECTOR (20 downto 0) := (others=>'0'); 

-- necessary to display messages
--variable my_line : line;

begin

-- create initial line
temp_all := "000000000000" & Distance_in_binary ;

-- As defined in the algorithm, we need to do the shift-add 8 times and a final 9th time because we have 9 bit-vectors
for count in 0 to 7 loop
--    -- display messages
--    write(my_line, temp_all);
--    writeline(output, my_line); 
    
    -- Bit shift to the left
    temp_all := temp_all (19 downto 0) & '0';
    
    -- Extract columns values
    temp_Hundreds := temp_all(20 downto 17);
    temp_Tens := temp_all(16 downto 13);
    temp_Unitss := temp_all(12 downto 9);
    temp_Distance_in_binary := temp_all(8 downto 0);
    
    
    -- Check if value greater than 4
    if temp_Hundreds > "0100"
    then
        temp_Hundreds := temp_Hundreds + 3;
    end if;
    
    if temp_Tens > "0100"
    then
        temp_Tens := temp_Tens + 3;
    end if;
    
    if temp_Unitss > "0100"
    then
        temp_Unitss := temp_Unitss + 3;
    end if;
    
    -- Concatenate the differents parts into the line again
    temp_all := temp_Hundreds & temp_Tens & temp_Unitss & temp_Distance_in_binary;

end loop;

-- Final shift after which no add is necessary
temp_all := temp_all (19 downto 0) & '0';

---- Display messages 
--write(my_line, temp_all);
--writeline(output, my_line);
 
-- Define final values
Hundreds <= temp_all(20 downto 17);
Tens <= temp_all(16 downto 13);
Unitss <= temp_all(12 downto 9);


end process;

end Behavioral;
