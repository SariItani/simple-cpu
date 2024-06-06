library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Accumulator_tb is
end Accumulator_tb;

architecture Behavioral of Accumulator_tb is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal data_in : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal acc_out : STD_LOGIC_VECTOR (7 downto 0);

    constant clk_period : time := 10 ns;

    component Accumulator
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               data_in : in STD_LOGIC_VECTOR (7 downto 0);
               acc_out : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

begin
    uut: Accumulator
        Port map (
            clk => clk,
            reset => reset,
            data_in => data_in,
            acc_out => acc_out
        );

    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stim_proc: process
    begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        data_in <= "00000001";
        wait for 20 ns;
        data_in <= "00000010";
        wait for 20 ns;
        data_in <= "00000011";
        wait for 20 ns;
        
        -- Simulation time
        wait for 200 ns;
        
        -- Stop the simulation
        wait;
    end process;

end Behavioral;
