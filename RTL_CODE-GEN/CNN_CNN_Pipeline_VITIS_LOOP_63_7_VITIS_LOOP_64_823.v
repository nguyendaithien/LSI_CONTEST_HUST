// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module CNN_CNN_Pipeline_VITIS_LOOP_63_7_VITIS_LOOP_64_823 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        window_buffer_3_address0,
        window_buffer_3_ce0,
        window_buffer_3_we0,
        window_buffer_3_d0,
        window_buffer_3_address1,
        window_buffer_3_ce1,
        window_buffer_3_q1,
        line_buffer_9_load_2,
        line_buffer_10_load_3,
        line_buffer_11_load_3
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [3:0] window_buffer_3_address0;
output   window_buffer_3_ce0;
output   window_buffer_3_we0;
output  [63:0] window_buffer_3_d0;
output  [3:0] window_buffer_3_address1;
output   window_buffer_3_ce1;
input  [63:0] window_buffer_3_q1;
input  [63:0] line_buffer_9_load_2;
input  [63:0] line_buffer_10_load_3;
input  [63:0] line_buffer_11_load_3;

reg ap_idle;
reg window_buffer_3_ce0;
reg window_buffer_3_we0;
reg[3:0] window_buffer_3_address1;
reg window_buffer_3_ce1;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln63_fu_172_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln63_reg_391;
wire   [1:0] select_ln63_fu_202_p3;
reg   [1:0] select_ln63_reg_395;
reg   [3:0] window_buffer_3_addr_2_reg_409;
wire   [0:0] addr_cmp_fu_273_p2;
reg   [0:0] addr_cmp_reg_414;
wire   [63:0] tmp_18_fu_279_p5;
wire   [0:0] addr_cmp12_fu_288_p2;
reg   [0:0] addr_cmp12_reg_424;
reg   [63:0] ap_phi_mux_cond73_i444_phi_fu_129_p6;
wire   [63:0] reuse_select13_fu_328_p3;
reg   [63:0] ap_phi_reg_pp0_iter2_cond73_i444_reg_126;
wire   [63:0] reuse_select_fu_320_p3;
wire   [63:0] ap_phi_reg_pp0_iter0_cond73_i444_reg_126;
reg   [63:0] ap_phi_reg_pp0_iter1_cond73_i444_reg_126;
wire   [63:0] p_cast_fu_242_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] p_cast1_fu_253_p1;
wire   [63:0] zext_ln66_6_fu_268_p1;
reg   [63:0] reuse_addr_reg_fu_56;
wire    ap_loop_init;
reg   [63:0] reuse_reg_fu_60;
reg   [1:0] col_fu_64;
wire   [1:0] add_ln64_fu_299_p2;
reg   [1:0] row_fu_68;
wire   [1:0] select_ln63_3_fu_210_p3;
reg   [3:0] indvar_flatten1771_fu_72;
wire   [3:0] add_ln63_fu_178_p2;
wire   [0:0] icmp_ln64_fu_196_p2;
wire   [1:0] add_ln63_3_fu_190_p2;
wire   [3:0] tmp_s_fu_222_p3;
wire   [3:0] zext_ln66_fu_218_p1;
wire   [3:0] sub_ln66_fu_230_p2;
wire   [3:0] empty_228_fu_236_p2;
wire   [3:0] empty_229_fu_247_p2;
wire   [3:0] zext_ln66_5_fu_258_p1;
wire   [3:0] add_ln66_fu_262_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_150;
reg    ap_condition_157;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
end

CNN_mux_32_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .din2_WIDTH( 64 ),
    .din3_WIDTH( 2 ),
    .dout_WIDTH( 64 ))
