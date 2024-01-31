// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module CNN_control_r_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 8,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire [63:0]                   image_r,
    output wire [63:0]                   output_conv1,
    output wire [63:0]                   output_pooling1,
    output wire [63:0]                   output_conv2,
    output wire [63:0]                   output_pooling2,
    output wire [63:0]                   output_conv3,
    output wire [63:0]                   output_pooling3,
    output wire [63:0]                   output_conv4,
    output wire [63:0]                   output_upsampling1,
    output wire [63:0]                   output_conv5,
    output wire [63:0]                   output_upsampling2,
    output wire [63:0]                   output_conv6,
    output wire [63:0]                   output_upsampling3,
    output wire [63:0]                   output_conv7
);
//------------------------Address Info-------------------
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of image_r
//        bit 31~0 - image_r[31:0] (Read/Write)
// 0x14 : Data signal of image_r
//        bit 31~0 - image_r[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of output_conv1
//        bit 31~0 - output_conv1[31:0] (Read/Write)
// 0x20 : Data signal of output_conv1
//        bit 31~0 - output_conv1[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of output_pooling1
//        bit 31~0 - output_pooling1[31:0] (Read/Write)
// 0x2c : Data signal of output_pooling1
//        bit 31~0 - output_pooling1[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of output_conv2
//        bit 31~0 - output_conv2[31:0] (Read/Write)
// 0x38 : Data signal of output_conv2
//        bit 31~0 - output_conv2[63:32] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of output_pooling2
//        bit 31~0 - output_pooling2[31:0] (Read/Write)
// 0x44 : Data signal of output_pooling2
//        bit 31~0 - output_pooling2[63:32] (Read/Write)
// 0x48 : reserved
// 0x4c : Data signal of output_conv3
//        bit 31~0 - output_conv3[31:0] (Read/Write)
// 0x50 : Data signal of output_conv3
//        bit 31~0 - output_conv3[63:32] (Read/Write)
// 0x54 : reserved
// 0x58 : Data signal of output_pooling3
//        bit 31~0 - output_pooling3[31:0] (Read/Write)
// 0x5c : Data signal of output_pooling3
//        bit 31~0 - output_pooling3[63:32] (Read/Write)
// 0x60 : reserved
// 0x64 : Data signal of output_conv4
//        bit 31~0 - output_conv4[31:0] (Read/Write)
// 0x68 : Data signal of output_conv4
//        bit 31~0 - output_conv4[63:32] (Read/Write)
// 0x6c : reserved
// 0x70 : Data signal of output_upsampling1
//        bit 31~0 - output_upsampling1[31:0] (Read/Write)
// 0x74 : Data signal of output_upsampling1
//        bit 31~0 - output_upsampling1[63:32] (Read/Write)
// 0x78 : reserved
// 0x7c : Data signal of output_conv5
//        bit 31~0 - output_conv5[31:0] (Read/Write)
// 0x80 : Data signal of output_conv5
//        bit 31~0 - output_conv5[63:32] (Read/Write)
// 0x84 : reserved
// 0x88 : Data signal of output_upsampling2
//        bit 31~0 - output_upsampling2[31:0] (Read/Write)
// 0x8c : Data signal of output_upsampling2
//        bit 31~0 - output_upsampling2[63:32] (Read/Write)
// 0x90 : reserved
// 0x94 : Data signal of output_conv6
//        bit 31~0 - output_conv6[31:0] (Read/Write)
// 0x98 : Data signal of output_conv6
//        bit 31~0 - output_conv6[63:32] (Read/Write)
// 0x9c : reserved
// 0xa0 : Data signal of output_upsampling3
//        bit 31~0 - output_upsampling3[31:0] (Read/Write)
// 0xa4 : Data signal of output_upsampling3
//        bit 31~0 - output_upsampling3[63:32] (Read/Write)
// 0xa8 : reserved
// 0xac : Data signal of output_conv7
//        bit 31~0 - output_conv7[31:0] (Read/Write)
// 0xb0 : Data signal of output_conv7
//        bit 31~0 - output_conv7[63:32] (Read/Write)
// 0xb4 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_IMAGE_R_DATA_0            = 8'h10,
    ADDR_IMAGE_R_DATA_1            = 8'h14,
    ADDR_IMAGE_R_CTRL              = 8'h18,
    ADDR_OUTPUT_CONV1_DATA_0       = 8'h1c,
    ADDR_OUTPUT_CONV1_DATA_1       = 8'h20,
    ADDR_OUTPUT_CONV1_CTRL         = 8'h24,
    ADDR_OUTPUT_POOLING1_DATA_0    = 8'h28,
    ADDR_OUTPUT_POOLING1_DATA_1    = 8'h2c,
    ADDR_OUTPUT_POOLING1_CTRL      = 8'h30,
    ADDR_OUTPUT_CONV2_DATA_0       = 8'h34,
    ADDR_OUTPUT_CONV2_DATA_1       = 8'h38,
    ADDR_OUTPUT_CONV2_CTRL         = 8'h3c,
    ADDR_OUTPUT_POOLING2_DATA_0    = 8'h40,
    ADDR_OUTPUT_POOLING2_DATA_1    = 8'h44,
    ADDR_OUTPUT_POOLING2_CTRL      = 8'h48,
    ADDR_OUTPUT_CONV3_DATA_0       = 8'h4c,
    ADDR_OUTPUT_CONV3_DATA_1       = 8'h50,
    ADDR_OUTPUT_CONV3_CTRL         = 8'h54,
    ADDR_OUTPUT_POOLING3_DATA_0    = 8'h58,
    ADDR_OUTPUT_POOLING3_DATA_1    = 8'h5c,
    ADDR_OUTPUT_POOLING3_CTRL      = 8'h60,
    ADDR_OUTPUT_CONV4_DATA_0       = 8'h64,
    ADDR_OUTPUT_CONV4_DATA_1       = 8'h68,
    ADDR_OUTPUT_CONV4_CTRL         = 8'h6c,
    ADDR_OUTPUT_UPSAMPLING1_DATA_0 = 8'h70,
    ADDR_OUTPUT_UPSAMPLING1_DATA_1 = 8'h74,
    ADDR_OUTPUT_UPSAMPLING1_CTRL   = 8'h78,
    ADDR_OUTPUT_CONV5_DATA_0       = 8'h7c,
    ADDR_OUTPUT_CONV5_DATA_1       = 8'h80,
    ADDR_OUTPUT_CONV5_CTRL         = 8'h84,
    ADDR_OUTPUT_UPSAMPLING2_DATA_0 = 8'h88,
    ADDR_OUTPUT_UPSAMPLING2_DATA_1 = 8'h8c,
    ADDR_OUTPUT_UPSAMPLING2_CTRL   = 8'h90,
    ADDR_OUTPUT_CONV6_DATA_0       = 8'h94,
    ADDR_OUTPUT_CONV6_DATA_1       = 8'h98,
    ADDR_OUTPUT_CONV6_CTRL         = 8'h9c,
    ADDR_OUTPUT_UPSAMPLING3_DATA_0 = 8'ha0,
    ADDR_OUTPUT_UPSAMPLING3_DATA_1 = 8'ha4,
    ADDR_OUTPUT_UPSAMPLING3_CTRL   = 8'ha8,
    ADDR_OUTPUT_CONV7_DATA_0       = 8'hac,
    ADDR_OUTPUT_CONV7_DATA_1       = 8'hb0,
    ADDR_OUTPUT_CONV7_CTRL         = 8'hb4,
    WRIDLE                         = 2'd0,
    WRDATA                         = 2'd1,
    WRRESP                         = 2'd2,
    WRRESET                        = 2'd3,
    RDIDLE                         = 2'd0,
    RDDATA                         = 2'd1,
    RDRESET                        = 2'd2,
    ADDR_BITS                = 8;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg  [63:0]                   int_image_r = 'b0;
    reg  [63:0]                   int_output_conv1 = 'b0;
    reg  [63:0]                   int_output_pooling1 = 'b0;
    reg  [63:0]                   int_output_conv2 = 'b0;
    reg  [63:0]                   int_output_pooling2 = 'b0;
    reg  [63:0]                   int_output_conv3 = 'b0;
    reg  [63:0]                   int_output_pooling3 = 'b0;
    reg  [63:0]                   int_output_conv4 = 'b0;
    reg  [63:0]                   int_output_upsampling1 = 'b0;
    reg  [63:0]                   int_output_conv5 = 'b0;
    reg  [63:0]                   int_output_upsampling2 = 'b0;
    reg  [63:0]                   int_output_conv6 = 'b0;
    reg  [63:0]                   int_output_upsampling3 = 'b0;
    reg  [63:0]                   int_output_conv7 = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_IMAGE_R_DATA_0: begin
                    rdata <= int_image_r[31:0];
                end
                ADDR_IMAGE_R_DATA_1: begin
                    rdata <= int_image_r[63:32];
                end
                ADDR_OUTPUT_CONV1_DATA_0: begin
                    rdata <= int_output_conv1[31:0];
                end
                ADDR_OUTPUT_CONV1_DATA_1: begin
                    rdata <= int_output_conv1[63:32];
                end
                ADDR_OUTPUT_POOLING1_DATA_0: begin
                    rdata <= int_output_pooling1[31:0];
                end
                ADDR_OUTPUT_POOLING1_DATA_1: begin
                    rdata <= int_output_pooling1[63:32];
                end
                ADDR_OUTPUT_CONV2_DATA_0: begin
                    rdata <= int_output_conv2[31:0];
                end
                ADDR_OUTPUT_CONV2_DATA_1: begin
                    rdata <= int_output_conv2[63:32];
                end
                ADDR_OUTPUT_POOLING2_DATA_0: begin
                    rdata <= int_output_pooling2[31:0];
                end
                ADDR_OUTPUT_POOLING2_DATA_1: begin
                    rdata <= int_output_pooling2[63:32];
                end
                ADDR_OUTPUT_CONV3_DATA_0: begin
                    rdata <= int_output_conv3[31:0];
                end
                ADDR_OUTPUT_CONV3_DATA_1: begin
                    rdata <= int_output_conv3[63:32];
                end
                ADDR_OUTPUT_POOLING3_DATA_0: begin
                    rdata <= int_output_pooling3[31:0];
                end
                ADDR_OUTPUT_POOLING3_DATA_1: begin
                    rdata <= int_output_pooling3[63:32];
                end
                ADDR_OUTPUT_CONV4_DATA_0: begin
                    rdata <= int_output_conv4[31:0];
                end
                ADDR_OUTPUT_CONV4_DATA_1: begin
                    rdata <= int_output_conv4[63:32];
                end
                ADDR_OUTPUT_UPSAMPLING1_DATA_0: begin
                    rdata <= int_output_upsampling1[31:0];
                end
                ADDR_OUTPUT_UPSAMPLING1_DATA_1: begin
                    rdata <= int_output_upsampling1[63:32];
                end
                ADDR_OUTPUT_CONV5_DATA_0: begin
                    rdata <= int_output_conv5[31:0];
                end
                ADDR_OUTPUT_CONV5_DATA_1: begin
                    rdata <= int_output_conv5[63:32];
                end
                ADDR_OUTPUT_UPSAMPLING2_DATA_0: begin
                    rdata <= int_output_upsampling2[31:0];
                end
                ADDR_OUTPUT_UPSAMPLING2_DATA_1: begin
                    rdata <= int_output_upsampling2[63:32];
                end
                ADDR_OUTPUT_CONV6_DATA_0: begin
                    rdata <= int_output_conv6[31:0];
                end
                ADDR_OUTPUT_CONV6_DATA_1: begin
                    rdata <= int_output_conv6[63:32];
                end
                ADDR_OUTPUT_UPSAMPLING3_DATA_0: begin
                    rdata <= int_output_upsampling3[31:0];
                end
                ADDR_OUTPUT_UPSAMPLING3_DATA_1: begin
                    rdata <= int_output_upsampling3[63:32];
                end
                ADDR_OUTPUT_CONV7_DATA_0: begin
                    rdata <= int_output_conv7[31:0];
                end
                ADDR_OUTPUT_CONV7_DATA_1: begin
                    rdata <= int_output_conv7[63:32];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign image_r            = int_image_r;
