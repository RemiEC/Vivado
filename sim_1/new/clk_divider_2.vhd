-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clk_divider_tb is
end;

architecture bench of clk_divider_tb is

  component clk_divider
      Port ( clk : in STD_LOGIC;reset : in STD_LOGIC; slow_clock : out STD_LOGIC);
  end component;

  signal clk: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal slow_clock: STD_LOGIC;

  constant clock_period: time := 10 ns;
  --signal stop_the_clock: boolean;

begin

  uut: clk_divider port map ( clk      => clk, reset => reset, slow_clock => slow_clock );



  clocking: process
  begin
        
      clk <= '0';
      wait for clock_period / 2;
      clk <= '1';
      wait for clock_period / 2;
  end process;
  simulu: process
  begin
        reset <= '1';
     
      wait for 100ns;
      reset <= '0';
      wait;
  end process;
end;