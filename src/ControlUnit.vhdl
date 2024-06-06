library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           opcode : in STD_LOGIC_VECTOR (3 downto 0);
           alu_op : out STD_LOGIC_VECTOR (3 downto 0);
           acc_we : out STD_LOGIC;
           mem_we : out STD_LOGIC);
end ControlUnit;

architecture Behavioral of ControlUnit is
begin
process(clk, reset)
begin
    if reset = '1' then
        alu_op <= "0000";
        acc_we <= '0';
        mem_we <= '0';
    elsif rising_edge(clk) then
        case opcode is
            when "0001" => acc_we <= '1'; -- LDA
            when "0010" => alu_op <= "0010"; -- ADD
            when "0011" => alu_op <= "0011"; -- SUB
            when "0100" => mem_we <= '1'; -- STA
            when "0101" => acc_we <= '0'; -- JMP
            when "0110" => acc_we <= '0'; -- OUT
            when "0111" => acc_we <= '0'; -- HLT
            when others => acc_we <= '0';
        end case;
    end if;
end process;
end Behavioral;
