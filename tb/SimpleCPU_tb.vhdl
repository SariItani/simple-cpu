library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SimpleCPU_tb is
end SimpleCPU_tb;

architecture Behavioral of SimpleCPU_tb is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal out_signal : STD_LOGIC_VECTOR (7 downto 0);

    constant clk_period : time := 10 ns;

    component SimpleCPU
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               out_signal : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

begin
    uut: SimpleCPU
        Port map (
            clk => clk,
            reset => reset,
            out_signal => out_signal
        );

    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- hold reset state for 20 ns.
        reset <= '1';
        wait for 20 ns;  
        reset <= '0';

        -- insert stimulus here 
        wait for 100 ns;
        
        wait;
    end process;

end Behavioral;
