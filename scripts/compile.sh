#!/bin/bash
# Compile all VHDL files
ghdl -a src/ProgramCounter.vhdl
ghdl -a src/InstructionRegister.vhdl
ghdl -a src/Accumulator.vhdl
ghdl -a src/ALU.vhdl
ghdl -a src/ControlUnit.vhdl
ghdl -a src/Memory.vhdl
ghdl -a src/SimpleCPU.vhdl

# Compile all testbenches
ghdl -a tb/ProgramCounter_tb.vhdl
ghdl -a tb/InstructionRegister_tb.vhdl
ghdl -a tb/Accumulator_tb.vhdl
ghdl -a tb/ALU_tb.vhdl
ghdl -a tb/ControlUnit_tb.vhdl
ghdl -a tb/Memory_tb.vhdl
ghdl -a tb/SimpleCPU_tb.vhdl
