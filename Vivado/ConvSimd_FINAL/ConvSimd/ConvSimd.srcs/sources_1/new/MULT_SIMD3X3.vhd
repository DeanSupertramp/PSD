----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.09.2021 10:45:57
-- Design Name: 
-- Module Name: MULT_SIMD3X3 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_signed.all;
use ieee.std_logic_unsigned.all;

entity MULT_SIMD3X3 is
port (PIXEL_IN: IN std_logic_vector (15 DOWNTO 0);
      CLK:  IN std_logic;
      SIMD: IN std_logic;
      RST:  IN std_logic;
      CE:   IN std_logic;
      W:   IN std_logic_vector(3 DOWNTO 0);
      Pout: OUT std_logic_vector (23 DOWNTO 0));
end MULT_SIMD3X3;

architecture Behavioral of MULT_SIMD3X3 is
component RCA_24
port (A,B: IN std_logic_vector(23 DOWNTO 0);
     Sum: out std_logic_vector(24 downto 0));
end component;

component MUX9
port ( A,B: IN std_logic_vector(8 DOWNTO 0);
       sel: in std_logic;
       Z: out std_logic_vector(8 downto 0));
end component;

component MUX20
port ( A,B: IN std_logic_vector(19 DOWNTO 0);
       sel: in std_logic;
       Z: out std_logic_vector(19 downto 0));
end component;

component MUX16
port ( A,B: IN std_logic_vector(15 DOWNTO 0);
       sel: in std_logic;
       Z: out std_logic_vector(15 downto 0));
end component;

component MUX1
port (A,B,SEL: IN std_logic;
      Z: OUT std_logic);
end component;

---PIXEL_SPLIT:
signal pix_0,pix_1: std_logic_vector(7 downto 0);

-- AND BITWISE
signal w1,p1,w0,p0,w2,p2,w3,p3,p4,P5,P6,P7,P8,P9: std_logic_vector(7 downto 0);

-- PRODOTTI PARZIALI ESTESI
--signal PP0,PP1,PP2,PP3,pp4,pp5,pp6,pp7,pp8: std_logic_vector(11 downto 0);

--- SOMME PRODOTTI PARZIALI PRECISIONE 8 BIT
signal s1,s0: std_logic_vector(11 downto 0);

-- SEGNALI DI ESTENSIONE
signal extsign: std_logic_vector (4 downto 0);
signal z1, z2, z3, z4, z5, z6, z7, z8, z9: std_logic_vector(23 downto 0);
signal outsum1, outsum2, outsum3, outsum4, outsum5,outsum6,outsum7,outsum8,outsum9: std_logic_vector(24 downto 0);
signal outsum_1, outsum_2, outsum_3, outsum_4, outsum_5,outsum_6,outsum_7,outsum_8: std_logic_vector(23 downto 0);

---- SEGNALI REGISTRI
signal pix_in: std_logic_vector(15 downto 0);
signal RegSum0,RegSum1, RegSum2, RegSum3, RegSum4, RegSum5, RegSum6, RegSum7, RegSum8, RegSum9, RegSum10, RegSum11 :std_logic_vector(23 downto 0);
signal bit8_1, bit8_2, bit8_3: std_logic_vector(7 downto 0);
signal nove_bit1,nove_bit2,temp9_1,temp9_2: std_logic_vector(8 downto 0);
signal venti_bit_1,venti_bit_2,venti_bit_3,venti_bit_4,venti_bit_5,venti_bit_6,venti_bit_7,venti_bit_8: std_logic_vector(19 downto 0);
signal o1,o2,o3,o4,o5,o6,o7,o8:std_logic_vector(19 downto 0);
signal bit_16_1,bit_16_2,o_16,sedici_bit1,sedici_bit2,sedici_bit3,sedici_bit4,sedici_bit5,sedici_bit6: std_logic_vector(15 downto 0);
signal zero,one,two,two1,three,four,five,six,seven,U: std_logic;

begin
--SEGNAL SPLITTING
pix_0<=pix_in(7 downto 0);
pix_1<=pix_in(15 downto 8);

-- creo vettori moltiplicando
w0<=(others=>w(0));
w1<=(others=>w(1));
w2<=(others=>w(2));
w3<=(others=>w(3));

-- And bitwise:
-------------------------- LSBB
p0<=pix_0 and w0;
p1<=pix_0 and w1;
p2<=pix_0 and w2;
p3<=pix_0 and w3;
p4<=p3 xor w3;  ---not(p3)    

-------------------------  MSB
p5<=pix_1 and w0;
p6<=pix_1 and w1;
p7<=pix_1 and w2;
p8<=pix_1 and w3;
p9<=p8 xor w3;

extsign<=(others=>W(3));                    -- reg 20 bit

