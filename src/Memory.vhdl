library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Memory is
    Port ( clk : in STD_LOGIC;
           we : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR (7 downto 0);
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0));
end Memory;

architecture Behavioral of Memory is
type memory_array is array (255 downto 0) of STD_LOGIC_VECTOR (7 downto 0);
signal ram : memory_array := (others => (others => '0'));
begin
process(clk)
begin
    if rising_edge(clk) then
        if we = '1' then
            ram(to_integer(unsigned(addr))) <= data_in;
        end if;
        data_out <= ram(to_integer(unsigned(addr)));
    end if;
end process;
end Behavioral;
