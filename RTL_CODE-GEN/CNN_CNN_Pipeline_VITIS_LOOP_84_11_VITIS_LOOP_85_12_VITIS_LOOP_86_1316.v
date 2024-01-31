// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module CNN_CNN_Pipeline_VITIS_LOOP_84_11_VITIS_LOOP_85_12_VITIS_LOOP_86_1316 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        m_axi_gmem_AWVALID,
        m_axi_gmem_AWREADY,
        m_axi_gmem_AWADDR,
        m_axi_gmem_AWID,
        m_axi_gmem_AWLEN,
        m_axi_gmem_AWSIZE,
        m_axi_gmem_AWBURST,
        m_axi_gmem_AWLOCK,
        m_axi_gmem_AWCACHE,
        m_axi_gmem_AWPROT,
        m_axi_gmem_AWQOS,
        m_axi_gmem_AWREGION,
        m_axi_gmem_AWUSER,
        m_axi_gmem_WVALID,
        m_axi_gmem_WREADY,
        m_axi_gmem_WDATA,
        m_axi_gmem_WSTRB,
        m_axi_gmem_WLAST,
        m_axi_gmem_WID,
        m_axi_gmem_WUSER,
        m_axi_gmem_ARVALID,
        m_axi_gmem_ARREADY,
        m_axi_gmem_ARADDR,
        m_axi_gmem_ARID,
        m_axi_gmem_ARLEN,
        m_axi_gmem_ARSIZE,
        m_axi_gmem_ARBURST,
        m_axi_gmem_ARLOCK,
        m_axi_gmem_ARCACHE,
        m_axi_gmem_ARPROT,
        m_axi_gmem_ARQOS,
        m_axi_gmem_ARREGION,
        m_axi_gmem_ARUSER,
        m_axi_gmem_RVALID,
        m_axi_gmem_RREADY,
        m_axi_gmem_RDATA,
        m_axi_gmem_RLAST,
        m_axi_gmem_RID,
        m_axi_gmem_RFIFONUM,
        m_axi_gmem_RUSER,
        m_axi_gmem_RRESP,
        m_axi_gmem_BVALID,
        m_axi_gmem_BREADY,
        m_axi_gmem_BRESP,
        m_axi_gmem_BID,
        m_axi_gmem_BUSER,
        output_conv4,
        grp_fu_2854_p_din0,
        grp_fu_2854_p_din1,
        grp_fu_2854_p_opcode,
        grp_fu_2854_p_dout0,
        grp_fu_2854_p_ce,
        grp_fu_11355_p_din0,
        grp_fu_11355_p_din1,
        grp_fu_11355_p_opcode,
        grp_fu_11355_p_dout0,
        grp_fu_11355_p_ce
);

