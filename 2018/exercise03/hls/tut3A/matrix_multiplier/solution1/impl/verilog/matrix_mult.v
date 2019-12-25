// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="matrix_mult,hls_ip_2018_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.492500,HLS_SYN_LAT=686,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=1,HLS_SYN_FF=68,HLS_SYN_LUT=204,HLS_VERSION=2018_2}" *)

module matrix_mult (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        a_address0,
        a_ce0,
        a_q0,
        b_address0,
        b_ce0,
        b_q0,
        prod_address0,
        prod_ce0,
        prod_we0,
        prod_d0
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_state3 = 8'd4;
parameter    ap_ST_fsm_state4 = 8'd8;
parameter    ap_ST_fsm_state5 = 8'd16;
parameter    ap_ST_fsm_state6 = 8'd32;
parameter    ap_ST_fsm_state7 = 8'd64;
parameter    ap_ST_fsm_state8 = 8'd128;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [4:0] a_address0;
output   a_ce0;
input  [7:0] a_q0;
output  [4:0] b_address0;
output   b_ce0;
input  [7:0] b_q0;
output  [4:0] prod_address0;
output   prod_ce0;
output   prod_we0;
output  [15:0] prod_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg a_ce0;
reg b_ce0;
reg prod_ce0;
reg prod_we0;

(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [2:0] i_1_fu_132_p2;
reg   [2:0] i_1_reg_257;
wire    ap_CS_fsm_state2;
wire   [5:0] tmp_s_fu_154_p2;
reg   [5:0] tmp_s_reg_262;
wire   [0:0] exitcond2_fu_126_p2;
wire   [2:0] j_1_fu_166_p2;
reg   [2:0] j_1_reg_271;
wire    ap_CS_fsm_state3;
wire   [5:0] tmp_2_cast_fu_172_p1;
reg   [5:0] tmp_2_cast_reg_276;
wire   [0:0] exitcond1_fu_160_p2;
reg   [4:0] prod_addr_reg_281;
wire   [2:0] k_1_fu_192_p2;
reg   [2:0] k_1_reg_289;
wire    ap_CS_fsm_state4;
wire   [5:0] tmp_4_fu_202_p2;
reg   [5:0] tmp_4_reg_294;
wire   [0:0] exitcond_fu_186_p2;
wire   [5:0] tmp_12_fu_225_p2;
reg   [5:0] tmp_12_reg_299;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
wire  signed [15:0] grp_fu_246_p3;
wire    ap_CS_fsm_state8;
reg   [2:0] i_reg_80;
reg   [2:0] j_reg_91;
reg   [15:0] prod_load_reg_102;
reg   [2:0] k_reg_115;
wire   [63:0] tmp_11_cast_fu_181_p1;
wire   [63:0] tmp_12_cast_fu_230_p1;
wire   [63:0] tmp_15_cast_fu_234_p1;
wire   [4:0] tmp_9_fu_142_p3;
wire   [5:0] tmp_cast_fu_138_p1;
wire   [5:0] p_shl_cast_fu_150_p1;
wire   [5:0] tmp_2_fu_176_p2;
wire   [5:0] tmp_4_cast_fu_198_p1;
wire   [4:0] tmp_10_fu_207_p3;
wire   [5:0] p_shl1_cast_fu_215_p1;
wire   [5:0] tmp_11_fu_219_p2;
reg   [7:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
end

matrix_mult_mac_mbkb #(
    .ID( 1 ),
    .NUM_STAGE( 3 ),
    .din0_WIDTH( 8 ),
    .din1_WIDTH( 8 ),
    .din2_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
matrix_mult_mac_mbkb_U1(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(b_q0),
    .din1(a_q0),
    .din2(prod_load_reg_102),
    .ce(1'b1),
    .dout(grp_fu_246_p3)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond1_fu_160_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        i_reg_80 <= i_1_reg_257;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_80 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_fu_186_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        j_reg_91 <= j_1_reg_271;
    end else if (((exitcond2_fu_126_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        j_reg_91 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        k_reg_115 <= k_1_reg_289;
    end else if (((exitcond1_fu_160_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        k_reg_115 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        prod_load_reg_102 <= grp_fu_246_p3;
    end else if (((exitcond1_fu_160_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        prod_load_reg_102 <= 16'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_1_reg_257 <= i_1_fu_132_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        j_1_reg_271 <= j_1_fu_166_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        k_1_reg_289 <= k_1_fu_192_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond1_fu_160_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        prod_addr_reg_281 <= tmp_11_cast_fu_181_p1;
        tmp_2_cast_reg_276[2 : 0] <= tmp_2_cast_fu_172_p1[2 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_fu_186_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        tmp_12_reg_299 <= tmp_12_fu_225_p2;
        tmp_4_reg_294 <= tmp_4_fu_202_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond2_fu_126_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_s_reg_262 <= tmp_s_fu_154_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        a_ce0 = 1'b1;
    end else begin
        a_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond2_fu_126_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond2_fu_126_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        b_ce0 = 1'b1;
    end else begin
        b_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        prod_ce0 = 1'b1;
    end else begin
        prod_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        prod_we0 = 1'b1;
    end else begin
        prod_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((exitcond2_fu_126_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((exitcond1_fu_160_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((exitcond_fu_186_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign a_address0 = tmp_12_cast_fu_230_p1;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign b_address0 = tmp_15_cast_fu_234_p1;

assign exitcond1_fu_160_p2 = ((j_reg_91 == 3'd5) ? 1'b1 : 1'b0);

assign exitcond2_fu_126_p2 = ((i_reg_80 == 3'd5) ? 1'b1 : 1'b0);

assign exitcond_fu_186_p2 = ((k_reg_115 == 3'd5) ? 1'b1 : 1'b0);

assign i_1_fu_132_p2 = (i_reg_80 + 3'd1);

assign j_1_fu_166_p2 = (j_reg_91 + 3'd1);

assign k_1_fu_192_p2 = (k_reg_115 + 3'd1);

assign p_shl1_cast_fu_215_p1 = tmp_10_fu_207_p3;

assign p_shl_cast_fu_150_p1 = tmp_9_fu_142_p3;

assign prod_address0 = prod_addr_reg_281;

assign prod_d0 = prod_load_reg_102;

assign tmp_10_fu_207_p3 = {{k_reg_115}, {2'd0}};

assign tmp_11_cast_fu_181_p1 = tmp_2_fu_176_p2;

assign tmp_11_fu_219_p2 = (tmp_4_cast_fu_198_p1 + p_shl1_cast_fu_215_p1);

assign tmp_12_cast_fu_230_p1 = tmp_4_reg_294;

assign tmp_12_fu_225_p2 = (tmp_11_fu_219_p2 + tmp_2_cast_reg_276);

assign tmp_15_cast_fu_234_p1 = tmp_12_reg_299;

assign tmp_2_cast_fu_172_p1 = j_reg_91;

assign tmp_2_fu_176_p2 = (tmp_s_reg_262 + tmp_2_cast_fu_172_p1);

assign tmp_4_cast_fu_198_p1 = k_reg_115;

assign tmp_4_fu_202_p2 = (tmp_s_reg_262 + tmp_4_cast_fu_198_p1);

assign tmp_9_fu_142_p3 = {{i_reg_80}, {2'd0}};

assign tmp_cast_fu_138_p1 = i_reg_80;

assign tmp_s_fu_154_p2 = (tmp_cast_fu_138_p1 + p_shl_cast_fu_150_p1);

always @ (posedge ap_clk) begin
    tmp_2_cast_reg_276[5:3] <= 3'b000;
end

endmodule //matrix_mult
