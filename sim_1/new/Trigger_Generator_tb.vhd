

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

entity Trigger_Generator_tb is
end;

architecture Behavioral of Trigger_Generator_tb is

component Trigger_Generator

Port ( clk : in STD_LOGIC;
           trigger : out STD_LOGIC);
end component;

signal clk : STD_LOGIC;
signal trigger : STD_LOGIC;

  constant clock_period: time := 10 ns;
  --signal stop_the_clock: boolean;

begin

uut : Trigger_Generator port map (clk => clk, trigger => trigger);

clocking: process
  begin
        
      clk <= '0';
      wait for clock_period / 2;
      clk <= '1';
      wait for clock_period / 2;
  end process;
  
  simulu: process
  begin
        
      wait;
  end process;
  
  
  
end;

