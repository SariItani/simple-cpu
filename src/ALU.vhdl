library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port ( op : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           result : out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is
begin
process(op, a, b)
begin
    case op is
        when "0010" => result <= std_logic_vector(unsigned(a) + unsigned(b)); -- ADD
        when "0011" => result <= std_logic_vector(unsigned(a) - unsigned(b)); -- SUB
        when others => result <= (others => '0');
    end case;
end process;
end Behavioral;
