// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module CNN_CNN_Pipeline_VITIS_LOOP_71_9_VITIS_LOOP_72_1019 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        window_buffer_1_address0,
        window_buffer_1_ce0,
        window_buffer_1_q0,
        tmp_116,
        add_ln45_12,
        p_shl74_cast,
        sum_9_out,
        sum_9_out_ap_vld,
        grp_fu_2854_p_din0,
        grp_fu_2854_p_din1,
        grp_fu_2854_p_opcode,
        grp_fu_2854_p_dout0,
        grp_fu_2854_p_ce,
        grp_fu_11351_p_din0,
        grp_fu_11351_p_din1,
        grp_fu_11351_p_dout0,
        grp_fu_11351_p_ce
);

parameter    ap_ST_fsm_pp0_stage0 = 3'd1;
parameter    ap_ST_fsm_pp0_stage1 = 3'd2;
parameter    ap_ST_fsm_pp0_stage2 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [3:0] window_buffer_1_address0;
output   window_buffer_1_ce0;
input  [63:0] window_buffer_1_q0;
input  [2:0] tmp_116;
input  [5:0] add_ln45_12;
input  [5:0] p_shl74_cast;
output  [63:0] sum_9_out;
output   sum_9_out_ap_vld;
output  [63:0] grp_fu_2854_p_din0;
output  [63:0] grp_fu_2854_p_din1;
output  [1:0] grp_fu_2854_p_opcode;
input  [63:0] grp_fu_2854_p_dout0;
output   grp_fu_2854_p_ce;
output  [63:0] grp_fu_11351_p_din0;
output  [63:0] grp_fu_11351_p_din1;
input  [63:0] grp_fu_11351_p_dout0;
output   grp_fu_11351_p_ce;

reg ap_idle;
reg window_buffer_1_ce0;
reg sum_9_out_ap_vld;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state3_pp0_stage2_iter0;
wire    ap_block_state6_pp0_stage2_iter1;
wire    ap_block_state9_pp0_stage2_iter2;
wire    ap_block_pp0_stage2_subdone;
reg   [0:0] icmp_ln71_reg_401;
reg    ap_condition_exit_pp0_iter0_stage2;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [9:0] kernel_conv5_address0;
reg    kernel_conv5_ce0;
wire   [63:0] kernel_conv5_q0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_state7_pp0_stage0_iter2;
wire    ap_block_state10_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln71_fu_185_p2;
reg   [0:0] icmp_ln71_reg_401_pp0_iter1_reg;
reg   [63:0] window_buffer_1_load_reg_415;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state2_pp0_stage1_iter0;
wire    ap_block_state5_pp0_stage1_iter1;
wire    ap_block_state8_pp0_stage1_iter2;
wire    ap_block_pp0_stage1_11001;
reg   [63:0] kernel_conv5_load_reg_420;
reg   [63:0] mul98_i4_reg_425;
wire    ap_block_pp0_stage2_11001;
reg    ap_enable_reg_pp0_iter0_reg;
wire    ap_block_pp0_stage0_subdone;
wire   [63:0] zext_ln74_14_fu_286_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln74_8_fu_333_p1;
reg   [63:0] sum_fu_58;
reg   [63:0] ap_sig_allocacmp_sum_load_5;
wire    ap_loop_init;
reg   [1:0] n_fu_62;
wire   [1:0] add_ln72_fu_338_p2;
reg   [1:0] ap_sig_allocacmp_n_load;
reg   [1:0] m_fu_66;
wire   [1:0] select_ln71_9_fu_220_p3;
reg   [1:0] ap_sig_allocacmp_m_4;
reg   [3:0] indvar_flatten1629_fu_70;
wire   [3:0] add_ln71_fu_191_p2;
reg   [3:0] ap_sig_allocacmp_indvar_flatten1629_load;
wire    ap_block_pp0_stage0_01001;
wire    ap_block_pp0_stage2;
wire   [3:0] p_shl_fu_167_p3;
wire   [4:0] p_shl79_cast_fu_175_p1;
wire   [4:0] zext_ln71_fu_163_p1;
wire   [0:0] icmp_ln72_fu_206_p2;
wire   [1:0] add_ln71_4_fu_200_p2;
wire   [3:0] tmp_s_fu_232_p3;
wire   [3:0] zext_ln74_fu_228_p1;
wire   [3:0] p_shl79_mid1_fu_250_p3;
wire   [4:0] p_shl79_cast_mid1_fu_258_p1;
wire   [4:0] zext_ln71_5_fu_246_p1;
wire   [4:0] p_mid11627_fu_262_p2;
wire   [4:0] empty_fu_179_p2;
wire   [1:0] select_ln71_fu_212_p3;
wire   [3:0] sub_ln74_fu_240_p2;
wire   [3:0] zext_ln74_13_fu_276_p1;
wire   [3:0] add_ln74_fu_280_p2;
wire   [8:0] tmp_fu_295_p3;
wire   [4:0] select_ln71_10_fu_268_p3;
wire   [4:0] zext_ln72_fu_291_p1;
wire   [4:0] add_ln74_10_fu_307_p2;
wire  signed [7:0] sext_ln74_fu_313_p1;
wire   [7:0] p_shl74_cast_cast_fu_133_p1;
wire   [7:0] add_ln74_11_fu_317_p2;
wire  signed [9:0] sext_ln74_3_fu_323_p1;
wire   [9:0] zext_ln74_7_fu_303_p1;
wire   [9:0] add_ln74_4_fu_327_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_condition_exit_pp0_iter2_stage0;
reg    ap_idle_pp0_0to1;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0_1to3;
wire    ap_block_pp0_stage1_subdone;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_block_pp0_stage0_00001;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

