----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2021 09:58:55
-- Design Name: 
-- Module Name: reg_file - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;

entity reg_file is
PORT ( --PIXEL_IN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
       CLK: IN STD_LOGIC;
       RST: IN STD_LOGIC;
       PADDING: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       SIMD: IN STD_LOGIC;
       CE: IN STD_LOGIC;
      -- valid_in: in std_logic;
       EN_MEM_IN: IN STD_LOGIC;
       WEA_MEM_OUT: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
       ADDR_IN: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
       ADDR_OUT: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
       EN_MEM_OUT: IN STD_LOGIC;
       w00,w01,w02,w10,w11,w12,w20,w21,w22 : in std_logic_vector(3 downto 0);
       --valid: out std_logic;
       Pixel_out:   out STD_LOGIC_VECTOR(31 DOWNTO 0));
end reg_file;

architecture Behavioral of reg_file is
--- MEMORIA DI INGRESSO
COMPONENT Memory_in
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;
----    FIFO
component FIFO 
port (data_in: IN std_logic_vector (15 downto 0);   
      clk: in std_logic;  
      ce: in std_logic;                          
      rst: in std_logic;                            
        data_out: OUT std_logic_vector (15 downto 0));
end component; 
--- MUX GESTIONE MSB,LSB
component MuxExt
port ( A,B: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       sel: in std_logic;
       Z: out std_logic_vector(7 downto 0));
end component;
-- MUX PADDING
COMPONENT Mux_8
port ( A: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       sel: in std_logic;
       Z: out std_logic_vector(7 downto 0));
end COMPONENT;

--- MOLTIPLICATORE
component MULT_SIMD3x3
port (PIXEL_IN: IN std_logic_vector (15 DOWNTO 0);
      CLK:  IN std_logic;
      SIMD: IN std_logic;
      RST:  IN std_logic;
      CE:   IN std_logic;
      W:   IN std_logic_vector(3 DOWNTO 0);
      Pout: OUT std_logic_vector (23 DOWNTO 0));
end component;
--- SOMMATORE FINALE
component pixel_final_sum
port( PP0,PP1,PP2: in  STD_LOGIC_VECTOR(23 DOWNTO 0);
      PP3,PP4,PP5: in  STD_LOGIC_VECTOR(23 DOWNTO 0);
      PP6,PP7,PP8: in  STD_LOGIC_VECTOR(23 DOWNTO 0);
      SIMD:        in  STD_LOGIC;
      RST:         in  STD_LOGIC;
      CLK:         in  STD_LOGIC;
      CE:          in  STD_LOGIC;
      Pixel_out_32:   out STD_LOGIC_VECTOR(31 DOWNTO 0));
end component;

-- MEMORIA DI USCITA
COMPONENT Mem_out 
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;







---------               SEGNALI 
signal pixel_in: std_logic_vector(15 downto 0);
signal pp0,pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8 :std_logic_vector(23 downto 0);

-- OUT REGISTRI E IN/OUT FIFO
signal P22,P21,P20,P10,P11,P12,P00,P01,P02 : STD_LOGIC_VECTOR(15 downto 0);
signal fifo_out1,fifo_out2: std_logic_vector(15 downto 0):="0000000000000000";
-- OUT MUX
signal Z22_MSB,Z22_LSB,Z21_MSB,Z21_LSB,Z20_MSB,Z20_LSB,Z12_MSB,Z12_LSB,Z10_MSB,Z10_LSB,Z02_MSB,Z02_LSB,Z01_MSB,Z01_LSB,Z00_MSB,Z00_LSB: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL  Z0,Z1,Z2,Z3,Z4,Z5: STD_LOGIC_VECTOR (7 DOWNTO 0);
-- PIXEL REG SPLITTATI
SIGNAl MSB22,LSB22,MSB21,LSB21,MSB20,LSB20,MSB12,LSB12,MSB11,LSB11,MSB10,LSB10,MSB02,LSB02,MSB01,LSB01,MSB00,LSB00: STD_LOGIC_VECTOR (7 DOWNTO 0);

-- SEGNALI INGRESSO MOLTIPLICATORI
signal P0, P1, P2, P3, P4, P5, P6, P7, P8: std_logic_vector(15 downto 0);

