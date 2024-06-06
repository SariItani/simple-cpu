library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter_tb is
end ProgramCounter_tb;

architecture Behavioral of ProgramCounter_tb is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal pc_out : STD_LOGIC_VECTOR (7 downto 0);

    constant clk_period : time := 10 ns;

    component ProgramCounter
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               pc_out : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

begin
    uut: ProgramCounter
        Port map (
            clk => clk,
            reset => reset,
            pc_out => pc_out
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

        -- Simulation time
        wait for 200 ns;
        
        -- Stop the simulation
        wait;
    end process;

end Behavioral;
