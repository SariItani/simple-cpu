library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SimpleCPU is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           out_signal : out STD_LOGIC_VECTOR (7 downto 0));
end SimpleCPU;

architecture Behavioral of SimpleCPU is
    signal pc_out, ir_out, acc_out, alu_result, mem_out : STD_LOGIC_VECTOR (7 downto 0);
    signal alu_op : STD_LOGIC_VECTOR (3 downto 0);
    signal acc_we, mem_we : STD_LOGIC;
    signal instruction_in : STD_LOGIC_VECTOR (7 downto 0);

    component ProgramCounter
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               pc_out : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component InstructionRegister
        Port ( clk : in STD_LOGIC;
               instruction_in : in STD_LOGIC_VECTOR (7 downto 0);
               instruction_out : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component Accumulator
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               data_in : in STD_LOGIC_VECTOR (7 downto 0);
               acc_out : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component ALU
        Port ( op : in STD_LOGIC_VECTOR (3 downto 0);
               a : in STD_LOGIC_VECTOR (7 downto 0);
               b : in STD_LOGIC_VECTOR (7 downto 0);
               result : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component ControlUnit
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               opcode : in STD_LOGIC_VECTOR (3 downto 0);
               alu_op : out STD_LOGIC_VECTOR (3 downto 0);
               acc_we : out STD_LOGIC;
               mem_we : out STD_LOGIC);
    end component;

    component Memory
        Port ( clk : in STD_LOGIC;
               we : in STD_LOGIC;
               addr : in STD_LOGIC_VECTOR (7 downto 0);
               data_in : in STD_LOGIC_VECTOR (7 downto 0);
               data_out : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

begin
    -- Instantiate Program Counter
    u1: ProgramCounter
        Port map (
            clk => clk,
            reset => reset,
            pc_out => pc_out
        );

    -- Instantiate Instruction Register
    u2: InstructionRegister
        Port map (
            clk => clk,
            instruction_in => mem_out,
            instruction_out => ir_out
        );

    -- Instantiate Accumulator
    u3: Accumulator
        Port map (
            clk => clk,
            reset => reset,
            data_in => alu_result,
            acc_out => acc_out
        );

    -- Instantiate ALU
    u4: ALU
        Port map (
            op => alu_op,
            a => acc_out,
            b => mem_out,
            result => alu_result
        );

    -- Instantiate Control Unit
    u5: ControlUnit
        Port map (
            clk => clk,
            reset => reset,
            opcode => ir_out(7 downto 4),
            alu_op => alu_op,
            acc_we => acc_we,
            mem_we => mem_we
        );

    -- Instantiate Memory
    u6: Memory
        Port map (
            clk => clk,
            we => mem_we,
            addr => pc_out,
            data_in => acc_out,
            data_out => mem_out
        );

    -- Output Signal (for debugging or visualization)
    out_signal <= acc_out;
end Behavioral;
