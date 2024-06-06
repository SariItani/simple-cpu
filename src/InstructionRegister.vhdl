library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InstructionRegister is
    Port ( clk : in STD_LOGIC;
           instruction_in : in STD_LOGIC_VECTOR (7 downto 0);
           instruction_out : out STD_LOGIC_VECTOR (7 downto 0));
end InstructionRegister;

architecture Behavioral of InstructionRegister is
signal ir : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
begin
process(clk)
begin
    if rising_edge(clk) then
        ir <= instruction_in;
    end if;
end process;
instruction_out <= ir;
end Behavioral;
