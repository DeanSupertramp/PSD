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

component REG_FILE
port ( PIXEL_IN : IN std_logic_vector(15 DOWNTO 0);
       CLK: IN std_logic;
       RST: IN std_logic;
       PADDING: IN std_logic_vector(7 DOWNTO 0);
       SIMD: IN std_logic;
       CE: IN std_logic;
       w00,w01,w02,w10,w11,w12,w20,w21,w22 : in std_logic_vector(3 downto 0);
       PP0,PP1,PP2,PP3,PP4,PP5,PP6,PP7,PP8 : OUT std_logic_vector(23 downto 0));
end component;

signal A:std_logic_vector(15 downto 0):="0000000000000000";
signal CLK_TEST: std_logic:='0';
signal RST_TEST: std_logic:='1';
signal CE_TEST: std_logic:='0';
signal PADDING_TEST: std_logic_vector(7 downto 0):="11111111";
signal SIMD_TEST: std_logic:='0';
signal PP0_test,PP1_test,PP2_test,PP3_test,PP4_test,PP5_test,PP6_test,PP7_test: std_logic_vector(23 downto 0):="000000000000000000000000";
signal pp8_test: std_logic_vector(23 downto 0):="000000000000000000000000";
signal w00: std_logic_vector(3 downto 0):="0001";
signal w01: std_logic_vector(3 downto 0):="0001";
signal w02: std_logic_vector(3 downto 0):="0001";
signal w10: std_logic_vector(3 downto 0):="0001";
signal w11: std_logic_vector(3 downto 0):="0001";
signal w12: std_logic_vector(3 downto 0):="0001";
signal w20: std_logic_vector(3 downto 0):="0001";
signal w21: std_logic_vector(3 downto 0):="0001";
signal w22: std_logic_vector(3 downto 0):="0001";

constant clk_period : time := 10 ns;

begin
uut: reg_file port map(A,clk_test,rst_test,PADDING_TEST,SIMD_TEST,ce_test,
w00,w01,w02,w10,w11,w12,w20,w21,w22,
PP0_test,PP1_test,PP2_test,PP3_test,PP4_test,PP5_test,PP6_test,PP7_test,PP8_test);

process
begin
    clk_test<='1';
    wait for clk_period/2;
    clk_test<='0';
    wait for clk_period/2;
end process;

process
begin

