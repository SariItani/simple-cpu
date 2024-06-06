library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit_tb is
end ControlUnit_tb;

architecture Behavioral of ControlUnit_tb is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal opcode : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal alu_op : STD_LOGIC_VECTOR (3 downto 0);
    signal acc_we : STD_LOGIC;
    signal mem_we : STD_LOGIC;

    constant clk_period : time := 10 ns;

    component ControlUnit
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               opcode : in STD_LOGIC_VECTOR (3 downto 0);
               alu_op : out STD_LOGIC_VECTOR (3 downto 0);
               acc_we : out STD_LOGIC;
               mem_we : out STD_LOGIC);
    end component;

begin
    uut: ControlUnit
        Port map (
            clk => clk,
            reset => reset,
            opcode => opcode,
            alu_op => alu_op,
            acc_we => acc_we,
            mem_we => mem_we
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

        opcode <= "0001"; -- LDA
        wait for 20 ns;
        opcode <= "0010"; -- ADD
        wait for 20 ns;
        opcode <= "0011"; -- SUB
        wait for 20 ns;
        opcode <= "0100"; -- STA
        wait for 20 ns;
        opcode <= "0101"; -- JMP
        wait for 20 ns;
        opcode <= "0110"; -- OUT
        wait for 20 ns;
        opcode <= "0111"; -- HLT
        wait for 20 ns;

        -- Simulation time
        wait for 200 ns;
        
        -- Stop the simulation
        wait;
    end process;

end Behavioral;
