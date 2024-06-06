library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Memory_tb is
end Memory_tb;

architecture Behavioral of Memory_tb is
    signal clk : STD_LOGIC := '0';
    signal we : STD_LOGIC := '0';
    signal addr : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal data_in : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal data_out : STD_LOGIC_VECTOR (7 downto 0);

    constant clk_period : time := 10 ns;

    component Memory
        Port ( clk : in STD_LOGIC;
               we : in STD_LOGIC;
               addr : in STD_LOGIC_VECTOR (7 downto 0);
               data_in : in STD_LOGIC_VECTOR (7 downto 0);
               data_out : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

begin
    uut: Memory
        Port map (
            clk => clk,
            we => we,
            addr => addr,
            data_in => data_in,
            data_out => data_out
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
        we <= '1';
        data_in <= "00000001";
        addr <= "00000000";
        wait for 20 ns;
        
        we <= '0';
        addr <= "00000000";
        wait for 20 ns;

        we <= '1';
        data_in <= "00000010";
        addr <= "00000001";
        wait for 20 ns;
        
        we <= '0';
        addr <= "00000001";
        wait for 20 ns;

        -- Simulation time
        wait for 200 ns;
        
        -- Stop the simulation
        wait;
    end process;

end Behavioral;
