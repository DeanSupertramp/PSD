----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2021 12:11:47
-- Design Name: 
-- Module Name: test_level1 - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_level1 is
--  Port ( );
end test_level1;

architecture Behavioral of test_level1 is
component adder_level_2
PORT(A,B,C,D: IN STD_LOGIC_VECTOR(13 DOWNTO 0);
     sel: in std_logic;
     Sum,Sum_2: out std_logic_vector(13 downto 0));
end COMPONENT;

signal a_t,b_t,c_t,d_t,s_1,s_2: std_logic_vector(13 downto 0):="00000000000000";
signal s_3: std_logic_vector(27 downto 0);
signal a1,b1: std_logic_vector(27 downto 0);
signal s_4: std_logic_vector(25 downto 0);
signal sel_t: std_logic:='0';
begin

uut: adder_level_2 PORT MAP(A_T,B_T,C_T,D_T,SEL_T,S_2,S_1);
a1<=a_t&c_t;
B1<=b_t&d_t;
s_3<=S_1&S_2;
s_4<= s_1&S_2(11 downto 0);
process
begin
    wait for 100 ns;
    sel_t<='0';
    b_t<="00000011010100";
    a_t<="01011000010010";
    d_t<="11100011010100";
    c_t<="11111000010010";
    wait for 100 ns;
    sel_t<='1';
    b_t<="00000011010100";
    a_t<="01011000010010";
    d_t<="11100011010100";
    c_t<="11111000010010";
end process;
end Behavioral;
