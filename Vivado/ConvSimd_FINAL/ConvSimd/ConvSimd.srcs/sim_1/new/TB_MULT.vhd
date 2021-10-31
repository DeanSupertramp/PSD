----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2021 10:43:20
-- Design Name: 
-- Module Name: TB_MULT - Behavioral
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

entity TB_MULT is
--  Port ( );
end TB_MULT;

architecture Behavioral of TB_MULT is
component Mult_simd3x3
port (PIXEL_IN: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      CLK:  IN STD_LOGIC;
      SIMD: IN STD_LOGIC;
      RST:  IN STD_LOGIC;
      CE:   IN STD_LOGIC;
       W:   IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      Pout: OUT STD_LOGIC_VECTOR (23 DOWNTO 0));
end component;
signal a: std_logic_vector(15 downto 0):="0000000000000000";
signal p: std_logic_vector(23 downto 0):="000000000000000000000000";
signal w: std_logic_vector(3 downto 0):="0000";
signal clk_test, rst_test, simd: std_logic:='0';
signal ce_test: std_logic:='1';
constant clk_period : time := 10 ns;

begin

uut: mult_simd3x3 port map(a,clk_test, simd, rst_test, ce_test, w, p);

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
simd<='0';
a<="1001000000100000";
w<="1110";

wait for 10 ns;
simd<='0';
a<="0001000000100000";
w<="1110";

wait for 10 ns;
simd<='0';
a<="1001000001100000";
w<="1110";

wait for 10 ns;
simd<='0';
a<="1001000000100000";
w<="1110";

wait for 10 ns;
simd<='0';
a<="1001000010100000";
w<="1110";

wait for 10 ns;
simd<='0';
a<="0001000000100000";
w<="0110";
wait for 10 ns;
simd<='0';
a<="0001000000100000";
w<="1110";

simd<='0';
a<="1001000001100000";
w<="1110";

wait for 10 ns;
simd<='0';
a<="1001000000100000";
w<="1110";

wait for 10 ns;
simd<='1';
a<="1001000010100000";
w<="1110";

wait for 10 ns;
simd<='1';
a<="0001000000100000";
w<="0110";
wait for 10 ns;
simd<='1';
a<="0001000000100000";
w<="1110";


wait for 10 ns;
end process;

end Behavioral;
