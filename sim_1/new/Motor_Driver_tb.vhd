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

entity Motor_Driver_tb is
end;

architecture Behavioral of Motor_Driver_tb is

component Motor_Driver

Port ( distance_motor_driver_module : in STD_LOGIC_VECTOR (8 downto 0);
        IN1_motor_driver_module : out STD_LOGIC;
        IN2_motor_driver_module : out STD_LOGIC;
        IN3_motor_driver_module : out STD_LOGIC;
        IN4_motor_driver_module : out STD_LOGIC;
        clk_motor_driver_module : in STD_LOGIC);
end component;

signal clk_motor_driver_module : STD_LOGIC;
signal IN1_motor_driver_module : STD_LOGIC;
signal IN2_motor_driver_module : STD_LOGIC;
signal IN3_motor_driver_module : STD_LOGIC;
signal IN4_motor_driver_module : STD_LOGIC;
signal distance_motor_driver_module : STD_LOGIC_VECTOR (8 downto 0);


  constant clock_period: time := 10 ns;
  --signal stop_the_clock: boolean;

begin

uut : Motor_Driver port map (clk_motor_driver_module => clk_motor_driver_module,
                            IN1_motor_driver_module => IN1_motor_driver_module,
                            IN2_motor_driver_module => IN2_motor_driver_module,
                            IN3_motor_driver_module => IN3_motor_driver_module,
                            IN4_motor_driver_module => IN4_motor_driver_module,
                            distance_motor_driver_module => distance_motor_driver_module);

clocking: process
  begin
        
      clk_motor_driver_module <= '0';
      wait for clock_period / 2;
      clk_motor_driver_module <= '1';
      wait for clock_period / 2;
  end process;
  
  simulu: process
  begin
        distance_motor_driver_module <= std_logic_vector(to_unsigned(10,9));
        wait for 50ms;
        
        distance_motor_driver_module <= std_logic_vector(to_unsigned(30,9));
        wait for 50ms;
        
        distance_motor_driver_module <= std_logic_vector(to_unsigned(60,9));
        wait for 50ms;
        
        distance_motor_driver_module <= std_logic_vector(to_unsigned(90,9));
        wait for 50ms;
      wait;
  end process;
  
  
  
end;


