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
       SEL: IN STD_LOGIC;
       SUM: OUT STD_LOGIC_VECTOR(16 DOWNTO 0));
end reg_file;

architecture Behavioral of reg_file is
component FIFO 
port (data_in: IN std_logic_vector (15 downto 0);   
      clk: in std_logic;                            
      rst: in std_logic;                            
        data_out: OUT std_logic_vector (15 downto 0));
end component; 
component ADDER_PROVA
  PORT (
  A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  S : OUT STD_LOGIC_VECTOR(16 DOWNTO 0)
);
END COMPONENT;
component MuxExt
port ( A: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
       sel: in std_logic;
       Z: out std_logic_vector(15 downto 0));
end component;
signal P22,P21,P20,P10,P11,P12,P00,P01,P02,fifo_in1,fifo_out1,fifo_in2,fifo_out2,Z0,z1,z2,z3,z4,z5,z6,z7 : STD_LOGIC_VECTOR(15 downto 0);
signal sum1:std_logic_vector(16 downto 0);

begin
process (clk,rst)
begin
    if (rst='1') then
        sum<=(others=>'0');
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
            SUM<=SUM1;
       end if;
       end if;

     end process;

FIFO1: FIFO PORT MAP (DATA_IN=>P20,CLK=>CLK,RST=>RST,DATA_OUT=>FIFO_OUT1);
FIFO2: FIFO PORT MAP (DATA_IN=>P10,CLK=>CLK,RST=>RST,DATA_OUT=>FIFO_OUT2);
ADDER1: ADDER_PROVA PORT MAP(A=>P11, B=>Z0, S=>SUM1);
MUX_EXT0: MuxExt port map(P00, sel, Z0);
MUX_EXT1: MuxExt port map(P01,SEL, Z1);
MUX_EXT2: MuxExt port map(P02, sel, Z2);
MUX_EXT3: MuxExt port map(P10,SEL, Z3);
MUX_EXT4: MuxExt port map(P12, sel, Z4);
MUX_EXT5: MuxExt port map(P20,SEL, Z5);
MUX_EXT6: MuxExt port map(P21, sel, Z6);
MUX_EXT7: MuxExt port map(P22,SEL, Z7);

end Behavioral;


      

      



