----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 11/24/2021 03:52:34 PM
-- Design Name:
-- Module Name: Distance_calculations - Behavioral
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



entity Distance_calculations is
Port ( clk : in STD_LOGIC;
--pulse : in STD_LOGIC;
--trigger : in STD_LOGIC;
counter_pulse_out : in STD_LOGIC_VECTOR (21 downto 0);
distance : out STD_LOGIC_VECTOR (8 downto 0));
end Distance_calculations;



architecture Behavioral of Distance_calculations is



signal divisor : STD_LOGIC_VECTOR (21 downto 0) := conv_std_logic_vector(5800,22);



begin
-- Définition combinatoire
--distance <= conv_std_logic_vector(conv_integer(counter_pulse_out)/conv_integer(divisor),9);



-- Définition séquentielle
distance_calculation_process: process(clk)

    begin
     
        if clk'event and clk = '1'
        then

            if counter_pulse_out > 2500000 or counter_pulse_out < 12500
            then
                distance <= (others=>'1');
               
            else
                distance <= conv_std_logic_vector(conv_integer(counter_pulse_out)/conv_integer(divisor),9);
            end if;
        end if;
    end process;


end Behavioral;