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
PORT ( PIXEL_IN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
       CLK: IN STD_LOGIC;
       RST: IN STD_LOGIC;
       PADDING: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       SIMD: IN STD_LOGIC;
       PIXEL_22,PIXEL_21,PIXEL_20,PIXEL_12,PIXEL_11,PIXEL_10,PIXEL_02,PIXEL_01,PIXEL_00: OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end reg_file;

architecture Behavioral of reg_file is
component FIFO 
port (data_in: IN std_logic_vector (15 downto 0);   
      clk: in std_logic;                            
      rst: in std_logic;                            
        data_out: OUT std_logic_vector (15 downto 0));
end component; 

component MuxExt
port ( A,B: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       sel: in std_logic;
       Z: out std_logic_vector(7 downto 0));
end component;
COMPONENT Mux_8
port ( A: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       sel: in std_logic;
       Z: out std_logic_vector(7 downto 0));
end COMPONENT;

-- OUT REGISTRI E IN/OUT FIFO
signal P22,P21,P20,P10,P11,P12,P00,P01,P02,fifo_in1,fifo_out1,fifo_in2,fifo_out2 : STD_LOGIC_VECTOR(15 downto 0);
-- OUT MUX
signal Z22_MSB,Z22_LSB,Z21_MSB,Z21_LSB,Z20_MSB,Z20_LSB,Z12_MSB,Z12_LSB,Z10_MSB,Z10_LSB,Z02_MSB,Z02_LSB,Z01_MSB,Z01_LSB,Z00_MSB,Z00_LSB: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL  Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8: STD_LOGIC_VECTOR (7 DOWNTO 0);
-- PIXEL REG SPLITTATI
SIGNAl MSB22,LSB22,MSB21,LSB21,MSB20,LSB20,MSB12,LSB12,MSB11,LSB11,MSB10,LSB10,MSB02,LSB02,MSB01,LSB01,MSB00,LSB00: STD_LOGIC_VECTOR (7 DOWNTO 0);
begin
process (clk,rst)
begin
    if (rst='1') then
--        sum<=(others=>'0');
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
        if (rising_edge(clk)) then
            P22<=PIXEL_IN;
            P21<=P22;
            P20<=P21;
            P12<=fifo_out1;
            P11<=P12;
            P10<=P11;
            P02<=fifo_out2;
            P01<=P02;
            P00<=P01;
--            SUM<=SUM1;
       end if;
       end if;
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
 end process;

FIFO1: FIFO PORT MAP (DATA_IN=>P20,CLK=>CLK,RST=>RST,DATA_OUT=>FIFO_OUT1);
FIFO2: FIFO PORT MAP (DATA_IN=>P10,CLK=>CLK,RST=>RST,DATA_OUT=>FIFO_OUT2);
--ADDER1: ADDER_PROVA PORT MAP(A=>P11, B=>Z0, S=>SUM1);
--MUX_EXT0: MuxExt port map(P00, sel, Z0);
--MUX_EXT1: MuxExt port map(P01,SEL, Z1);
--MUX_EXT2: MuxExt port map(P02, sel, Z2);
--MUX_EXT3: MuxExt port map(P10,SEL, Z3);
--MUX_EXT4: MuxExt port map(P12, sel, Z4);
--MUX_EXT5: MuxExt port map(P20,SEL, Z5);
--MUX_EXT6: MuxExt port map(P21, sel, Z6);
--MUX_EXT7: MuxExt port map(P22,SEL, Z7);


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
MUX_PADDING_10_LSB: MUX_8 PORT MAP (A=>MSB10,SEL=>PADDING(3), Z=>Z10_LSB);
MUX_PADDING_02_MSB: MUX_8 PORT MAP (A=>MSB02,SEL=>PADDING(2), Z=>Z02_MSB);
MUX_PADDING_02_LSB: MUX_8 PORT MAP (A=>MSB02,SEL=>PADDING(2), Z=>Z02_LSB);
MUX_PADDING_01_MSB: MUX_8 PORT MAP (A=>MSB01,SEL=>PADDING(1), Z=>Z01_MSB);
MUX_PADDING_01_LSB: MUX_8 PORT MAP (A=>MSB01,SEL=>PADDING(1), Z=>Z01_LSB);
MUX_PADDING_00_MSB: MUX_8 PORT MAP (A=>MSB00,SEL=>PADDING(0), Z=>Z00_MSB);
MUX_PADDING_00_LSB: MUX_8 PORT MAP (A=>MSB00,SEL=>PADDING(0), Z=>Z00_LSB);


-- GESTIONE PIXEL IN INGRESSO AL MOLTIPLICATORE
MUX_SIMD_1: MUXExt PORT MAP (A=>Z22_LSB,B=>Z21_LSB,SEL=>SIMD,Z=>Z0);
MUX_SIMD_2: MUXExt PORT MAP (A=>Z21_MSB,B=>Z20_MSB,SEL=>SIMD,Z=>Z1);
MUX_SIMD_3: MUXExt PORT MAP (A=>Z12_LSB,B=>LSB11,SEL=>SIMD,Z=>Z2);
MUX_SIMD_4: MUXExt PORT MAP (A=>MSB11,B=>Z10_LSB,SEL=>SIMD,Z=>Z3);
MUX_SIMD_5: MUXExt PORT MAP (A=>Z02_LSB,B=>Z01_LSB,SEL=>SIMD,Z=>Z4);
MUX_SIMD_6: MUXExt PORT MAP (A=>Z01_MSB,B=>Z00_MSB,SEL=>SIMD,Z=>Z5);
--MULT_PROVA1: MULT_PROVA PORT MAP (A=>Z22,B=>Z21,p=> MULT_8);
PIXEL_22 <=Z22_MSB&Z0;

end Behavioral;


      

      