temp9_1<="0"&p4;
temp9_2<=w(3)&p4;
mux9_bit: mux9 port map(temp9_1,temp9_2, simd , nove_bit1);
venti_bit_1<="00000000"&p5&"0000"; --16 bit
venti_bit_2<="0000"&p5&"00000000"; -- 8bit
mux20_bit_1: mux20 port map(venti_bit_1,venti_bit_2,simd,o1);
venti_bit_3<="0000000"&p6&"00000";
venti_bit_4<="000"&p6&"000000000";
mux20_bit_2: mux20 port map(venti_bit_3,venti_bit_4,simd,o2);
venti_bit_5<="000000"&p7&"000000";
venti_bit_6<="00"&p7& "0000000000";
mux20_bit_3: mux20 port map(venti_bit_5,venti_bit_6,simd,o3);
venti_bit_7<=extsign&p9&"0000000";
venti_bit_8<=W(3)&p9&"00000000000";
mux20_bit_4: mux20 port map(venti_bit_7,venti_bit_8,simd,o4);

--bit_16_2<=w(3)&"00000000000"&w(3)&"000";
bit_16_2<=six&"00000000000"&seven&"000";

MUX_1: MUX1 port map('0', W(3),SIMD, U);

----- LSB
adder1: RCA_24 port map(z1, z2, outsum1);  --PP0 PP1
outsum_1<=outsum1(23 downto 0);                                                         
adder2: RCA_24 port map(z3, z4, outsum2);  --PP2 PP3
outsum_2<=outsum2(23 downto 0);
adder3: RCA_24 port map(z5, z6, outsum3); --somma dei due
outsum_3<=outsum3(23 downto 0);

------ MSB
adder4: RCA_24 port map(z7, z8, outsum4);
outsum_4<=outsum4(23 downto 0);

adder5: RCA_24 port map(RegSum1, RegSum2, outsum5);
outsum_5<=outsum5(23 downto 0);
adder6: RCA_24 port map(RegSum3, RegSum4, outsum6);
outsum_6<=outsum6(23 downto 0);
adder7: RCA_24 port map(RegSum6, RegSum7, outsum7);
outsum_7<=outsum7(23 downto 0);
adder8: RCA_24 port map(RegSum9, z9, outsum8);
RegSum11<=outsum8(23 downto 0);
--pout<=outsum8(23 downto 0);
s1<= RegSum11(23 downto 12); --pix1
s0<=RegSum11(11 downto 0); --pix 0

z1<="0000000000000000"&bit8_1;
z2<="000000000000000"&bit8_2&"0";
z3<="00000000000000"&bit8_3 &"00";
z4<="000000000000"&nove_bit2 &"000";

z5<=o5&"0000";
z6<=o6&"0000";
z7<=o7&"0000";
z8<=o8&"0000";
z9<="00000000"& bit_16_2;

--- PROCESS CAMPIONAMENTO DATI
process(clk)
begin
if(rising_edge(clk)) then
    if(rst ='1') then
        pix_in<=(others=>'0');
        bit8_1<=(others=>'0');
        bit8_1<=(others=>'0');
        bit8_2<=(others=>'0');
        bit8_3<=(others=>'0');
        nove_bit2<=(others=>'0');
        two<='0';
        one<='0';
        three<='0';
        zero<='0';
        four<='0';
        five<='0';
        six<='0';
        seven<='0';
        o5<=(others=>'0');
        o6<=(others=>'0');
        o7<=(others=>'0');
        o8<=(others=>'0');
        RegSum10<=(others=>'0');
        RegSum1<=(others=>'0');
        RegSum2<=(others=>'0');
        RegSum3<=(others=>'0');
        RegSum4<=(others=>'0');
        RegSum5<=(others=>'0');
        RegSum6<=(others=>'0');
        RegSum7<=(others=>'0');
        RegSum8<=(others=>'0');
        RegSum9<=(others=>'0');
        pout<=(others=>('0'));
    else
        if (ce='1') then
        pix_in<=pixel_in;
        one<=w(3);
        zero<=u;
        two<=zero;
        three<=one;
        four<=two;
        five<=three;
        six<=four;    ----z9(15) = W(3) solo se simd=1
        seven<=five;  ---z9(3) quarta  posizione
        bit8_1<=p0;
        bit8_2<=p1;
        bit8_3<=p2;
        nove_bit2<=nove_bit1;
        o5<=o1;
        o6<=o2;
        o7<=o3;
        o8<=o4;
        RegSum1<=outsum_1;
        RegSum2<=outsum_2;
        RegSum3<=outsum_3;
        RegSum4<=outsum_4;

        RegSum6<=outsum_5;
        RegSum7<=outsum_6;

        RegSum9<=outsum_7;
        pout<=RegSum11;
    end if;
end if;
end if;
end process;
end Behavioral;