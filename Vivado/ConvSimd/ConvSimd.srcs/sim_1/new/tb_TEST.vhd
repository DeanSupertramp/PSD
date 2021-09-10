----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2021 12:17:06
-- Design Name: 
-- Module Name: tb_TEST - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity tb_TEST is
--  Port ( );
end tb_TEST;

architecture Behavioral of tb_TEST is
COMPONENT REG_FILE
PORT( PIXEL_IN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      CLK: IN STD_LOGIC;
      RST: IN STD_LOGIC;
      SEL: IN STD_LOGIC;
      SUM: OUT STD_LOGIC_VECTOR(16 DOWNTO 0));
end COMPONENT;
SIGNAL A:STD_LOGIC_VECTOR(15 DOWNTO 0):="0000000000000000";
SIGNAL CLK_TEST: STD_LOGIC:='0';
SIGNAL RST_TEST: STD_LOGIC:='1';
SIGNAL SEL_TEST: STD_LOGIC:='0';
SIGNAL SUM_TEST: STD_LOGIC_VECTOR(16 DOWNTO 0):="00000000000000000";
constant clk_period : time := 10 ns;

begin
uut: reg_file port map(A,clk_test,rst_test,SEL_TEST,sum_test);
process
begin
    clk_test<='0';
    wait for clk_period/2;
    clk_test<='1';
    wait for clk_period/2;
end process;

process
begin

wait for 100 ns;
rst_test<='1';
wait for 7 ns;
rst_test<='0';

A<="1000111100011101";
wait for 10 ns;
A<="1101101010100111";
wait for 10 ns;
A<="0101100100001110";
wait for 10 ns;
A<="0111001000101111";
wait for 10 ns;
A<="0000110111100010";
wait for 10 ns;
A<="0010110101010111";
wait for 10 ns;
A<="1010100110101110";
wait for 10 ns;
A<="0101010010110001";
wait for 10 ns;
A<="1110011000000100";
wait for 10 ns;
A<="0001111000111111";
wait for 10 ns;
A<="1111110100001001";
wait for 10 ns;
A<="1000101000111100";
wait for 10 ns;
A<="1011010011111001";
wait for 10 ns;
A<="1111111111011111";
wait for 10 ns;
A<="0100100110110000";
wait for 10 ns;
A<="0110101000011110";
wait for 10 ns;
A<="0111011100000000";
wait for 10 ns;
A<="1100001110010011";
wait for 10 ns;
A<="1101000101110110";
wait for 10 ns;
A<="0001100110101000";
wait for 10 ns;
A<="0010110110011001";
wait for 10 ns;
A<="0101110000010001";
wait for 10 ns;
A<="0000111010000100";
wait for 10 ns;
A<="1000010110011010";
wait for 10 ns;
A<="0101010111111010";
wait for 10 ns;
A<="0010110011111000";
wait for 10 ns;
A<="0011010101111101";
wait for 10 ns;
A<="1110011110111001";
wait for 10 ns;
A<="1010110011100111";
wait for 10 ns;
A<="0111011111101110";
wait for 10 ns;
A<="1110100110000010";
wait for 10 ns;
A<="0001101010100000";
wait for 10 ns;
A<="1011111011011100";
wait for 10 ns;
A<="1011110001111100";
wait for 10 ns;
A<="1000111111010110";
wait for 10 ns;
A<="0010111100100111";
wait for 10 ns;
A<="1001100011100011";
wait for 10 ns;
A<="0100110011001000";
wait for 10 ns;
A<="0010001001010110";
wait for 10 ns;
A<="0011011001101101";
wait for 10 ns;
A<="1110010100011011";
wait for 10 ns;
A<="0001001001001010";
wait for 10 ns;
A<="0011111000010011";
wait for 10 ns;
A<="0000110111000010";
wait for 10 ns;
A<="0111000100010101";
wait for 10 ns;
A<="0000001101100110";
wait for 10 ns;
A<="1110010110101111";
wait for 10 ns;
A<="0011001001011000";
wait for 10 ns;
A<="0001011111100111";
wait for 10 ns;
A<="0100111010101111";
wait for 10 ns;
A<="0111010011000000";
wait for 10 ns;
A<="0001101000000111";
wait for 10 ns;
A<="1111111011010010";
wait for 10 ns;
A<="0101010100000100";
wait for 10 ns;
A<="0100110000011111";
wait for 10 ns;
A<="0000111111100010";
wait for 10 ns;
A<="0100110001011010";
wait for 10 ns;
A<="0000101111011101";
wait for 10 ns;
A<="1000000101100100";
wait for 10 ns;
A<="1100001011101101";
wait for 10 ns;
A<="1010000110001110";
wait for 10 ns;
A<="0001011100000011";
wait for 10 ns;
A<="0001010010110011";
wait for 10 ns;
A<="1100011011111010";
wait for 10 ns;
A<="1110011110110111";
wait for 10 ns;
A<="1000100010100101";
wait for 10 ns;
A<="0001101111110001";
wait for 10 ns;
A<="1101001101101001";
wait for 10 ns;
A<="0101011010001101";
wait for 10 ns;
A<="0100101101000010";
wait for 10 ns;
A<="1011111100001111";
wait for 10 ns;
A<="0000001010100101";
wait for 10 ns;
A<="0000110001100111";
wait for 10 ns;
A<="1010101011111101";
wait for 10 ns;
A<="1001101001111101";
wait for 10 ns;
A<="1000011010101111";
wait for 10 ns;
A<="1011101011001110";
wait for 10 ns;
A<="1011010100001111";
wait for 10 ns;
A<="1100100000001001";
wait for 10 ns;
A<="0100100110111001";
wait for 10 ns;
A<="1011000101001010";
wait for 10 ns;
A<="1000111010000010";
wait for 10 ns;
sel_test<='1';
A<="0110010110000010";
wait for 10 ns;
A<="0000111111000100";
wait for 10 ns;
A<="1100011110111010";
wait for 10 ns;
A<="0101011001101100";
wait for 10 ns;
A<="1001101110011101";
wait for 10 ns;
A<="1011110111000011";
sel_test<='0';
wait for 10 ns;
A<="0001101011010101";
wait for 10 ns;
A<="0010000010111101";
wait for 10 ns;
A<="1000110010101111";
wait for 10 ns;
A<="0111110000111000";
wait for 10 ns;
A<="1110001111110111";
wait for 10 ns;
A<="1100110010001001";
wait for 10 ns;
A<="1011101111111110";
wait for 10 ns;
A<="0000110100100100";
wait for 10 ns;
A<="0001001010101000";
wait for 10 ns;
A<="0001011010101001";
wait for 10 ns;
A<="1100110001100001";
wait for 10 ns;
A<="1111000101101001";
wait for 10 ns;
end process;

end Behavioral;
