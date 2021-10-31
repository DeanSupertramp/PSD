----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2021 13:13:54
-- Design Name: 
-- Module Name: pixel_final_sum - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity pixel_final_sum is
port( PP0,PP1,PP2: in  STD_LOGIC_VECTOR(23 DOWNTO 0);
      PP3,PP4,PP5: in  STD_LOGIC_VECTOR(23 DOWNTO 0);
      PP6,PP7,PP8: in  STD_LOGIC_VECTOR(23 DOWNTO 0);
      SIMD:        in  STD_LOGIC;
      RST:         in  STD_LOGIC;
      CLK:         in  STD_LOGIC;
      CE:          in  STD_LOGIC;
      Pixel_out_32:   out STD_LOGIC_VECTOR(31 DOWNTO 0));
end pixel_final_sum;


architecture Behavioral of pixel_final_sum is

SIGNAL PIXEL_OUT:STD_LOGIC_VECTOR(31 DOWNTO 0);
--- 4 out mux LSB da 13  (SIMD 0: ESTENDO CON 0 NELLA POS>12, SIMD 1: COSI COM'è)

-- ingressi splittati
signal PP0M,PP0L,PP1M,PP1L,PP2M,PP2L,PP3M,PP3L,PP4M,PP4L,PP5M,PP5L,PP6M,PP6L,PP7M,PP7L,PP8M,PP8L: std_logic_vector(11 downto 0);
signal am_pp7,am_pp8,aL_pp7,aL_pp8,a_pp7,a_pp8: std_logic_vector (11 downto 0);


-- in sommmatori estesi con segno
signal E_PP0M,E_PP1M,E_PP2M,E_PP0L,E_PP1L,E_PP2L,E_PP3L,E_PP3M,E_PP5M: std_logic_vector(12 downto 0);
signal E_PP4M,E_PP4L,E_PP5L,E_PP6M,E_PP6L,E_PP7M,E_PP8M,E_PP8L: std_logic_vector(12 downto 0);

signal mux_1,mux_2,mux_3,mux_4,mux_5,mux_6,mux_7: std_logic_vector (11 downto 0);
SIGNAL E_mux_1,E_mux_2,E_mux_3,E_mux_4,E_mux_5,E_mux_6,E_MUX_7: std_logic_vector (12 downto 0);

--out sommatori
signal PM_0,PL_0,PM_1,PL_1,PM_2,PL_2,PM_3,PL_3 : std_logic_vector (12 downto 0);
signal pmuxL0,pmuxL1,pmuxL2,pmuxL3,pm_L0,pm_l1,pm_l2,pm_l3: std_logic_vector(12 downto 0);

-- registri
signal PM_0_REG,PL_0_REG,PM_1_REG,PL_1_REG,PM_2_REG,PL_2_REG,PM_3_REG,PL_3_REG: std_logic_vector(12 downto 0);
signal pp7_reg_lvl2,pp7_reg_lvl3,pp7_reg_lvl4,pp8_reg_lvL2,pp8_reg_lvl3,pP8_reg_lvl4: std_logic_vector(11 downto 0);
signal r_pp7,r_pp8: std_logic_vector(11 downto 0);

----                                  """ LIVELLO 2 """
signal PMM_0,PLL_0,PMM_1,PLL_1,PMM_2,PMM_3,PLL_2,PLL_3: std_logic_vector(13 downto 0);
signal E_PMM_0,E_PLL_0,E_PMM_1,E_PLL_1,E_PMM_2,E_PMM_3,E_PLL_2,E_PLL_3: std_logic_vector(13 downto 0);
signal PMM_0_REG,PLL_0_REG,PMM_1_REG,PLL_1_REG: std_logic_vector(13 downto 0);
SIGNAL LSB0_LVL2,LSB1_LVL2,LMUX0_LVL2,LMUX1_LVL2: std_logic_vector (13 downto 0);

--                                    """ LIVELLO 3 """
SIGNAL MSB_LVL3,LSB_LVL3,E_MSB0_LVL3,E_MSB1_LVL3,E_LSB0_LVL3,E_LSB1_LVL3,MSB_LVL3_REG,LSB_LVL3_REG,LSB0_LVL3,LMUX0_LVL3: std_logic_vector(14 downto 0);


---                                   """ LIVELLO 4 """    
signal e_msb_last,e_lsb_last :std_logic_vector(15 downto 0);                             
signal sign_msb,sign_lsb,S:std_logic_vector(3 downto 0);
signal E_MSB_LVL4, E_LSB_LVL4, MSB_last,Lsb_sum: std_logic_vector(15 downto 0);
signal inmux16bit,inmux8bit: std_logic_vector(31 downto 0);
signal outmux: std_logic_vector(31 downto 0);

--- primo livello
component adder_level_1
PORT(A,B,C,D: IN STD_LOGIC_VECTOR(12 DOWNTO 0);
     sel: in std_logic;
     Sum_2,Sum: out std_logic_vector(12 downto 0));
end component;

component Mux11 
Port (
    a, b: in std_logic_vector(11 downto 0);
    sel: in std_logic;
    z : out std_logic_vector(11 downto 0));
end component;

component Mux12 
Port (
    a, b: in std_logic_vector(12 downto 0);
    sel: in std_logic;
    z : out std_logic_vector(12 downto 0));
end component; 

--------- SECONDO LIVELLO
component adder_level_2
PORT(A,B,C,D: IN STD_LOGIC_VECTOR(13 DOWNTO 0);
     sel: in std_logic;
     Sum_2,Sum: out std_logic_vector(13 downto 0));
end COMPONENT;

COMPONENT Mux13 
port ( A,B: IN STD_LOGIC_VECTOR(13 DOWNTO 0);
       sel: in std_logic;
       Z: out std_logic_vector(13 downto 0));
end COMPONENT;

--- TERZO LIVELLO
component adder_level_3
PORT(A,B,C,D: IN STD_LOGIC_VECTOR(14 DOWNTO 0);
     sel: in std_logic;
     Sum_2,Sum: out std_logic_vector(14 downto 0));
end COMPONENT;

COMPONENT Mux14 
port ( A,B: IN STD_LOGIC_VECTOR(14 DOWNTO 0);
       sel: in std_logic;
       Z: out std_logic_vector(14 downto 0));
end COMPONENT;

---- LIVELLO FINALE
component adder_level_4
PORT(A,B,C,D: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
     sel: in std_logic;
     Sum_2,Sum: out std_logic_vector(15 downto 0));
end COMPONENT;

component Mux15 is
port ( A,B: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
       sel: in std_logic;
       Z: out std_logic_vector(15 downto 0));
end component;
component Mux32 is
port ( A,B: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
       sel: in std_logic;
       Z: out std_logic_vector(31 downto 0));
end component;

begin

PP0M<=PP0(23 DOWNTO 12);
PP0L<=PP0(11 DOWNTO 0);
PP1M<=PP1(23 DOWNTO 12);
PP1L<=PP1(11 DOWNTO 0);
PP2M<=PP2(23 DOWNTO 12);
PP2L<=PP2(11 DOWNTO 0);
PP3M<=PP3(23 DOWNTO 12);
PP3L<=PP3(11 DOWNTO 0);
PP4M<=PP4(23 DOWNTO 12);
PP4L<=PP4(11 DOWNTO 0);
PP5M<=PP5(23 DOWNTO 12);
PP5L<=PP5(11 DOWNTO 0);
PP6M<=PP6(23 DOWNTO 12);
PP6L<=PP6(11 DOWNTO 0);
PP7M<=PP7(23 DOWNTO 12);
PP7L<=PP7(11 DOWNTO 0);
PP8M<=PP8(23 DOWNTO 12);
PP8L<=PP8(11 DOWNTO 0);
--am_pp7<=PP7(23 DOWNTO 12);
am_pp8<=PP8(23 DOWNTO 12);
--al_pp7<=PP7(11 DOWNTO 0);
al_pp8<=PP8(11 DOWNTO 0);

MUX_L0: MUX11 PORT MAP(PP1M,PP1L,SIMD,MUX_1); -- MUX  PP0M+PP1M (16) PP1L+PP0M(8----20 W22,19W21)
MUX_L1: MUX11 PORT MAP(PP1L,PP1M,SIMD,MUX_2); -- mux  PP0L+PP1L (16) PP0L+PP1M (8-------19 W22,18W21)      
      
MUX_L2: MUX11 PORT MAP(PP4M,PP4L,SIMD,MUX_3); -- mux 17+10 (rosso)
MUX_L3: MUX11 PORT MAP(PP4L,PP4M,SIMD,MUX_4); -- mux 10+11(blu)

MUX_L4: MUX11 PORT MAP(PP7M,PP7L,SIMD,MUX_5); -- mux 2+1 rosso  N.B. X LA OP DA 16 MANCA PP8 PER QUELLA A 8 MANCA PP7
MUX_L5: MUX11 PORT MAP(PP7L,PP7M,SIMD,MUX_6); -- MUX 2+1 ROSSO

MUX_L6: MUX11 PORT MAP(PP7M,PP6L,SIMD,MUX_7);--  MUX 4+3 BLU NON POSSO LASCIARLE 4+2

--MUX_msb_final_sum: MUX11 PORT MAP(am_pP8,am_PP7,SIMD,a_pp7);
--MUX_Lsb_final_sum: MUX11 PORT MAP(al_pp8,al_pp7,SIMD,a_pp8);



E_PP0M<=PP0M(11)&PP0M;
E_PP0L<=PP0L(11)&PP0L;
E_PP1M<=PP1M(11)&PP1M;
E_PP1L<=PP1L(11)&PP1L;
E_PP2M<=PP2M(11)&PP2M;
E_MUX_1<=MUX_1(11)&MUX_1;
E_MUX_2<=MUX_2(11)&MUX_2;
E_PP2L<=PP2L(11)&PP2L;
E_PP2M<=PP2M(11)&PP2M;
E_PP3M<=PP3M(11)&PP3M;
E_PP3L<=PP3L(11)&PP3L;
E_MUX_3<=MUX_3(11)&MUX_3;
E_MUX_4<=MUX_4(11)&MUX_4;
E_PP4M<=PP4M(11)&PP4M;
E_PP4L<=PP4L(11)&PP4L;
E_MUX_5<=MUX_5(11)&MUX_5;
E_MUX_6<=MUX_6(11)&MUX_6;
E_PP5M<=PP5M(11)&PP5M;
E_PP5L<=PP5L(11)&PP5L;
E_PP6M<=PP6M(11)&PP6M;
E_PP6L<=PP6L(11)&PP6L;
E_PP7M<=PP7M(11)&PP7L;
E_MUX_7<=MUX_7(11)&MUX_7;
--E_PP8M<=PP8M(11)&PP8M;
--E_PP8L<=PP8L(11)&PP8L;

SUM1_LVL1: adder_level_1 PORT MAP (E_PP0M, E_MUX_1, E_PP0L, E_MUX_2,SIMD, PM_0,PL_0);
SUM2_LVL1: adder_level_1 PORT MAP (E_PP3M, E_PP2M, E_PP3L, E_PP2L, SIMD, PM_1,PL_1);
SUM3_LVL1: adder_level_1 PORT MAP (E_MUX_3, E_PP5M, E_MUX_4, E_PP5L, SIMD, PM_2,PL_2);
SUM4_LVL1: adder_level_1 PORT MAP (E_PP6M, E_MUX_5, E_PP6L, E_MUX_6, SIMD, PM_3,PL_3);


--MULTIPLEXING SUI PL PER 16 ED 8
PMuxL0<="0"&PL_0(11 downto 0);
PMuxL1<="0"&PL_1(11 downto 0);
PMuxL2<="0"&PL_2(11 downto 0);
PMuxL3<="0"&PL_3(11 downto 0);

MuxL0: MUX12 PORT MAP (PMuxL0, PL_0,SIMD,pm_l0);
MuxL1: MUX12 PORT MAP (PMuxL1, PL_1,SIMD,pm_l1);
MuxL2: MUX12 PORT MAP (PMuxL2, PL_2,SIMD,pm_l2);
MuxL3: MUX12 PORT MAP (PMuxL3, PL_3,SIMD,pm_l3);

--------------- SECONDO LIVELLO
--- estensioni con segno
E_PMM_0<=PM_0_REG(12)&PM_0_REG;
E_PMM_1<=PM_1_REG(12)&PM_1_REG;
E_PMM_2<=PM_2_REG(12)&PM_2_REG;
E_PMM_3<=PM_3_REG(12)&PM_3_REG;
E_PLL_0<=PL_0_REG(12)&PL_0_REG;
E_PLL_1<=PL_1_REG(12)&PL_1_REG;
E_PLL_2<=PL_2_REG(12)&PL_2_REG;
E_PLL_3<=PL_3_REG(12)&PL_3_REG;

SUM1_LVL2: adder_level_2 PORT MAP (E_PMM_0, E_PMM_1, E_PLL_0, E_PLL_1,SIMD, PMM_0,PLL_0);
SUM2_LVL2: adder_level_2 PORT MAP (E_PMM_2, E_PMM_3, E_PLL_2, E_PLL_3,SIMD, PMM_1,PLL_1);

--- MUX LSB SIMD 1=> PLL_0 ED PLL_1 COSI COME SONO, ELSE PMUXLSB0="00"&PLL_0(11 DOWNTO 0);
LSB0_LVL2<="00"&PLL_0(11 DOWNTO 0);
LSB1_LVL2<="00"&PLL_1(11 DOWNTO 0);

MUX_LSB0_LVL2: MUX13 PORT MAP (LSB0_LVL2, PLL_0, SIMD, LMUX0_LVL2);
MUX_LSB1_LVL2: MUX13 PORT MAP (LSB1_LVL2, PLL_1, SIMD, LMUX1_LVL2);

-------- TERZO LIVELLO

E_MSB0_LVL3<=PMM_0_REG(13)&PMM_0_REG;
E_MSB1_LVL3<=PMM_1_REG(13)&PMM_1_REG;
E_LSB0_LVL3<=PLL_0_REG(13)&PLL_0_REG;
E_LSB1_LVL3<=PLL_1_REG(13)&PLL_1_REG;

SUM1_LVL3: adder_level_3 PORT MAP (E_MSB0_LVL3, E_MSB1_LVL3, E_LSB0_LVL3, E_LSB1_LVL3,SIMD, MSB_LVL3,LSB_LVL3);
LSB0_LVL3<="000"&LSB_LVL3(11 DOWNTO 0);
MUX_LSB0_LVL3: MUX14 PORT MAP (LSB0_LVL3, LSB_LVL3, SIMD, LMUX0_LVL3);

sign_msb<=(others=>pp8_reg_lvl3(11));
sign_lsb<=(others=>pp7_reg_lvl3(11));
--sign_msb<=(others=>'0');
--sign_lsb<=(others=>'0');

e_msb_last<=sign_msb&pp8_reg_lvl3;
e_lsb_last<=sign_lsb&pp7_reg_lvl3;

E_MSB_LVL4<=MSB_LVL3_REG(14)&MSB_LVL3_REG;
E_LSB_LVL4<=LSB_LVL3_REG(14)&LSB_LVL3_REG;

--MUX_MSB0_LVL4: MUX15 PORT MAP (E_PP8_M, E_PP7_M, SIMD, outmux_M);
--MUX_LSB0_LVL4: MUX15 PORT MAP (E_PP8_L, E_PP7_L, SIMD, outmux_L);

FINAL_SUM1_LVL4: adder_level_4 PORT MAP (E_MSB_LVL4, e_msb_last, E_LSB_LVL4,e_lsb_last, SIMD, MSB_Last,LSB_sum);

--LSB_inmux<="0000"&LSB_sum(11 downto 0);

--MUX_FINAL_LSB: mux15 port map(LSB_inmux,LSB_sum, SIMD,LSB_LAST);
S<=(OTHERS=>MSB_LAST(15));
inmux16bit<=S&MSB_LAST&LSB_sum(11 DOWNTO 0);
inmux8bit <=LSB_SUM&MSB_LAST;



MUX_PIXEL_OUT: MUX32 PORT MAP(INMUX16BIT, INMUX8BIT, SIMD,outmux);


process(clk)
begin
if (rising_edge(clk)) then
    if (rst='1') then
        PM_0_REG<=(OTHERS=>'0');
        PL_0_REG<=(OTHERS=>'0');
        PM_1_REG<=(OTHERS=>'0');
        PL_1_REG<=(OTHERS=>'0');
        PM_2_REG<=(OTHERS=>'0');
        PL_2_REG<=(OTHERS=>'0');
        PM_3_REG<=(OTHERS=>'0');
        PL_3_REG<=(OTHERS=>'0');
        PMM_0_REG<=(OTHERS=>'0');
        PMM_1_REG<=(OTHERS=>'0');
        PLL_0_REG<=(OTHERS=>'0');
        PLL_1_REG<=(OTHERS=>'0');
        R_PP7<=(OTHERS=>'0');
        R_PP8<=(OTHERS=>'0');
        pp7_reg_lvl2<=(OTHERS=>'0');
        pp8_reg_lvl2<=(OTHERS=>'0');
        pp7_reg_lvl3<=(OTHERS=>'0');
        pp8_reg_lvl3<=(OTHERS=>'0');
        MSB_LVL3_REG<=(OTHERS=>'0');
        LSB_LVL3_REG<=(OTHERS=>'0');
        Pixel_out<=(OTHERS=>'0');
  else
    if (ce='1') then
           PM_0_REG<=PM_0;
           PL_0_REG<=PM_L0;
           PM_1_REG<=PM_1;
           PL_1_REG<=PM_L1;
           PM_2_REG<=PM_2;
           PL_2_REG<=PM_L2;
           PM_3_REG<=PM_3;
           PL_3_REG<=PM_L3;
           R_PP7<=AL_PP8;
           R_PP8<=AM_PP8;
           PMM_0_REG<=PMM_0;
           PMM_1_REG<=PMM_1;
           PLL_0_REG<=LMUX0_LVL2;
           PLL_1_REG<=LMUX1_LVL2;           
           pp7_reg_lvl2<=R_PP7;
           pp8_reg_lvl2<=R_PP8;
           pp7_reg_lvl3<=pp7_reg_lvl2;
           pp8_reg_lvl3<=pp8_reg_lvl2;
           MSB_LVL3_REG<=MSB_LVL3;
           LSB_LVL3_REG<=LMUX0_LVL3;
           Pixel_out<=outmux;
           
    END IF;
   END IF;
  END IF;
 END PROCESS;
 
Pixel_out_32<=PIXEL_OUT;

    

end Behavioral;
