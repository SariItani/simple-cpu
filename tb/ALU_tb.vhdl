library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is
    signal op : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal a : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal b : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal result : STD_LOGIC_VECTOR (7 downto 0);

    component ALU
        Port ( op : in STD_LOGIC_VECTOR (3 downto 0);
               a : in STD_LOGIC_VECTOR (7 downto 0);
               b : in STD_LOGIC_VECTOR (7 downto 0);
               result : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

begin
    uut: ALU
        Port map (
            op => op,
            a => a,
            b => b,
            result => result
        );

    stim_proc: process
    begin
        op <= "0010"; -- ADD
        a <= "00000001";
        b <= "00000001";
        wait for 20 ns;
        
        op <= "0011"; -- SUB
        a <= "00000010";
        b <= "00000001";
        wait for 20 ns;

        -- Simulation time
        wait for 200 ns;
        
        -- Stop the simulation
        wait;
    end process;

end Behavioral;