assign output_conv1       = int_output_conv1;
assign output_pooling1    = int_output_pooling1;
assign output_conv2       = int_output_conv2;
assign output_pooling2    = int_output_pooling2;
assign output_conv3       = int_output_conv3;
assign output_pooling3    = int_output_pooling3;
assign output_conv4       = int_output_conv4;
assign output_upsampling1 = int_output_upsampling1;
assign output_conv5       = int_output_conv5;
assign output_upsampling2 = int_output_upsampling2;
assign output_conv6       = int_output_conv6;
assign output_upsampling3 = int_output_upsampling3;
assign output_conv7       = int_output_conv7;
// int_image_r[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_image_r[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IMAGE_R_DATA_0)
            int_image_r[31:0] <= (WDATA[31:0] & wmask) | (int_image_r[31:0] & ~wmask);
    end
end

// int_image_r[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_image_r[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IMAGE_R_DATA_1)
            int_image_r[63:32] <= (WDATA[31:0] & wmask) | (int_image_r[63:32] & ~wmask);
    end
end

// int_output_conv1[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_conv1[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_CONV1_DATA_0)
            int_output_conv1[31:0] <= (WDATA[31:0] & wmask) | (int_output_conv1[31:0] & ~wmask);
    end
end

// int_output_conv1[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_conv1[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_CONV1_DATA_1)
            int_output_conv1[63:32] <= (WDATA[31:0] & wmask) | (int_output_conv1[63:32] & ~wmask);
    end
