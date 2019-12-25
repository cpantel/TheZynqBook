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
    prod_d0 : OUT STD_LOGIC_VECTOR (15 downto 0) );
end;


architecture behav of matrix_mult is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "matrix_mult,hls_ip_2018_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.492500,HLS_SYN_LAT=686,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=1,HLS_SYN_FF=68,HLS_SYN_LUT=204,HLS_VERSION=2018_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (7 downto 0) := "00000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (7 downto 0) := "00000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (7 downto 0) := "00001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (7 downto 0) := "00010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (7 downto 0) := "00100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (7 downto 0) := "01000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv3_5 : STD_LOGIC_VECTOR (2 downto 0) := "101";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal i_1_fu_132_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal i_1_reg_257 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal tmp_s_fu_154_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_s_reg_262 : STD_LOGIC_VECTOR (5 downto 0);
    signal exitcond2_fu_126_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal j_1_fu_166_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal j_1_reg_271 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal tmp_2_cast_fu_172_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_2_cast_reg_276 : STD_LOGIC_VECTOR (5 downto 0);
    signal exitcond1_fu_160_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal prod_addr_reg_281 : STD_LOGIC_VECTOR (4 downto 0);
    signal k_1_fu_192_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal k_1_reg_289 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal tmp_4_fu_202_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_4_reg_294 : STD_LOGIC_VECTOR (5 downto 0);
    signal exitcond_fu_186_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_12_fu_225_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_12_reg_299 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal grp_fu_246_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal i_reg_80 : STD_LOGIC_VECTOR (2 downto 0);
    signal j_reg_91 : STD_LOGIC_VECTOR (2 downto 0);
    signal prod_load_reg_102 : STD_LOGIC_VECTOR (15 downto 0);
    signal k_reg_115 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_11_cast_fu_181_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_12_cast_fu_230_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_15_cast_fu_234_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_9_fu_142_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_cast_fu_138_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal p_shl_cast_fu_150_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_2_fu_176_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_4_cast_fu_198_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_10_fu_207_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal p_shl1_cast_fu_215_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_11_fu_219_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (7 downto 0);

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
        din2 => prod_load_reg_102,
        ce => ap_const_logic_1,
        dout => grp_fu_246_p3);





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


    i_reg_80_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond1_fu_160_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                i_reg_80 <= i_1_reg_257;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                i_reg_80 <= ap_const_lv3_0;
            end if; 
        end if;
    end process;

    j_reg_91_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond_fu_186_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
                j_reg_91 <= j_1_reg_271;
            elsif (((exitcond2_fu_126_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                j_reg_91 <= ap_const_lv3_0;
            end if; 
        end if;
    end process;

    k_reg_115_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
                k_reg_115 <= k_1_reg_289;
            elsif (((exitcond1_fu_160_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                k_reg_115 <= ap_const_lv3_0;
            end if; 
        end if;
    end process;

    prod_load_reg_102_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
                prod_load_reg_102 <= grp_fu_246_p3;
            elsif (((exitcond1_fu_160_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                prod_load_reg_102 <= ap_const_lv16_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                i_1_reg_257 <= i_1_fu_132_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                j_1_reg_271 <= j_1_fu_166_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                k_1_reg_289 <= k_1_fu_192_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond1_fu_160_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                prod_addr_reg_281 <= tmp_11_cast_fu_181_p1(5 - 1 downto 0);
                    tmp_2_cast_reg_276(2 downto 0) <= tmp_2_cast_fu_172_p1(2 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond_fu_186_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                tmp_12_reg_299 <= tmp_12_fu_225_p2;
                tmp_4_reg_294 <= tmp_4_fu_202_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond2_fu_126_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                tmp_s_reg_262 <= tmp_s_fu_154_p2;
            end if;
        end if;
    end process;
    tmp_2_cast_reg_276(5 downto 3) <= "000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, exitcond2_fu_126_p2, ap_CS_fsm_state3, exitcond1_fu_160_p2, ap_CS_fsm_state4, exitcond_fu_186_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((exitcond2_fu_126_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                if (((exitcond1_fu_160_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state4 => 
                if (((exitcond_fu_186_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when others =>  
                ap_NS_fsm <= "XXXXXXXX";
        end case;
    end process;
    a_address0 <= tmp_12_cast_fu_230_p1(5 - 1 downto 0);

    a_ce0_assign_proc : process(ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            a_ce0 <= ap_const_logic_1;
        else 
            a_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);

    ap_done_assign_proc : process(ap_CS_fsm_state2, exitcond2_fu_126_p2)
    begin
        if (((exitcond2_fu_126_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, exitcond2_fu_126_p2)
    begin
        if (((exitcond2_fu_126_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    b_address0 <= tmp_15_cast_fu_234_p1(5 - 1 downto 0);

    b_ce0_assign_proc : process(ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            b_ce0 <= ap_const_logic_1;
        else 
            b_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    exitcond1_fu_160_p2 <= "1" when (j_reg_91 = ap_const_lv3_5) else "0";
    exitcond2_fu_126_p2 <= "1" when (i_reg_80 = ap_const_lv3_5) else "0";
    exitcond_fu_186_p2 <= "1" when (k_reg_115 = ap_const_lv3_5) else "0";
    i_1_fu_132_p2 <= std_logic_vector(unsigned(i_reg_80) + unsigned(ap_const_lv3_1));
    j_1_fu_166_p2 <= std_logic_vector(unsigned(j_reg_91) + unsigned(ap_const_lv3_1));
    k_1_fu_192_p2 <= std_logic_vector(unsigned(k_reg_115) + unsigned(ap_const_lv3_1));
    p_shl1_cast_fu_215_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_10_fu_207_p3),6));
    p_shl_cast_fu_150_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_9_fu_142_p3),6));
    prod_address0 <= prod_addr_reg_281;

    prod_ce0_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            prod_ce0 <= ap_const_logic_1;
        else 
            prod_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    prod_d0 <= prod_load_reg_102;

    prod_we0_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            prod_we0 <= ap_const_logic_1;
        else 
            prod_we0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_10_fu_207_p3 <= (k_reg_115 & ap_const_lv2_0);
    tmp_11_cast_fu_181_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_2_fu_176_p2),64));
    tmp_11_fu_219_p2 <= std_logic_vector(unsigned(tmp_4_cast_fu_198_p1) + unsigned(p_shl1_cast_fu_215_p1));
    tmp_12_cast_fu_230_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_4_reg_294),64));
    tmp_12_fu_225_p2 <= std_logic_vector(unsigned(tmp_11_fu_219_p2) + unsigned(tmp_2_cast_reg_276));
    tmp_15_cast_fu_234_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_12_reg_299),64));
    tmp_2_cast_fu_172_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(j_reg_91),6));
    tmp_2_fu_176_p2 <= std_logic_vector(unsigned(tmp_s_reg_262) + unsigned(tmp_2_cast_fu_172_p1));
    tmp_4_cast_fu_198_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(k_reg_115),6));
    tmp_4_fu_202_p2 <= std_logic_vector(unsigned(tmp_s_reg_262) + unsigned(tmp_4_cast_fu_198_p1));
    tmp_9_fu_142_p3 <= (i_reg_80 & ap_const_lv2_0);
    tmp_cast_fu_138_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_reg_80),6));
    tmp_s_fu_154_p2 <= std_logic_vector(unsigned(tmp_cast_fu_138_p1) + unsigned(p_shl_cast_fu_150_p1));
end behav;
