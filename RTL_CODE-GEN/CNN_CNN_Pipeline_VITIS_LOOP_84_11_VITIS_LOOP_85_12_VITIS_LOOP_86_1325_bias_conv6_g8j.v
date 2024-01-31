// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module CNN_CNN_Pipeline_VITIS_LOOP_84_11_VITIS_LOOP_85_12_VITIS_LOOP_86_1325_bias_conv6_g8j (
address0, ce0, q0, reset,clk);

parameter DataWidth = 64;
parameter AddressWidth = 4;
parameter AddressRange = 16;

input[AddressWidth-1:0] address0;
input ce0;
output reg[DataWidth-1:0] q0;
input reset;
input clk;

reg [DataWidth-1:0] ram[0:AddressRange-1];

initial begin
    $readmemh("./CNN_CNN_Pipeline_VITIS_LOOP_84_11_VITIS_LOOP_85_12_VITIS_LOOP_86_1325_bias_conv6_g8j.dat", ram);
end



always @(posedge clk)  
begin 
    if (ce0) 
    begin
        q0 <= ram[address0];
    end
end



endmodule