end

// int_output_pooling1[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_pooling1[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_POOLING1_DATA_0)
            int_output_pooling1[31:0] <= (WDATA[31:0] & wmask) | (int_output_pooling1[31:0] & ~wmask);
    end
end

// int_output_pooling1[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_pooling1[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_POOLING1_DATA_1)
            int_output_pooling1[63:32] <= (WDATA[31:0] & wmask) | (int_output_pooling1[63:32] & ~wmask);
    end
end

// int_output_conv2[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_conv2[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_CONV2_DATA_0)
            int_output_conv2[31:0] <= (WDATA[31:0] & wmask) | (int_output_conv2[31:0] & ~wmask);
    end
end

// int_output_conv2[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_conv2[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_CONV2_DATA_1)
            int_output_conv2[63:32] <= (WDATA[31:0] & wmask) | (int_output_conv2[63:32] & ~wmask);
    end
end

// int_output_pooling2[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_pooling2[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_POOLING2_DATA_0)
            int_output_pooling2[31:0] <= (WDATA[31:0] & wmask) | (int_output_pooling2[31:0] & ~wmask);
    end
end

// int_output_pooling2[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_pooling2[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_POOLING2_DATA_1)
            int_output_pooling2[63:32] <= (WDATA[31:0] & wmask) | (int_output_pooling2[63:32] & ~wmask);
    end