CNN_CNN_Pipeline_VITIS_LOOP_71_9_VITIS_LOOP_72_1019_kernel_conv5_ROM_AUTO_1R #(
    .DataWidth( 64 ),
    .AddressRange( 576 ),
    .AddressWidth( 10 ))
kernel_conv5_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(kernel_conv5_address0),
    .ce0(kernel_conv5_ce0),
    .q0(kernel_conv5_q0)
);

CNN_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage2),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage2)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to1 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter2_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_idle_pp0_0to1 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter2_stage0))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln71_fu_185_p2 == 1'd0))) begin
            indvar_flatten1629_fu_70 <= add_ln71_fu_191_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten1629_fu_70 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln71_fu_185_p2 == 1'd0))) begin
            m_fu_66 <= select_ln71_9_fu_220_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            m_fu_66 <= 2'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln71_fu_185_p2 == 1'd0))) begin
            n_fu_62 <= add_ln72_fu_338_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            n_fu_62 <= 2'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            sum_fu_58 <= 64'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            sum_fu_58 <= grp_fu_2854_p_dout0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln71_reg_401 <= icmp_ln71_fu_185_p2;
        icmp_ln71_reg_401_pp0_iter1_reg <= icmp_ln71_reg_401;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln71_reg_401 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        kernel_conv5_load_reg_420 <= kernel_conv5_q0;
        window_buffer_1_load_reg_415 <= window_buffer_1_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        mul98_i4_reg_425 <= grp_fu_11351_p_dout0;
    end
end

