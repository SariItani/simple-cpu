#!/bin/bash
# Simulate each testbench with limited VCD size

ghdl -e ProgramCounter_tb
ghdl -r ProgramCounter_tb --vcd=ProgramCounter_tb.vcd --stop-time=200ns

ghdl -e InstructionRegister_tb
ghdl -r InstructionRegister_tb --vcd=InstructionRegister_tb.vcd --stop-time=200ns

ghdl -e Accumulator_tb
ghdl -r Accumulator_tb --vcd=Accumulator_tb.vcd --stop-time=200ns

ghdl -e ALU_tb
ghdl -r ALU_tb --vcd=ALU_tb.vcd --stop-time=200ns

ghdl -e ControlUnit_tb
ghdl -r ControlUnit_tb --vcd=ControlUnit_tb.vcd --stop-time=200ns

ghdl -e Memory_tb
ghdl -r Memory_tb --vcd=Memory_tb.vcd --stop-time=200ns

ghdl -e SimpleCPU_tb
ghdl -r SimpleCPU_tb --vcd=SimpleCPU_tb.vcd --stop-time=200ns