mux_32_64_1_1_U191(
    .din0(line_buffer_9_load_2),
    .din1(line_buffer_10_load_3),
    .din2(line_buffer_11_load_3),
    .din3(select_ln63_3_fu_210_p3),
    .dout(tmp_18_fu_279_p5)
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
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter1_stage0),
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_150)) begin
        if (((select_ln63_fu_202_p3 == 2'd2) & (icmp_ln63_fu_172_p2 == 1'd0))) begin
            ap_phi_reg_pp0_iter2_cond73_i444_reg_126 <= tmp_18_fu_279_p5;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter2_cond73_i444_reg_126 <= ap_phi_reg_pp0_iter1_cond73_i444_reg_126;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            col_fu_64 <= 2'd0;
        end else if (((icmp_ln63_fu_172_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            col_fu_64 <= add_ln64_fu_299_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            indvar_flatten1771_fu_72 <= 4'd0;
        end else if (((icmp_ln63_fu_172_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            indvar_flatten1771_fu_72 <= add_ln63_fu_178_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            reuse_addr_reg_fu_56 <= 64'd18446744073709551615;
        end else if (((icmp_ln63_fu_172_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            reuse_addr_reg_fu_56 <= zext_ln66_6_fu_268_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            reuse_reg_fu_60 <= 64'd0;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            reuse_reg_fu_60 <= ap_phi_mux_cond73_i444_phi_fu_129_p6;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            row_fu_68 <= 2'd0;
        end else if (((icmp_ln63_fu_172_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            row_fu_68 <= select_ln63_3_fu_210_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~(select_ln63_fu_202_p3 == 2'd2) & ~(select_ln63_fu_202_p3 == 2'd1) & (icmp_ln63_fu_172_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        addr_cmp12_reg_424 <= addr_cmp12_fu_288_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((select_ln63_fu_202_p3 == 2'd1) & (icmp_ln63_fu_172_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        addr_cmp_reg_414 <= addr_cmp_fu_273_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_reg_pp0_iter1_cond73_i444_reg_126 <= ap_phi_reg_pp0_iter0_cond73_i444_reg_126;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln63_reg_391 <= icmp_ln63_fu_172_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln63_fu_172_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln63_reg_395 <= select_ln63_fu_202_p3;
        window_buffer_3_addr_2_reg_409 <= zext_ln66_6_fu_268_p1;
    end
end

always @ (*) begin
    if (((icmp_ln63_fu_172_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
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
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln63_reg_391 == 1'd0)) begin
        if ((select_ln63_reg_395 == 2'd1)) begin
            ap_phi_mux_cond73_i444_phi_fu_129_p6 = reuse_select_fu_320_p3;
        end else if ((~(select_ln63_reg_395 == 2'd1) & ~(select_ln63_reg_395 == 2'd2))) begin
            ap_phi_mux_cond73_i444_phi_fu_129_p6 = reuse_select13_fu_328_p3;
        end else begin
            ap_phi_mux_cond73_i444_phi_fu_129_p6 = ap_phi_reg_pp0_iter2_cond73_i444_reg_126;
        end
    end else begin
        ap_phi_mux_cond73_i444_phi_fu_129_p6 = ap_phi_reg_pp0_iter2_cond73_i444_reg_126;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_157)) begin
        if ((~(select_ln63_fu_202_p3 == 2'd2) & ~(select_ln63_fu_202_p3 == 2'd1))) begin
            window_buffer_3_address1 = p_cast_fu_242_p1;
        end else if ((select_ln63_fu_202_p3 == 2'd1)) begin
            window_buffer_3_address1 = p_cast1_fu_253_p1;
        end else begin
            window_buffer_3_address1 = 'bx;
        end
    end else begin
        window_buffer_3_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        window_buffer_3_ce0 = 1'b1;
    end else begin
        window_buffer_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((~(select_ln63_fu_202_p3 == 2'd2) & ~(select_ln63_fu_202_p3 == 2'd1) & (icmp_ln63_fu_172_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((select_ln63_fu_202_p3 == 2'd1) & (icmp_ln63_fu_172_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        window_buffer_3_ce1 = 1'b1;
    end else begin
        window_buffer_3_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        window_buffer_3_we0 = 1'b1;
    end else begin
        window_buffer_3_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln63_3_fu_190_p2 = (row_fu_68 + 2'd1);

assign add_ln63_fu_178_p2 = (indvar_flatten1771_fu_72 + 4'd1);

assign add_ln64_fu_299_p2 = (select_ln63_fu_202_p3 + 2'd1);

assign add_ln66_fu_262_p2 = (sub_ln66_fu_230_p2 + zext_ln66_5_fu_258_p1);

assign addr_cmp12_fu_288_p2 = ((reuse_addr_reg_fu_56 == p_cast_fu_242_p1) ? 1'b1 : 1'b0);

assign addr_cmp_fu_273_p2 = ((reuse_addr_reg_fu_56 == p_cast1_fu_253_p1) ? 1'b1 : 1'b0);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_150 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_157 = ((icmp_ln63_fu_172_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign ap_phi_reg_pp0_iter0_cond73_i444_reg_126 = 'bx;

assign empty_228_fu_236_p2 = (sub_ln66_fu_230_p2 + 4'd1);

assign empty_229_fu_247_p2 = (sub_ln66_fu_230_p2 + 4'd2);

assign icmp_ln63_fu_172_p2 = ((indvar_flatten1771_fu_72 == 4'd9) ? 1'b1 : 1'b0);

assign icmp_ln64_fu_196_p2 = ((col_fu_64 == 2'd3) ? 1'b1 : 1'b0);

assign p_cast1_fu_253_p1 = empty_229_fu_247_p2;

assign p_cast_fu_242_p1 = empty_228_fu_236_p2;

assign reuse_select13_fu_328_p3 = ((addr_cmp12_reg_424[0:0] == 1'b1) ? reuse_reg_fu_60 : window_buffer_3_q1);

assign reuse_select_fu_320_p3 = ((addr_cmp_reg_414[0:0] == 1'b1) ? reuse_reg_fu_60 : window_buffer_3_q1);

assign select_ln63_3_fu_210_p3 = ((icmp_ln64_fu_196_p2[0:0] == 1'b1) ? add_ln63_3_fu_190_p2 : row_fu_68);

assign select_ln63_fu_202_p3 = ((icmp_ln64_fu_196_p2[0:0] == 1'b1) ? 2'd0 : col_fu_64);

assign sub_ln66_fu_230_p2 = (tmp_s_fu_222_p3 - zext_ln66_fu_218_p1);

assign tmp_s_fu_222_p3 = {{select_ln63_3_fu_210_p3}, {2'd0}};

assign window_buffer_3_address0 = window_buffer_3_addr_2_reg_409;

assign window_buffer_3_d0 = ap_phi_mux_cond73_i444_phi_fu_129_p6;

assign zext_ln66_5_fu_258_p1 = select_ln63_fu_202_p3;

assign zext_ln66_6_fu_268_p1 = add_ln66_fu_262_p2;

assign zext_ln66_fu_218_p1 = select_ln63_3_fu_210_p3;

endmodule //CNN_CNN_Pipeline_VITIS_LOOP_63_7_VITIS_LOOP_64_823