end

// int_output_conv3[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_conv3[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_CONV3_DATA_0)
            int_output_conv3[31:0] <= (WDATA[31:0] & wmask) | (int_output_conv3[31:0] & ~wmask);
    end
end

// int_output_conv3[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_conv3[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_CONV3_DATA_1)
            int_output_conv3[63:32] <= (WDATA[31:0] & wmask) | (int_output_conv3[63:32] & ~wmask);
    end
end

// int_output_pooling3[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_pooling3[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_POOLING3_DATA_0)
            int_output_pooling3[31:0] <= (WDATA[31:0] & wmask) | (int_output_pooling3[31:0] & ~wmask);
    end
end

// int_output_pooling3[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_pooling3[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_POOLING3_DATA_1)
            int_output_pooling3[63:32] <= (WDATA[31:0] & wmask) | (int_output_pooling3[63:32] & ~wmask);
    end
end

// int_output_conv4[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_conv4[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_CONV4_DATA_0)
            int_output_conv4[31:0] <= (WDATA[31:0] & wmask) | (int_output_conv4[31:0] & ~wmask);
    end
end

// int_output_conv4[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_conv4[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_CONV4_DATA_1)
            int_output_conv4[63:32] <= (WDATA[31:0] & wmask) | (int_output_conv4[63:32] & ~wmask);
    end