parameter    ap_ST_fsm_pp0_stage0 = 20'd1;
parameter    ap_ST_fsm_pp0_stage1 = 20'd2;
parameter    ap_ST_fsm_pp0_stage2 = 20'd4;
parameter    ap_ST_fsm_pp0_stage3 = 20'd8;
parameter    ap_ST_fsm_pp0_stage4 = 20'd16;
parameter    ap_ST_fsm_pp0_stage5 = 20'd32;
parameter    ap_ST_fsm_pp0_stage6 = 20'd64;
parameter    ap_ST_fsm_pp0_stage7 = 20'd128;
parameter    ap_ST_fsm_pp0_stage8 = 20'd256;
parameter    ap_ST_fsm_pp0_stage9 = 20'd512;
parameter    ap_ST_fsm_pp0_stage10 = 20'd1024;
parameter    ap_ST_fsm_pp0_stage11 = 20'd2048;
parameter    ap_ST_fsm_pp0_stage12 = 20'd4096;
parameter    ap_ST_fsm_pp0_stage13 = 20'd8192;
parameter    ap_ST_fsm_pp0_stage14 = 20'd16384;
parameter    ap_ST_fsm_pp0_stage15 = 20'd32768;
parameter    ap_ST_fsm_pp0_stage16 = 20'd65536;
parameter    ap_ST_fsm_pp0_stage17 = 20'd131072;
parameter    ap_ST_fsm_pp0_stage18 = 20'd262144;
parameter    ap_ST_fsm_pp0_stage19 = 20'd524288;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   m_axi_gmem_AWVALID;
input   m_axi_gmem_AWREADY;
output  [63:0] m_axi_gmem_AWADDR;
output  [0:0] m_axi_gmem_AWID;
output  [31:0] m_axi_gmem_AWLEN;
output  [2:0] m_axi_gmem_AWSIZE;
output  [1:0] m_axi_gmem_AWBURST;
output  [1:0] m_axi_gmem_AWLOCK;
output  [3:0] m_axi_gmem_AWCACHE;
output  [2:0] m_axi_gmem_AWPROT;
output  [3:0] m_axi_gmem_AWQOS;
output  [3:0] m_axi_gmem_AWREGION;
output  [0:0] m_axi_gmem_AWUSER;
output   m_axi_gmem_WVALID;
input   m_axi_gmem_WREADY;
output  [63:0] m_axi_gmem_WDATA;
output  [7:0] m_axi_gmem_WSTRB;
output   m_axi_gmem_WLAST;
output  [0:0] m_axi_gmem_WID;
output  [0:0] m_axi_gmem_WUSER;
output   m_axi_gmem_ARVALID;
input   m_axi_gmem_ARREADY;
output  [63:0] m_axi_gmem_ARADDR;
output  [0:0] m_axi_gmem_ARID;
output  [31:0] m_axi_gmem_ARLEN;
output  [2:0] m_axi_gmem_ARSIZE;
output  [1:0] m_axi_gmem_ARBURST;
output  [1:0] m_axi_gmem_ARLOCK;
output  [3:0] m_axi_gmem_ARCACHE;
output  [2:0] m_axi_gmem_ARPROT;
output  [3:0] m_axi_gmem_ARQOS;
output  [3:0] m_axi_gmem_ARREGION;
output  [0:0] m_axi_gmem_ARUSER;
input   m_axi_gmem_RVALID;
output   m_axi_gmem_RREADY;
input  [63:0] m_axi_gmem_RDATA;
input   m_axi_gmem_RLAST;
input  [0:0] m_axi_gmem_RID;
input  [8:0] m_axi_gmem_RFIFONUM;
input  [0:0] m_axi_gmem_RUSER;
input  [1:0] m_axi_gmem_RRESP;
input   m_axi_gmem_BVALID;
output   m_axi_gmem_BREADY;
input  [1:0] m_axi_gmem_BRESP;
input  [0:0] m_axi_gmem_BID;
input  [0:0] m_axi_gmem_BUSER;
input  [63:0] output_conv4;
output  [63:0] grp_fu_2854_p_din0;
output  [63:0] grp_fu_2854_p_din1;
output  [1:0] grp_fu_2854_p_opcode;
input  [63:0] grp_fu_2854_p_dout0;
output   grp_fu_2854_p_ce;
output  [63:0] grp_fu_11355_p_din0;
output  [63:0] grp_fu_11355_p_din1;
output  [4:0] grp_fu_11355_p_opcode;
input  [0:0] grp_fu_11355_p_dout0;
output   grp_fu_11355_p_ce;

reg ap_idle;
reg m_axi_gmem_AWVALID;
reg m_axi_gmem_WVALID;
reg m_axi_gmem_ARVALID;
reg m_axi_gmem_RREADY;
reg m_axi_gmem_BREADY;