--- SEGNALI MEMORIA

signal wea_mem_in: std_logic_vector(0 downto 0):="0";
signal en_out: std_logic;--:='0';
signal data_in: std_logic_vector(15 downto 0):=(others=>'0');
SIGNAL DATA_OUT: STD_LOGIC_VECTOR(31 DOWNTO 0);--:=(others=>'0');
signal DataM,DataL: std_logic_vector(15 downto 0);



begin
process (clk)
begin
    if (rising_edge(clk)) then
       if (rst='1') then

            P22<=(others=>'0');
            P21<=(others=>'0');
            P20<=(others=>'0');
            P12<=(others=>'0');
            P11<=(others=>'0');
            P10<=(others=>'0');
            P02<=(others=>'0');
            P01<=(others=>'0');
            P00<=(others=>'0');

        else
            if (ce='1') then
                P22<=PIXEL_IN;
                P21<=P22;
                P20<=P21;
                P12<=fifo_out1;
                P11<=P12;
                P10<=P11;
                P02<=fifo_out2;
                P01<=P02;
                P00<=P01;


       end if;
END IF;
END IF;
END PROCESS;
MEM_IN: MEMORY_IN PORT MAP (CLK,EN_MEM_IN, WEA_MEM_IN,ADDR_IN,DATA_IN,PIXEL_IN);  

MSB22<= P22(15 downto 8);
LSB22<= P22(7 DOWNTO 0);
MSB21<= P21(15 downto 8);
LSB21<= P21(7 DOWNTO 0);
MSB20<= P20(15 downto 8);
LSB20<= P20(7 DOWNTO 0);
MSB12<= P12(15 downto 8);
LSB12<= P12(7 DOWNTO 0);
MSB11<= P11(15 downto 8);
LSB11<= P11(7 DOWNTO 0);
MSB10<= P10(15 downto 8);
LSB10<= P10(7 DOWNTO 0);
MSB02<= P02(15 downto 8);
LSB02<= P02(7 DOWNTO 0);
MSB01<= P01(15 downto 8);
LSB01<= P01(7 DOWNTO 0);
MSB01<= P01(15 downto 8);
LSB01<= P01(7 DOWNTO 0);
MSB00<= P00(15 downto 8);
LSB00<= P00(7 DOWNTO 0);


FIFO1: FIFO PORT MAP (DATA_IN=>P20,CLK=>CLK,ce=>ce,RST=>RST,DATA_OUT=>FIFO_OUT1);
FIFO2: FIFO PORT MAP (DATA_IN=>P10,CLK=>CLK,ce=>ce,RST=>RST,DATA_OUT=>FIFO_OUT2);


-- GESTIONE ZERO PADDING
MUX_PADDING_22_MSB: MUX_8 PORT MAP (A=>MSB22,SEL=>PADDING(7), Z=>Z22_MSB);
MUX_PADDING_22_LSB: MUX_8 PORT MAP (A=>LSB22,SEL=>PADDING(7), Z=>Z22_LSB);
MUX_PADDING_21_MSB: MUX_8 PORT MAP (A=>MSB21,SEL=>PADDING(6), Z=>Z21_MSB);
MUX_PADDING_21_LSB: MUX_8 PORT MAP (A=>LSB21,SEL=>PADDING(6), Z=>Z21_LSB);
MUX_PADDING_20_MSB: MUX_8 PORT MAP (A=>MSB20,SEL=>PADDING(5), Z=>Z20_MSB);
MUX_PADDING_20_LSB: MUX_8 PORT MAP (A=>LSB20,SEL=>PADDING(5), Z=>Z20_LSB);
MUX_PADDING_12_MSB: MUX_8 PORT MAP (A=>MSB12,SEL=>PADDING(4), Z=>Z12_MSB);
MUX_PADDING_12_LSB: MUX_8 PORT MAP (A=>LSB12,SEL=>PADDING(4), Z=>Z12_LSB);
MUX_PADDING_10_MSB: MUX_8 PORT MAP (A=>MSB10,SEL=>PADDING(3), Z=>Z10_MSB);
MUX_PADDING_10_LSB: MUX_8 PORT MAP (A=>LSB10,SEL=>PADDING(3), Z=>Z10_LSB);
MUX_PADDING_02_MSB: MUX_8 PORT MAP (A=>MSB02,SEL=>PADDING(2), Z=>Z02_MSB);
MUX_PADDING_02_LSB: MUX_8 PORT MAP (A=>LSB02,SEL=>PADDING(2), Z=>Z02_LSB);
MUX_PADDING_01_MSB: MUX_8 PORT MAP (A=>MSB01,SEL=>PADDING(1), Z=>Z01_MSB);
MUX_PADDING_01_LSB: MUX_8 PORT MAP (A=>LSB01,SEL=>PADDING(1), Z=>Z01_LSB);
MUX_PADDING_00_MSB: MUX_8 PORT MAP (A=>MSB00,SEL=>PADDING(0), Z=>Z00_MSB);
MUX_PADDING_00_LSB: MUX_8 PORT MAP (A=>LSB00,SEL=>PADDING(0), Z=>Z00_LSB);