end

// int_output_upsampling1[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_upsampling1[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_UPSAMPLING1_DATA_0)
            int_output_upsampling1[31:0] <= (WDATA[31:0] & wmask) | (int_output_upsampling1[31:0] & ~wmask);
    end
end

// int_output_upsampling1[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_upsampling1[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_UPSAMPLING1_DATA_1)
            int_output_upsampling1[63:32] <= (WDATA[31:0] & wmask) | (int_output_upsampling1[63:32] & ~wmask);
    end
end

// int_output_conv5[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_conv5[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_CONV5_DATA_0)
            int_output_conv5[31:0] <= (WDATA[31:0] & wmask) | (int_output_conv5[31:0] & ~wmask);
    end
end

// int_output_conv5[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_conv5[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_CONV5_DATA_1)
            int_output_conv5[63:32] <= (WDATA[31:0] & wmask) | (int_output_conv5[63:32] & ~wmask);
    end
end

// int_output_upsampling2[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_upsampling2[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_UPSAMPLING2_DATA_0)
            int_output_upsampling2[31:0] <= (WDATA[31:0] & wmask) | (int_output_upsampling2[31:0] & ~wmask);
    end
end

// int_output_upsampling2[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_upsampling2[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_UPSAMPLING2_DATA_1)
            int_output_upsampling2[63:32] <= (WDATA[31:0] & wmask) | (int_output_upsampling2[63:32] & ~wmask);
    end
end

// int_output_conv6[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_conv6[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_CONV6_DATA_0)
            int_output_conv6[31:0] <= (WDATA[31:0] & wmask) | (int_output_conv6[31:0] & ~wmask);
    end
end

// int_output_conv6[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_conv6[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_CONV6_DATA_1)
            int_output_conv6[63:32] <= (WDATA[31:0] & wmask) | (int_output_conv6[63:32] & ~wmask);
    end
end

// int_output_upsampling3[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_upsampling3[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_UPSAMPLING3_DATA_0)
            int_output_upsampling3[31:0] <= (WDATA[31:0] & wmask) | (int_output_upsampling3[31:0] & ~wmask);
    end
end

// int_output_upsampling3[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_upsampling3[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_UPSAMPLING3_DATA_1)
            int_output_upsampling3[63:32] <= (WDATA[31:0] & wmask) | (int_output_upsampling3[63:32] & ~wmask);
    end
end

// int_output_conv7[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_conv7[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_CONV7_DATA_0)
            int_output_conv7[31:0] <= (WDATA[31:0] & wmask) | (int_output_conv7[31:0] & ~wmask);
    end
end

// int_output_conv7[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_output_conv7[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OUTPUT_CONV7_DATA_1)
            int_output_conv7[63:32] <= (WDATA[31:0] & wmask) | (int_output_conv7[63:32] & ~wmask);
    end
end


//------------------------Memory logic-------------------

endmodule
