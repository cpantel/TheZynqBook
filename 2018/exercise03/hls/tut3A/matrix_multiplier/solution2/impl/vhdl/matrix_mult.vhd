-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity matrix_mult is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    a_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
    a_ce0 : OUT STD_LOGIC;
    a_q0 : IN STD_LOGIC_VECTOR (7 downto 0);
    b_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
    b_ce0 : OUT STD_LOGIC;
    b_q0 : IN STD_LOGIC_VECTOR (7 downto 0);
    prod_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
    prod_ce0 : OUT STD_LOGIC;
    prod_we0 : OUT STD_LOGIC;
    prod_d0 : OUT STD_LOGIC_VECTOR (15 downto 0);
    prod_q0 : IN STD_LOGIC_VECTOR (15 downto 0) );
end;


architecture behav of matrix_mult is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "matrix_mult,hls_ip_2018_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.664000,HLS_SYN_LAT=426,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=1,HLS_SYN_FF=66,HLS_SYN_LUT=285,HLS_VERSION=2018_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (6 downto 0) := "0000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (6 downto 0) := "0000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (6 downto 0) := "0001000";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (6 downto 0) := "0010000";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (6 downto 0) := "0100000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv5_19 : STD_LOGIC_VECTOR (4 downto 0) := "11001";
    constant ap_const_lv5_1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv3_5 : STD_LOGIC_VECTOR (2 downto 0) := "101";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal k_reg_133 : STD_LOGIC_VECTOR (2 downto 0);
    signal indvar_flatten_next_fu_150_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal indvar_flatten_next_reg_294 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal j_mid2_fu_168_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal j_mid2_reg_299 : STD_LOGIC_VECTOR (2 downto 0);
    signal exitcond_flatten_fu_144_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_mid2_v_fu_176_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_mid2_v_reg_305 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_1_fu_198_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_1_reg_312 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal tmp_2_cast_fu_204_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_2_cast_reg_318 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal prod_addr_reg_323 : STD_LOGIC_VECTOR (4 downto 0);
    signal exitcond_fu_217_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond_reg_328 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_block_state5_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state7_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state9_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal exitcond_reg_328_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal k_1_fu_223_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal k_1_reg_332 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal tmp_2_fu_233_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_2_reg_337 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_11_fu_256_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_11_reg_342 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_block_state6_pp0_stage1_iter0 : BOOLEAN;
    signal ap_block_state8_pp0_stage1_iter1 : BOOLEAN;
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal j_1_fu_277_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state5 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal indvar_flatten_reg_100 : STD_LOGIC_VECTOR (4 downto 0);
    signal i_reg_111 : STD_LOGIC_VECTOR (2 downto 0);
    signal j_reg_122 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_phi_mux_k_phi_fu_137_p4 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal tmp_10_cast_fu_212_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_11_cast_fu_261_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal tmp_14_cast_fu_265_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_282_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal exitcond1_fu_162_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_1_fu_156_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_fu_187_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_mid2_cast_fu_184_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal p_shl_cast_fu_194_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_s_fu_207_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_4_cast_fu_229_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_4_fu_238_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal p_shl1_cast_fu_246_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_10_fu_250_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;

    component matrix_mult_mac_mbkb IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        din2 : IN STD_LOGIC_VECTOR (15 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;



begin
    matrix_mult_mac_mbkb_U1 : component matrix_mult_mac_mbkb
    generic map (
        ID => 1,
        NUM_STAGE => 3,
        din0_WIDTH => 8,
        din1_WIDTH => 8,
        din2_WIDTH => 16,
        dout_WIDTH => 16)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => b_q0,
        din1 => a_q0,
        din2 => prod_q0,
        ce => ap_const_logic_1,
        dout => grp_fu_282_p3);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state5) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone))) then
                    if ((ap_const_logic_1 = ap_condition_pp0_exit_iter0_state5)) then 
                        ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state5);
                    elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                        ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) or ((ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone)))) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_reg_111_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
                i_reg_111 <= tmp_mid2_v_reg_305;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                i_reg_111 <= ap_const_lv3_0;
            end if; 
        end if;
    end process;

    indvar_flatten_reg_100_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
                indvar_flatten_reg_100 <= indvar_flatten_next_reg_294;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                indvar_flatten_reg_100 <= ap_const_lv5_0;
            end if; 
        end if;
    end process;

    j_reg_122_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
                j_reg_122 <= j_1_fu_277_p2;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                j_reg_122 <= ap_const_lv3_0;
            end if; 
        end if;
    end process;

    k_reg_133_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (exitcond_reg_328 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                k_reg_133 <= k_1_reg_332;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                k_reg_133 <= ap_const_lv3_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                exitcond_reg_328 <= exitcond_fu_217_p2;
                exitcond_reg_328_pp0_iter1_reg <= exitcond_reg_328;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                indvar_flatten_next_reg_294 <= indvar_flatten_next_fu_150_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond_flatten_fu_144_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                j_mid2_reg_299 <= j_mid2_fu_168_p3;
                tmp_mid2_v_reg_305 <= tmp_mid2_v_fu_176_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                k_1_reg_332 <= k_1_fu_223_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                prod_addr_reg_323 <= tmp_10_cast_fu_212_p1(5 - 1 downto 0);
                    tmp_2_cast_reg_318(2 downto 0) <= tmp_2_cast_fu_204_p1(2 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (exitcond_fu_217_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                tmp_11_reg_342 <= tmp_11_fu_256_p2;
                tmp_2_reg_337 <= tmp_2_fu_233_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                tmp_1_reg_312 <= tmp_1_fu_198_p2;
            end if;
        end if;
    end process;
    tmp_2_cast_reg_318(5 downto 3) <= "000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, exitcond_flatten_fu_144_p2, exitcond_fu_217_p2, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, ap_enable_reg_pp0_iter1, ap_block_pp0_stage1_subdone, ap_enable_reg_pp0_iter2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((exitcond_flatten_fu_144_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((exitcond_fu_217_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) and not(((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                elsif ((((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) or ((exitcond_fu_217_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)))) then
                    ap_NS_fsm <= ap_ST_fsm_state10;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when others =>  
                ap_NS_fsm <= "XXXXXXX";
        end case;
    end process;
    a_address0 <= tmp_11_cast_fu_261_p1(5 - 1 downto 0);

    a_ce0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001))) then 
            a_ce0 <= ap_const_logic_1;
        else 
            a_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(4);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(5);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(6);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage1_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state7_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state8_pp0_stage1_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state9_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_pp0_exit_iter0_state5_assign_proc : process(exitcond_fu_217_p2)
    begin
        if ((exitcond_fu_217_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state5 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state5 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_state2, exitcond_flatten_fu_144_p2)
    begin
        if (((exitcond_flatten_fu_144_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_k_phi_fu_137_p4_assign_proc : process(k_reg_133, exitcond_reg_328, ap_CS_fsm_pp0_stage0, k_1_reg_332, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
        if (((exitcond_reg_328 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_phi_mux_k_phi_fu_137_p4 <= k_1_reg_332;
        else 
            ap_phi_mux_k_phi_fu_137_p4 <= k_reg_133;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, exitcond_flatten_fu_144_p2)
    begin
        if (((exitcond_flatten_fu_144_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    b_address0 <= tmp_14_cast_fu_265_p1(5 - 1 downto 0);

    b_ce0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001))) then 
            b_ce0 <= ap_const_logic_1;
        else 
            b_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    exitcond1_fu_162_p2 <= "1" when (j_reg_122 = ap_const_lv3_5) else "0";
    exitcond_flatten_fu_144_p2 <= "1" when (indvar_flatten_reg_100 = ap_const_lv5_19) else "0";
    exitcond_fu_217_p2 <= "1" when (ap_phi_mux_k_phi_fu_137_p4 = ap_const_lv3_5) else "0";
    i_1_fu_156_p2 <= std_logic_vector(unsigned(i_reg_111) + unsigned(ap_const_lv3_1));
    indvar_flatten_next_fu_150_p2 <= std_logic_vector(unsigned(indvar_flatten_reg_100) + unsigned(ap_const_lv5_1));
    j_1_fu_277_p2 <= std_logic_vector(unsigned(j_mid2_reg_299) + unsigned(ap_const_lv3_1));
    j_mid2_fu_168_p3 <= 
        ap_const_lv3_0 when (exitcond1_fu_162_p2(0) = '1') else 
        j_reg_122;
    k_1_fu_223_p2 <= std_logic_vector(unsigned(ap_phi_mux_k_phi_fu_137_p4) + unsigned(ap_const_lv3_1));
    p_shl1_cast_fu_246_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_4_fu_238_p3),6));
    p_shl_cast_fu_194_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_fu_187_p3),6));

    prod_address0_assign_proc : process(ap_CS_fsm_state4, prod_addr_reg_323, ap_CS_fsm_pp0_stage0, ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_block_pp0_stage0, tmp_10_cast_fu_212_p1, ap_block_pp0_stage1)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1)))) then 
            prod_address0 <= prod_addr_reg_323;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            prod_address0 <= tmp_10_cast_fu_212_p1(5 - 1 downto 0);
        else 
            prod_address0 <= "XXXXX";
        end if; 
    end process;


    prod_ce0_assign_proc : process(ap_CS_fsm_state4, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001)))) then 
            prod_ce0 <= ap_const_logic_1;
        else 
            prod_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    prod_d0_assign_proc : process(ap_CS_fsm_state4, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter2, ap_block_pp0_stage0, grp_fu_282_p3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            prod_d0 <= grp_fu_282_p3;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            prod_d0 <= ap_const_lv16_0;
        else 
            prod_d0 <= "XXXXXXXXXXXXXXXX";
        end if; 
    end process;


    prod_we0_assign_proc : process(ap_CS_fsm_state4, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, exitcond_reg_328_pp0_iter1_reg, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (exitcond_reg_328_pp0_iter1_reg = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)))) then 
            prod_we0 <= ap_const_logic_1;
        else 
            prod_we0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_10_cast_fu_212_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_s_fu_207_p2),64));
    tmp_10_fu_250_p2 <= std_logic_vector(unsigned(tmp_4_cast_fu_229_p1) + unsigned(p_shl1_cast_fu_246_p1));
    tmp_11_cast_fu_261_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_2_reg_337),64));
    tmp_11_fu_256_p2 <= std_logic_vector(unsigned(tmp_10_fu_250_p2) + unsigned(tmp_2_cast_reg_318));
    tmp_14_cast_fu_265_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_11_reg_342),64));
    tmp_1_fu_198_p2 <= std_logic_vector(unsigned(tmp_mid2_cast_fu_184_p1) + unsigned(p_shl_cast_fu_194_p1));
    tmp_2_cast_fu_204_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(j_mid2_reg_299),6));
    tmp_2_fu_233_p2 <= std_logic_vector(unsigned(tmp_1_reg_312) + unsigned(tmp_4_cast_fu_229_p1));
    tmp_4_cast_fu_229_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_phi_mux_k_phi_fu_137_p4),6));
    tmp_4_fu_238_p3 <= (ap_phi_mux_k_phi_fu_137_p4 & ap_const_lv2_0);
    tmp_fu_187_p3 <= (tmp_mid2_v_reg_305 & ap_const_lv2_0);
    tmp_mid2_cast_fu_184_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_mid2_v_reg_305),6));
    tmp_mid2_v_fu_176_p3 <= 
        i_1_fu_156_p2 when (exitcond1_fu_162_p2(0) = '1') else 
        i_reg_111;
    tmp_s_fu_207_p2 <= std_logic_vector(unsigned(tmp_1_reg_312) + unsigned(tmp_2_cast_fu_204_p1));
end behav;