-- GESTIONE PIXEL IN INGRESSO AL MOLTIPLICATORE
MUX_SIMD_1: MUXExt PORT MAP (A=>Z22_LSB,B=>Z21_LSB,SEL=>SIMD,Z=>Z0);
MUX_SIMD_2: MUXExt PORT MAP (A=>Z20_MSB,B=>Z21_MSB,SEL=>SIMD,Z=>Z1);
MUX_SIMD_3: MUXExt PORT MAP (A=>Z12_LSB,B=>LSB11,SEL=>SIMD,Z=>Z2);
MUX_SIMD_4: MUXExt PORT MAP (A=>Z10_mSB,B=>MSB11,SEL=>SIMD,Z=>Z3);
MUX_SIMD_5: MUXExt PORT MAP (A=>Z02_LSB,B=>Z01_LSB,SEL=>SIMD,Z=>Z4);
MUX_SIMD_6: MUXExt PORT MAP (A=>Z00_MSB,B=>Z01_MSB,SEL=>SIMD,Z=>Z5);
--MULT_PROVA1: MULT_PROVA PORT MAP (A=>Z22,B=>Z21,p=> MULT_8);

P0<= Z22_MSB&Z0;
P1<= Z21_MSB&Z21_LSB;
P2<= Z1&Z20_LSB;
P3<= Z12_MSB&Z2;
P4<= MSB11&LSB11;
P5<= Z3&Z10_LSB;
P6<= Z02_MSB&Z4;
P7<= Z01_MSB&Z01_LSB;
P8<= Z5&Z00_LSB;

PIXEL22: MULT_SIMD3x3 port map (P0, clk, simd, rst, ce, w22, PP0);
PIXEL21: MULT_SIMD3x3 port map (P1, clk, simd, rst, ce, w21, PP1);
PIXEL20: MULT_SIMD3x3 port map (P2, clk, simd, rst, ce, w20, PP2);

PIXEL12: MULT_SIMD3x3 port map (P3, clk, simd, rst, ce, w12, PP3);
PIXEL11: MULT_SIMD3x3 port map (P4, clk, simd, rst, ce, w11, PP4);
PIXEL10: MULT_SIMD3x3 port map (P5, clk, simd, rst, ce, w10, PP5);

PIXEL02: MULT_SIMD3x3 port map (P6, clk, simd, rst, ce, w02, PP6);
PIXEL01: MULT_SIMD3x3 port map (P7, clk, simd, rst, ce, w01, PP7);
PIXEL00: MULT_SIMD3x3 port map (P8, clk, simd, rst, ce, w00, PP8);


SOMMA_FINALE: pixel_final_sum PORT MAP( PP0,PP1,PP2 ,
                                        PP3,PP4,PP5, 
                                        PP6,PP7,PP8 ,
                                        SIMD,        
                                        RST  ,       
                                        CLK   ,    
                                        CE     ,     
                                        DATA_OUT);
                                        
MEMORY_OUT: MEM_OUT PORT MAP (CLK, EN_MEM_OUT ,WEA_MEM_OUT, ADDR_OUT,DATA_OUT, PIXEL_OUT);
--    clka : IN STD_LOGIC;
--ena : IN STD_LOGIC;
--wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
--dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
--douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)


dataM<=data_out(31 downto 16);
dataL<=data_out(15 downto 0);             
end Behavioral;


      

      