always @ (*) begin
    if (((icmp_ln71_reg_401 == 1'd1) & (1'b0 == ap_block_pp0_stage2_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        ap_condition_exit_pp0_iter0_stage2 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln71_reg_401_pp0_iter1_reg == 1'd1))) begin
        ap_condition_exit_pp0_iter2_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter2_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0_0to1 = 1'b1;
    end else begin
        ap_idle_pp0_0to1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0_1to3 = 1'b1;
    end else begin
        ap_idle_pp0_1to3 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_indvar_flatten1629_load = 4'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten1629_load = indvar_flatten1629_fu_70;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_m_4 = 2'd0;
    end else begin
        ap_sig_allocacmp_m_4 = m_fu_66;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_n_load = 2'd0;
    end else begin
        ap_sig_allocacmp_n_load = n_fu_62;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_sum_load_5 = grp_fu_2854_p_dout0;
    end else begin
        ap_sig_allocacmp_sum_load_5 = sum_fu_58;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        kernel_conv5_ce0 = 1'b1;
    end else begin
        kernel_conv5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln71_reg_401_pp0_iter1_reg == 1'd1))) begin
        sum_9_out_ap_vld = 1'b1;
    end else begin
        sum_9_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        window_buffer_1_ce0 = 1'b1;
    end else begin
        window_buffer_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if (((ap_idle_pp0_0to1 == 1'b1) & (1'b1 == ap_condition_exit_pp0_iter2_stage0))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to3 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln71_4_fu_200_p2 = (ap_sig_allocacmp_m_4 + 2'd1);

assign add_ln71_fu_191_p2 = (ap_sig_allocacmp_indvar_flatten1629_load + 4'd1);

assign add_ln72_fu_338_p2 = (select_ln71_fu_212_p3 + 2'd1);

assign add_ln74_10_fu_307_p2 = (select_ln71_10_fu_268_p3 + zext_ln72_fu_291_p1);

assign add_ln74_11_fu_317_p2 = ($signed(sext_ln74_fu_313_p1) + $signed(p_shl74_cast_cast_fu_133_p1));

assign add_ln74_4_fu_327_p2 = ($signed(sext_ln74_3_fu_323_p1) + $signed(zext_ln74_7_fu_303_p1));

assign add_ln74_fu_280_p2 = (sub_ln74_fu_240_p2 + zext_ln74_13_fu_276_p1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_00001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_state10_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage2_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage1_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage2_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage2;

assign empty_fu_179_p2 = (p_shl79_cast_fu_175_p1 - zext_ln71_fu_163_p1);

assign grp_fu_11351_p_ce = 1'b1;

assign grp_fu_11351_p_din0 = window_buffer_1_load_reg_415;

assign grp_fu_11351_p_din1 = kernel_conv5_load_reg_420;

assign grp_fu_2854_p_ce = 1'b1;

assign grp_fu_2854_p_din0 = ap_sig_allocacmp_sum_load_5;

assign grp_fu_2854_p_din1 = mul98_i4_reg_425;

assign grp_fu_2854_p_opcode = 2'd0;

assign icmp_ln71_fu_185_p2 = ((ap_sig_allocacmp_indvar_flatten1629_load == 4'd9) ? 1'b1 : 1'b0);

assign icmp_ln72_fu_206_p2 = ((ap_sig_allocacmp_n_load == 2'd3) ? 1'b1 : 1'b0);

assign kernel_conv5_address0 = zext_ln74_8_fu_333_p1;

assign p_mid11627_fu_262_p2 = (p_shl79_cast_mid1_fu_258_p1 - zext_ln71_5_fu_246_p1);

assign p_shl74_cast_cast_fu_133_p1 = p_shl74_cast;

assign p_shl79_cast_fu_175_p1 = p_shl_fu_167_p3;

assign p_shl79_cast_mid1_fu_258_p1 = p_shl79_mid1_fu_250_p3;

assign p_shl79_mid1_fu_250_p3 = {{add_ln71_4_fu_200_p2}, {2'd0}};

assign p_shl_fu_167_p3 = {{ap_sig_allocacmp_m_4}, {2'd0}};

assign select_ln71_10_fu_268_p3 = ((icmp_ln72_fu_206_p2[0:0] == 1'b1) ? p_mid11627_fu_262_p2 : empty_fu_179_p2);

assign select_ln71_9_fu_220_p3 = ((icmp_ln72_fu_206_p2[0:0] == 1'b1) ? add_ln71_4_fu_200_p2 : ap_sig_allocacmp_m_4);

assign select_ln71_fu_212_p3 = ((icmp_ln72_fu_206_p2[0:0] == 1'b1) ? 2'd0 : ap_sig_allocacmp_n_load);

assign sext_ln74_3_fu_323_p1 = $signed(add_ln74_11_fu_317_p2);

assign sext_ln74_fu_313_p1 = $signed(add_ln74_10_fu_307_p2);

assign sub_ln74_fu_240_p2 = (tmp_s_fu_232_p3 - zext_ln74_fu_228_p1);

assign sum_9_out = sum_fu_58;

assign tmp_fu_295_p3 = {{tmp_116}, {add_ln45_12}};

assign tmp_s_fu_232_p3 = {{select_ln71_9_fu_220_p3}, {2'd0}};

assign window_buffer_1_address0 = zext_ln74_14_fu_286_p1;

assign zext_ln71_5_fu_246_p1 = add_ln71_4_fu_200_p2;

assign zext_ln71_fu_163_p1 = ap_sig_allocacmp_m_4;

assign zext_ln72_fu_291_p1 = select_ln71_fu_212_p3;

assign zext_ln74_13_fu_276_p1 = select_ln71_fu_212_p3;

assign zext_ln74_14_fu_286_p1 = add_ln74_fu_280_p2;

assign zext_ln74_7_fu_303_p1 = tmp_fu_295_p3;

assign zext_ln74_8_fu_333_p1 = add_ln74_4_fu_327_p2;

assign zext_ln74_fu_228_p1 = select_ln71_9_fu_220_p3;

endmodule //CNN_CNN_Pipeline_VITIS_LOOP_71_9_VITIS_LOOP_72_1019