(* fsm_encoding = "none" *) reg   [19:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg    ap_block_state21_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln84_fu_217_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_CS_fsm_pp0_stage19;
wire    ap_block_state20_pp0_stage19_iter0;
wire    ap_block_pp0_stage19_subdone;
wire   [2:0] bias_conv4_address0;
reg    bias_conv4_ce0;
wire   [63:0] bias_conv4_q0;
reg    gmem_blk_n_AR;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_pp0_stage1;
reg   [0:0] icmp_ln84_reg_540;
reg    gmem_blk_n_R;
wire    ap_CS_fsm_pp0_stage8;
wire    ap_block_pp0_stage8;
reg    gmem_blk_n_AW;
wire    ap_CS_fsm_pp0_stage14;
wire    ap_block_pp0_stage14;
reg    gmem_blk_n_W;
wire    ap_CS_fsm_pp0_stage15;
wire    ap_block_pp0_stage15;
reg    gmem_blk_n_B;
wire    ap_block_pp0_stage0;
reg    ap_block_pp0_stage0_11001;
reg   [60:0] trunc_ln89_3_reg_549;
reg   [63:0] bias_conv4_load_reg_554;
wire    ap_block_state2_pp0_stage1_iter0;
reg    ap_block_state2_io;
reg    ap_block_pp0_stage1_11001;
reg   [63:0] gmem_addr_reg_559;
reg   [63:0] gmem_addr_read_reg_566;
reg    ap_block_state9_pp0_stage8_iter0;
reg    ap_block_pp0_stage8_11001;
wire   [63:0] bitcast_ln89_fu_452_p1;
wire    ap_CS_fsm_pp0_stage9;
wire    ap_block_state10_pp0_stage9_iter0;
wire    ap_block_pp0_stage9_11001;
reg   [63:0] a_assign_3_reg_576;
wire    ap_CS_fsm_pp0_stage12;
wire    ap_block_state13_pp0_stage12_iter0;
wire    ap_block_pp0_stage12_11001;
wire   [63:0] select_ln89_fu_497_p3;
reg   [63:0] select_ln89_reg_582;
wire    ap_block_state15_pp0_stage14_iter0;
reg    ap_block_state15_io;
reg    ap_block_pp0_stage14_11001;
reg    ap_enable_reg_pp0_iter0_reg;
wire   [63:0] zext_ln84_fu_270_p1;
wire  signed [63:0] sext_ln89_fu_442_p1;
wire    ap_block_state16_pp0_stage15_iter0;
reg    ap_block_state16_io;
reg    ap_block_pp0_stage15_11001;
wire    ap_block_pp0_stage15_01001;
reg   [2:0] j_fu_104;
wire   [2:0] add_ln86_fu_397_p2;
wire    ap_loop_init;
reg   [2:0] ap_sig_allocacmp_j_load;
reg   [2:0] i_fu_108;
wire   [2:0] select_ln85_13_fu_341_p3;
reg   [2:0] ap_sig_allocacmp_i_5;
reg   [5:0] indvar_flatten1526_fu_112;
wire   [5:0] select_ln85_14_fu_409_p3;
reg   [5:0] ap_sig_allocacmp_indvar_flatten1526_load;
reg   [3:0] num_ker_fu_116;
wire   [3:0] select_ln84_9_fu_258_p3;
reg   [3:0] ap_sig_allocacmp_num_ker_load;
reg   [7:0] indvar_flatten1545_fu_120;
wire   [7:0] add_ln84_fu_223_p2;
reg   [7:0] ap_sig_allocacmp_indvar_flatten1545_load;
wire    ap_block_pp0_stage9;
wire    ap_CS_fsm_pp0_stage13;
wire    ap_block_pp0_stage13;
wire   [1:0] empty_fu_205_p1;
wire   [0:0] icmp_ln85_fu_244_p2;
wire   [3:0] add_ln84_3_fu_238_p2;
wire   [3:0] tmp_s_fu_209_p3;
wire   [0:0] icmp_ln86_fu_289_p2;
wire   [0:0] xor_ln84_fu_283_p2;
wire   [2:0] select_ln84_fu_250_p3;
wire   [0:0] and_ln84_fu_295_p2;
wire   [0:0] or_ln85_fu_307_p2;
wire   [2:0] add_ln85_3_fu_301_p2;
wire   [1:0] empty_212_fu_321_p1;
wire   [3:0] p_mid5_fu_325_p3;
wire   [3:0] select_ln84_10_fu_275_p3;
wire   [2:0] select_ln85_fu_313_p3;
wire   [1:0] trunc_ln88_fu_349_p1;
wire   [3:0] tmp_10_fu_353_p3;
wire   [3:0] select_ln85_12_fu_333_p3;
wire   [2:0] trunc_ln84_fu_266_p1;
wire   [3:0] or_ln89_fu_361_p2;
wire   [9:0] shl_ln89_3_fu_367_p4;
wire   [63:0] zext_ln89_fu_377_p1;
wire   [63:0] add_ln89_fu_381_p2;
wire   [5:0] add_ln85_fu_403_p2;
wire   [63:0] bitcast_ln18_fu_456_p1;
wire   [10:0] tmp_11_fu_459_p4;
wire   [51:0] trunc_ln18_fu_469_p1;
wire   [0:0] icmp_ln18_5_fu_479_p2;
wire   [0:0] icmp_ln18_fu_473_p2;
wire   [0:0] or_ln18_fu_485_p2;
wire   [0:0] and_ln18_fu_491_p2;
reg    grp_fu_165_ce;
wire    ap_block_state11_pp0_stage10_iter0;
wire    ap_block_pp0_stage10_11001;
wire    ap_CS_fsm_pp0_stage10;
wire    ap_block_state12_pp0_stage11_iter0;
wire    ap_block_pp0_stage11_11001;
wire    ap_CS_fsm_pp0_stage11;
reg    grp_fu_169_ce;
wire    ap_block_state14_pp0_stage13_iter0;
wire    ap_block_pp0_stage13_11001;
wire    ap_block_pp0_stage13_00001;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [19:0] ap_NS_fsm;
reg    ap_idle_pp0_1to1;
reg    ap_block_pp0_stage1_subdone;
wire    ap_block_state3_pp0_stage2_iter0;
wire    ap_block_pp0_stage2_subdone;
wire    ap_block_state4_pp0_stage3_iter0;
wire    ap_block_pp0_stage3_subdone;
wire    ap_block_state5_pp0_stage4_iter0;
wire    ap_block_pp0_stage4_subdone;
wire    ap_block_state6_pp0_stage5_iter0;
wire    ap_block_pp0_stage5_subdone;
wire    ap_block_state7_pp0_stage6_iter0;
wire    ap_block_pp0_stage6_subdone;
wire    ap_block_state8_pp0_stage7_iter0;
wire    ap_block_pp0_stage7_subdone;
reg    ap_block_pp0_stage8_subdone;
wire    ap_block_pp0_stage9_subdone;
wire    ap_block_pp0_stage10_subdone;
wire    ap_block_pp0_stage11_subdone;
wire    ap_block_pp0_stage12_subdone;
wire    ap_block_pp0_stage13_subdone;
reg    ap_block_pp0_stage14_subdone;
reg    ap_block_pp0_stage15_subdone;
wire    ap_block_state17_pp0_stage16_iter0;
wire    ap_block_pp0_stage16_subdone;
wire    ap_block_state18_pp0_stage17_iter0;
wire    ap_block_pp0_stage17_subdone;
wire    ap_block_state19_pp0_stage18_iter0;
wire    ap_block_pp0_stage18_subdone;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_block_pp0_stage9_00001;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 20'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

CNN_CNN_Pipeline_VITIS_LOOP_84_11_VITIS_LOOP_85_12_VITIS_LOOP_86_1316_bias_conv4_eOg #(
    .DataWidth( 64 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
bias_conv4_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(bias_conv4_address0),
    .ce0(bias_conv4_ce0),
    .q0(bias_conv4_q0)
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
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
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
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage19) & (1'b0 == ap_block_pp0_stage19_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln84_fu_217_p2 == 1'd0))) begin
            i_fu_108 <= select_ln85_13_fu_341_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_108 <= 3'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln84_fu_217_p2 == 1'd0))) begin
            indvar_flatten1526_fu_112 <= select_ln85_14_fu_409_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten1526_fu_112 <= 6'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln84_fu_217_p2 == 1'd0))) begin
            indvar_flatten1545_fu_120 <= add_ln84_fu_223_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten1545_fu_120 <= 8'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln84_fu_217_p2 == 1'd0))) begin
            j_fu_104 <= add_ln86_fu_397_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            j_fu_104 <= 3'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln84_fu_217_p2 == 1'd0))) begin
            num_ker_fu_116 <= select_ln84_9_fu_258_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            num_ker_fu_116 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage12) & (icmp_ln84_reg_540 == 1'd0) & (1'b0 == ap_block_pp0_stage12_11001))) begin
        a_assign_3_reg_576 <= grp_fu_2854_p_dout0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln84_reg_540 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        bias_conv4_load_reg_554 <= bias_conv4_q0;
        gmem_addr_reg_559 <= sext_ln89_fu_442_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage8) & (icmp_ln84_reg_540 == 1'd0) & (1'b0 == ap_block_pp0_stage8_11001))) begin
        gmem_addr_read_reg_566 <= m_axi_gmem_RDATA;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln84_reg_540 <= icmp_ln84_fu_217_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage14) & (icmp_ln84_reg_540 == 1'd0) & (1'b0 == ap_block_pp0_stage14_11001))) begin
        select_ln89_reg_582 <= select_ln89_fu_497_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln84_fu_217_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        trunc_ln89_3_reg_549 <= {{add_ln89_fu_381_p2[63:3]}};
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln84_fu_217_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b0)) begin
        ap_idle_pp0_1to1 = 1'b1;
    end else begin
        ap_idle_pp0_1to1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage19) & (1'b0 == ap_block_pp0_stage19_subdone))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_i_5 = 3'd0;
    end else begin
        ap_sig_allocacmp_i_5 = i_fu_108;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_indvar_flatten1526_load = 6'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten1526_load = indvar_flatten1526_fu_112;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_indvar_flatten1545_load = 8'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten1545_load = indvar_flatten1545_fu_120;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_j_load = 3'd0;
    end else begin
        ap_sig_allocacmp_j_load = j_fu_104;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_num_ker_load = 4'd0;
    end else begin
        ap_sig_allocacmp_num_ker_load = num_ker_fu_116;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        bias_conv4_ce0 = 1'b1;
    end else begin
        bias_conv4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln84_reg_540 == 1'd0) & (1'b0 == ap_block_pp0_stage1))) begin
        gmem_blk_n_AR = m_axi_gmem_ARREADY;
    end else begin
        gmem_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage14) & (icmp_ln84_reg_540 == 1'd0) & (1'b0 == ap_block_pp0_stage14))) begin
        gmem_blk_n_AW = m_axi_gmem_AWREADY;
    end else begin
        gmem_blk_n_AW = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        gmem_blk_n_B = m_axi_gmem_BVALID;
    end else begin
        gmem_blk_n_B = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage8) & (icmp_ln84_reg_540 == 1'd0) & (1'b0 == ap_block_pp0_stage8))) begin
        gmem_blk_n_R = m_axi_gmem_RVALID;
    end else begin
        gmem_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage15) & (icmp_ln84_reg_540 == 1'd0) & (1'b0 == ap_block_pp0_stage15))) begin
        gmem_blk_n_W = m_axi_gmem_WREADY;
    end else begin
        gmem_blk_n_W = 1'b1;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage11) & (1'b0 == ap_block_pp0_stage11_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage10) & (1'b0 == ap_block_pp0_stage10_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage12) & (1'b0 == ap_block_pp0_stage12_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage9) & (1'b0 == ap_block_pp0_stage9_11001)))) begin
        grp_fu_165_ce = 1'b1;
    end else begin
        grp_fu_165_ce = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage13) & (1'b0 == ap_block_pp0_stage13_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage14) & (1'b0 == ap_block_pp0_stage14_11001)))) begin
        grp_fu_169_ce = 1'b1;
    end else begin
        grp_fu_169_ce = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln84_reg_540 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        m_axi_gmem_ARVALID = 1'b1;
    end else begin
        m_axi_gmem_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage14) & (icmp_ln84_reg_540 == 1'd0) & (1'b0 == ap_block_pp0_stage14_11001))) begin
        m_axi_gmem_AWVALID = 1'b1;
    end else begin
        m_axi_gmem_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axi_gmem_BREADY = 1'b1;
    end else begin
        m_axi_gmem_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage8) & (icmp_ln84_reg_540 == 1'd0) & (1'b0 == ap_block_pp0_stage8_11001))) begin
        m_axi_gmem_RREADY = 1'b1;
    end else begin
        m_axi_gmem_RREADY = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage15) & (icmp_ln84_reg_540 == 1'd0) & (1'b0 == ap_block_pp0_stage15_11001))) begin
        m_axi_gmem_WVALID = 1'b1;
    end else begin
        m_axi_gmem_WVALID = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        ap_ST_fsm_pp0_stage4 : begin
            if ((1'b0 == ap_block_pp0_stage4_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end
        end
        ap_ST_fsm_pp0_stage5 : begin
            if ((1'b0 == ap_block_pp0_stage5_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end
        end
        ap_ST_fsm_pp0_stage6 : begin
            if ((1'b0 == ap_block_pp0_stage6_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage6;
            end
        end
        ap_ST_fsm_pp0_stage7 : begin
            if ((1'b0 == ap_block_pp0_stage7_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage7;
            end
        end
        ap_ST_fsm_pp0_stage8 : begin
            if ((1'b0 == ap_block_pp0_stage8_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage8;
            end
        end
        ap_ST_fsm_pp0_stage9 : begin
            if ((1'b0 == ap_block_pp0_stage9_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage9;
            end
        end
        ap_ST_fsm_pp0_stage10 : begin
            if ((1'b0 == ap_block_pp0_stage10_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage10;
            end
        end
        ap_ST_fsm_pp0_stage11 : begin
            if ((1'b0 == ap_block_pp0_stage11_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage12;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage11;
            end
        end
        ap_ST_fsm_pp0_stage12 : begin
            if ((1'b0 == ap_block_pp0_stage12_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage12;
            end
        end
        ap_ST_fsm_pp0_stage13 : begin
            if ((1'b0 == ap_block_pp0_stage13_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage14;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage13;
            end
        end
        ap_ST_fsm_pp0_stage14 : begin
            if ((1'b0 == ap_block_pp0_stage14_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage15;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage14;
            end
        end
        ap_ST_fsm_pp0_stage15 : begin
            if ((1'b0 == ap_block_pp0_stage15_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage16;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage15;
            end
        end
        ap_ST_fsm_pp0_stage16 : begin
            if ((1'b0 == ap_block_pp0_stage16_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage17;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage16;
            end
        end
        ap_ST_fsm_pp0_stage17 : begin
            if ((1'b0 == ap_block_pp0_stage17_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage18;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage17;
            end
        end
        ap_ST_fsm_pp0_stage18 : begin
            if ((1'b0 == ap_block_pp0_stage18_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage19;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage18;
            end
        end
        ap_ST_fsm_pp0_stage19 : begin
            if ((1'b0 == ap_block_pp0_stage19_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage19;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln84_3_fu_238_p2 = (ap_sig_allocacmp_num_ker_load + 4'd1);

assign add_ln84_fu_223_p2 = (ap_sig_allocacmp_indvar_flatten1545_load + 8'd1);

assign add_ln85_3_fu_301_p2 = (select_ln84_fu_250_p3 + 3'd1);

assign add_ln85_fu_403_p2 = (ap_sig_allocacmp_indvar_flatten1526_load + 6'd1);

assign add_ln86_fu_397_p2 = (select_ln85_fu_313_p3 + 3'd1);

assign add_ln89_fu_381_p2 = (zext_ln89_fu_377_p1 + output_conv4);

assign and_ln18_fu_491_p2 = (or_ln18_fu_485_p2 & grp_fu_11355_p_dout0);

assign and_ln84_fu_295_p2 = (xor_ln84_fu_283_p2 & icmp_ln86_fu_289_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage10 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_pp0_stage11 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_pp0_stage12 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_pp0_stage13 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_pp0_stage14 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_pp0_stage15 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_pp0_stage19 = ap_CS_fsm[32'd19];

assign ap_CS_fsm_pp0_stage8 = ap_CS_fsm[32'd8];

assign ap_CS_fsm_pp0_stage9 = ap_CS_fsm[32'd9];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((m_axi_gmem_BVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((m_axi_gmem_BVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage10_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage10_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage11_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage11_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage12_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage12_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage13 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage13_00001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage13_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage13_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage14 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage14_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state15_io));
end

always @ (*) begin
    ap_block_pp0_stage14_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state15_io));
end

assign ap_block_pp0_stage15 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage15_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage15_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state16_io));
end

always @ (*) begin
    ap_block_pp0_stage15_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state16_io));
end

assign ap_block_pp0_stage16_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage17_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage18_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage19_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage1_11001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state2_io));
end

always @ (*) begin
    ap_block_pp0_stage1_subdone = ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_block_state2_io));
end

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage6_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage7_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage8 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage8_11001 = ((m_axi_gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln84_reg_540 == 1'd0));
end

always @ (*) begin
    ap_block_pp0_stage8_subdone = ((m_axi_gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln84_reg_540 == 1'd0));
end

assign ap_block_pp0_stage9 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage9_00001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage9_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage9_subdone = ~(1'b1 == 1'b1);

assign ap_block_state10_pp0_stage9_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage10_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage11_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage12_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage13_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state15_io = ((m_axi_gmem_AWREADY == 1'b0) & (icmp_ln84_reg_540 == 1'd0));
end

assign ap_block_state15_pp0_stage14_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state16_io = ((m_axi_gmem_WREADY == 1'b0) & (icmp_ln84_reg_540 == 1'd0));
end

assign ap_block_state16_pp0_stage15_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state17_pp0_stage16_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state18_pp0_stage17_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state19_pp0_stage18_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state20_pp0_stage19_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state21_pp0_stage0_iter1 = (m_axi_gmem_BVALID == 1'b0);
end

always @ (*) begin
    ap_block_state2_io = ((m_axi_gmem_ARREADY == 1'b0) & (icmp_ln84_reg_540 == 1'd0));
end

assign ap_block_state2_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage4_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage5_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage6_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage7_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state9_pp0_stage8_iter0 = ((m_axi_gmem_RVALID == 1'b0) & (icmp_ln84_reg_540 == 1'd0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign bias_conv4_address0 = zext_ln84_fu_270_p1;

assign bitcast_ln18_fu_456_p1 = a_assign_3_reg_576;

assign bitcast_ln89_fu_452_p1 = gmem_addr_read_reg_566;

assign empty_212_fu_321_p1 = add_ln85_3_fu_301_p2[1:0];

assign empty_fu_205_p1 = ap_sig_allocacmp_i_5[1:0];

assign grp_fu_11355_p_ce = grp_fu_169_ce;

assign grp_fu_11355_p_din0 = a_assign_3_reg_576;

assign grp_fu_11355_p_din1 = 64'd0;

assign grp_fu_11355_p_opcode = 5'd2;

assign grp_fu_2854_p_ce = grp_fu_165_ce;

assign grp_fu_2854_p_din0 = bias_conv4_load_reg_554;

assign grp_fu_2854_p_din1 = bitcast_ln89_fu_452_p1;

assign grp_fu_2854_p_opcode = 2'd0;

assign icmp_ln18_5_fu_479_p2 = ((trunc_ln18_fu_469_p1 == 52'd0) ? 1'b1 : 1'b0);

assign icmp_ln18_fu_473_p2 = ((tmp_11_fu_459_p4 != 11'd2047) ? 1'b1 : 1'b0);

assign icmp_ln84_fu_217_p2 = ((ap_sig_allocacmp_indvar_flatten1545_load == 8'd128) ? 1'b1 : 1'b0);

assign icmp_ln85_fu_244_p2 = ((ap_sig_allocacmp_indvar_flatten1526_load == 6'd16) ? 1'b1 : 1'b0);

assign icmp_ln86_fu_289_p2 = ((ap_sig_allocacmp_j_load == 3'd4) ? 1'b1 : 1'b0);

assign m_axi_gmem_ARADDR = sext_ln89_fu_442_p1;

assign m_axi_gmem_ARBURST = 2'd0;

assign m_axi_gmem_ARCACHE = 4'd0;

assign m_axi_gmem_ARID = 1'd0;

assign m_axi_gmem_ARLEN = 32'd1;

assign m_axi_gmem_ARLOCK = 2'd0;

assign m_axi_gmem_ARPROT = 3'd0;

assign m_axi_gmem_ARQOS = 4'd0;

assign m_axi_gmem_ARREGION = 4'd0;

assign m_axi_gmem_ARSIZE = 3'd0;

assign m_axi_gmem_ARUSER = 1'd0;

assign m_axi_gmem_AWADDR = gmem_addr_reg_559;

assign m_axi_gmem_AWBURST = 2'd0;

assign m_axi_gmem_AWCACHE = 4'd0;

assign m_axi_gmem_AWID = 1'd0;

assign m_axi_gmem_AWLEN = 32'd1;

assign m_axi_gmem_AWLOCK = 2'd0;

assign m_axi_gmem_AWPROT = 3'd0;

assign m_axi_gmem_AWQOS = 4'd0;

assign m_axi_gmem_AWREGION = 4'd0;

assign m_axi_gmem_AWSIZE = 3'd0;

assign m_axi_gmem_AWUSER = 1'd0;

assign m_axi_gmem_WDATA = select_ln89_reg_582;

assign m_axi_gmem_WID = 1'd0;

assign m_axi_gmem_WLAST = 1'b0;

assign m_axi_gmem_WSTRB = 8'd255;

assign m_axi_gmem_WUSER = 1'd0;

assign or_ln18_fu_485_p2 = (icmp_ln18_fu_473_p2 | icmp_ln18_5_fu_479_p2);

assign or_ln85_fu_307_p2 = (icmp_ln85_fu_244_p2 | and_ln84_fu_295_p2);

assign or_ln89_fu_361_p2 = (tmp_10_fu_353_p3 | select_ln85_12_fu_333_p3);

assign p_mid5_fu_325_p3 = {{empty_212_fu_321_p1}, {2'd0}};

assign select_ln84_10_fu_275_p3 = ((icmp_ln85_fu_244_p2[0:0] == 1'b1) ? 4'd0 : tmp_s_fu_209_p3);

assign select_ln84_9_fu_258_p3 = ((icmp_ln85_fu_244_p2[0:0] == 1'b1) ? add_ln84_3_fu_238_p2 : ap_sig_allocacmp_num_ker_load);

assign select_ln84_fu_250_p3 = ((icmp_ln85_fu_244_p2[0:0] == 1'b1) ? 3'd0 : ap_sig_allocacmp_i_5);

assign select_ln85_12_fu_333_p3 = ((and_ln84_fu_295_p2[0:0] == 1'b1) ? p_mid5_fu_325_p3 : select_ln84_10_fu_275_p3);

assign select_ln85_13_fu_341_p3 = ((and_ln84_fu_295_p2[0:0] == 1'b1) ? add_ln85_3_fu_301_p2 : select_ln84_fu_250_p3);

assign select_ln85_14_fu_409_p3 = ((icmp_ln85_fu_244_p2[0:0] == 1'b1) ? 6'd1 : add_ln85_fu_403_p2);

assign select_ln85_fu_313_p3 = ((or_ln85_fu_307_p2[0:0] == 1'b1) ? 3'd0 : ap_sig_allocacmp_j_load);

assign select_ln89_fu_497_p3 = ((and_ln18_fu_491_p2[0:0] == 1'b1) ? bitcast_ln18_fu_456_p1 : 64'd0);

assign sext_ln89_fu_442_p1 = $signed(trunc_ln89_3_reg_549);

assign shl_ln89_3_fu_367_p4 = {{{trunc_ln84_fu_266_p1}, {or_ln89_fu_361_p2}}, {3'd0}};

assign tmp_10_fu_353_p3 = {{2'd0}, {trunc_ln88_fu_349_p1}};

assign tmp_11_fu_459_p4 = {{bitcast_ln18_fu_456_p1[62:52]}};

assign tmp_s_fu_209_p3 = {{empty_fu_205_p1}, {2'd0}};

assign trunc_ln18_fu_469_p1 = bitcast_ln18_fu_456_p1[51:0];

assign trunc_ln84_fu_266_p1 = select_ln84_9_fu_258_p3[2:0];

assign trunc_ln88_fu_349_p1 = select_ln85_fu_313_p3[1:0];

assign xor_ln84_fu_283_p2 = (icmp_ln85_fu_244_p2 ^ 1'd1);

assign zext_ln84_fu_270_p1 = select_ln84_9_fu_258_p3;

assign zext_ln89_fu_377_p1 = shl_ln89_3_fu_367_p4;

endmodule //CNN_CNN_Pipeline_VITIS_LOOP_84_11_VITIS_LOOP_85_12_VITIS_LOOP_86_1316
