library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InstructionRegister_tb is
end InstructionRegister_tb;

architecture Behavioral of InstructionRegister_tb is
    signal clk : STD_LOGIC := '0';
    signal instruction_in : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal instruction_out : STD_LOGIC_VECTOR (7 downto 0);

    constant clk_period : time := 10 ns;

    component InstructionRegister
        Port ( clk : in STD_LOGIC;
               instruction_in : in STD_LOGIC_VECTOR (7 downto 0);
               instruction_out : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

begin
    uut: InstructionRegister
        Port map (
            clk => clk,
            instruction_in => instruction_in,
            instruction_out => instruction_out
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
        instruction_in <= "00000001";
        wait for 20 ns;
        instruction_in <= "00000010";
        wait for 20 ns;
        instruction_in <= "00000011";
        wait for 20 ns;
        
        -- Simulation time
        wait for 200 ns;
        
        -- Stop the simulation
        wait;
    end process;

end Behavioral;