wait for 100 ns;
rst_test<='0';
wait for 10 ns;
CE_TEST<='1';
wait for 10ns;
A<="0010100110000100";
wait for 10 ns;
A<="1100101101010111";
wait for 10 ns;
A<="0100111110101100";
wait for 10 ns;
A<="1000011101001110";
wait for 10 ns;
A<="0010101001101000";
wait for 10 ns;
A<="1001101000011100";
wait for 10 ns;
A<="0100001101010010";
wait for 10 ns;
A<="1010011101110010";
wait for 10 ns;
A<="1011000001110001";
wait for 10 ns;
A<="1011111110000111";
wait for 10 ns;
A<="0111001101010111";
wait for 10 ns;
A<="0001010101110101";
wait for 10 ns;
A<="0011101010011110";
wait for 10 ns;
A<="1110100111010001";
wait for 10 ns;
A<="0010011100000010";
wait for 10 ns;
A<="1101001101101001";
wait for 10 ns;
A<="1000100111010001";
wait for 10 ns;
A<="1111111100000011";
wait for 10 ns;
A<="0001010000000011";
wait for 10 ns;
A<="0111000101010011";
wait for 10 ns;
A<="0001101101001101";
wait for 10 ns;
A<="1111011000111111";
wait for 10 ns;
A<="0000000100101111";
wait for 10 ns;
A<="1100011001100001";
wait for 10 ns;
A<="1101000100111011";
wait for 10 ns;
A<="1101111001100011";
wait for 10 ns;
A<="0001010110011101";
wait for 10 ns;
A<="0110011001011000";
wait for 10 ns;
A<="0100001010000111";
wait for 10 ns;
A<="1100110011010010";
wait for 10 ns;
A<="0110111001110001";
wait for 10 ns;
A<="1110100100100001";
wait for 10 ns;
A<="0010111010001101";
wait for 10 ns;
A<="0100001110001000";
wait for 10 ns;
A<="0010010101000010";
wait for 10 ns;
A<="0010001011010101";
wait for 10 ns;
A<="1101111010001010";
wait for 10 ns;
A<="1001010001101000";
wait for 10 ns;
A<="1000110011000100";
wait for 10 ns;
A<="0010010100011011";
wait for 10 ns;
A<="1101101001100001";
wait for 10 ns;
A<="1001111100111111";
wait for 10 ns;
A<="0101100111011000";
wait for 10 ns;
A<="1000001101100100";
wait for 10 ns;
A<="0110011011011101";
wait for 10 ns;
A<="0001001101110010";
wait for 10 ns;
A<="0011110101101011";
wait for 10 ns;
A<="0001111110010001";
wait for 10 ns;
A<="0010111100010100";
wait for 10 ns;
A<="0011110101101101";
wait for 10 ns;
A<="0110101011010010";
wait for 10 ns;
A<="0000110010110110";
wait for 10 ns;
A<="1110011100011001";
wait for 10 ns;
A<="1111000111011110";
wait for 10 ns;
A<="0111110110101001";
wait for 10 ns;
A<="0111110101000000";
wait for 10 ns;
A<="0101011001110101";
wait for 10 ns;
A<="1110011001101010";
wait for 10 ns;
A<="0101111010000111";
wait for 10 ns;
A<="0001110001110111";
wait for 10 ns;
A<="1100011110111111";
wait for 10 ns;
A<="0110001111000110";
wait for 10 ns;
A<="0011110111011111";
wait for 10 ns;
A<="0110011101100111";
wait for 10 ns;
A<="0001100010110001";
wait for 10 ns;
A<="0010000111001001";
wait for 10 ns;
A<="1111000100101011";
wait for 10 ns;
A<="1111010011000110";
wait for 10 ns;
A<="1001001101000001";
wait for 10 ns;
A<="0000111101001101";
wait for 10 ns;
A<="0011110000011010";
wait for 10 ns;
A<="0101101001101000";
wait for 10 ns;
A<="1101001000111010";
wait for 10 ns;
A<="0000001111110001";
wait for 10 ns;
A<="0000101100000011";
wait for 10 ns;
A<="0010101101000011";
wait for 10 ns;
A<="1010011000101101";
wait for 10 ns;
A<="1011101101010010";
wait for 10 ns;
A<="1010010111010011";
wait for 10 ns;
A<="0111001101110000";
wait for 10 ns;
A<="1000110000001001";
wait for 10 ns;
A<="0100101111011011";
wait for 10 ns;
A<="1011111010100100";
wait for 10 ns;
A<="0011000001011111";
wait for 10 ns;
A<="1010111111010001";
wait for 10 ns;
A<="0010111011111010";
wait for 10 ns;
A<="0101111001010101";
wait for 10 ns;
A<="1010000000101001";
wait for 10 ns;
A<="1100011110111101";
wait for 10 ns;
A<="0001010011000100";
wait for 10 ns;
A<="1110110111101101";
wait for 10 ns;
A<="1100011010010101";
wait for 10 ns;
A<="0111110010011110";
wait for 10 ns;
A<="0110111110010100";
wait for 10 ns;
A<="0111001001100000";
wait for 10 ns;
A<="0100111001101101";
wait for 10 ns;
A<="1000001000101110";
wait for 10 ns;
A<="1000001011000010";
wait for 10 ns;
A<="1101000101010000";
wait for 10 ns;
A<="1100101101111010";
wait for 10 ns;
A<="1010010011110010";
wait for 10 ns;
A<="0110000011101100";
wait for 10 ns;
A<="1100111111000100";
wait for 10 ns;
A<="1000100001100111";
wait for 10 ns;
A<="0101100111001001";
wait for 10 ns;
A<="1111000001100011";
wait for 10 ns;
A<="1110000000111110";
wait for 10 ns;
A<="1000110011010111";
wait for 10 ns;
A<="1001111101011011";
wait for 10 ns;
A<="1001011001001001";
wait for 10 ns;
A<="0011010100101110";
wait for 10 ns;
A<="0100110100011110";
wait for 10 ns;
A<="0111100010001110";
wait for 10 ns;
A<="0011101100000001";
wait for 10 ns;
A<="1101100000100101";
wait for 10 ns;
A<="0011000111011100";
wait for 10 ns;
A<="0011100111010110";
wait for 10 ns;
A<="0010101110110011";
wait for 10 ns;
A<="0011101001001000";
wait for 10 ns;
A<="0110111110001010";
wait for 10 ns;
A<="0100111110100100";
wait for 10 ns;
A<="1110110001100011";
wait for 10 ns;
A<="0110111000100010";
wait for 10 ns;
A<="0010111101010000";
wait for 10 ns;
A<="1110011110100111";
wait for 10 ns;
A<="1111101011010001";
wait for 10 ns;
A<="0111000001011010";
wait for 10 ns;
A<="0001110001110010";
wait for 10 ns;
A<="0100001000010000";
wait for 10 ns;
A<="0110100010100010";
wait for 10 ns;
A<="1001100001001011";
wait for 10 ns;
A<="0100001100100000";
wait for 10 ns;
A<="1001101001010100";
wait for 10 ns;
A<="1011011000010010";
wait for 10 ns;
A<="0011100011000100";
wait for 10 ns;
A<="0001111000001111";
wait for 10 ns;
A<="0100101111110011";
wait for 10 ns;
A<="0101000110011011";
wait for 10 ns;
A<="0110110010010110";
wait for 10 ns;
A<="1000001000000011";
wait for 10 ns;
A<="0001010111100100";
wait for 10 ns;
A<="0100001100110010";
wait for 10 ns;
A<="1100110100010000";
wait for 10 ns;
A<="0000011101111011";
wait for 10 ns;
A<="1110110111001010";
wait for 10 ns;
A<="1011101011110111";
wait for 10 ns;
A<="0111110100010101";
wait for 10 ns;
A<="1001010000011010";
wait for 10 ns;
A<="0011110010111110";
wait for 10 ns;
A<="0111010101110111";
wait for 10 ns;
A<="1111011010001101";
wait for 10 ns;
A<="1000101111111100";
wait for 10 ns;
A<="1000010101101001";
wait for 10 ns;
A<="0011101101001010";
wait for 10 ns;
A<="0111110100101000";
wait for 10 ns;
A<="1001111111000011";
wait for 10 ns;
A<="1010110111011100";
wait for 10 ns;
A<="0110010101000000";
wait for 10 ns;
A<="0101111000010000";
wait for 10 ns;
A<="1111110011101101";
wait for 10 ns;
A<="0000100110101001";
wait for 10 ns;
A<="1110001010011011";
wait for 10 ns;
A<="1110100111001110";
wait for 10 ns;
A<="1100101111010011";
wait for 10 ns;
A<="0001100101000101";
wait for 10 ns;
A<="0100001100001010";
wait for 10 ns;
A<="0101010111011010";
wait for 10 ns;
A<="1010111000000011";
wait for 10 ns;
A<="0010001011110101";
wait for 10 ns;
A<="1011100010100011";
wait for 10 ns;
A<="0001101101010100";
wait for 10 ns;
A<="1010011101011101";
wait for 10 ns;
A<="0111111010000010";
wait for 10 ns;
A<="1100011101110000";
wait for 10 ns;
A<="1011011100001101";
wait for 10 ns;
A<="1110011101011011";
wait for 10 ns;
A<="1110010000010100";
wait for 10 ns;
A<="0101010110001100";
wait for 10 ns;
A<="1011001011100001";
wait for 10 ns;
A<="0011001010100011";
wait for 10 ns;
A<="0000011111010001";
wait for 10 ns;
A<="1011111001111100";
wait for 10 ns;
A<="1000000000000001";
wait for 10 ns;
A<="0111101011011100";
wait for 10 ns;
A<="1110011110011100";
wait for 10 ns;
A<="1001110000100000";
wait for 10 ns;
A<="1001111000100000";
wait for 10 ns;
A<="1101110000000101";
wait for 10 ns;
A<="1100111000110101";
wait for 10 ns;
A<="1001001110100100";
wait for 10 ns;
A<="0010111011010100";
wait for 10 ns;
A<="0011110101101100";
wait for 10 ns;
A<="0000000000000000";

wait for 1500 ns;


end process;



end Behavioral;
