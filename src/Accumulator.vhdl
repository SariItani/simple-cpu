library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Accumulator is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           acc_out : out STD_LOGIC_VECTOR (7 downto 0));
end Accumulator;

architecture Behavioral of Accumulator is
signal acc : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
begin
process(clk, reset)
begin
    if reset = '1' then
        acc <= (others => '0');
    elsif rising_edge(clk) then
        acc <= data_in;
    end if;
end process;
acc_out <= acc;
end Behavioral;
