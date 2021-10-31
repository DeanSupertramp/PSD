----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2021 11:04:13
-- Design Name: 
-- Module Name: Tb_final_sum - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Tb_final_sum is
--  Port ( );
end Tb_final_sum;

architecture Behavioral of Tb_final_sum is
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


signal a,b,c,d,e: std_logic_vector(23 downto 0):=(others=>'0');
signal p0: std_logic_vector(23 downto 0):= "000000000100010111110100";
signal p1: std_logic_vector(23 downto 0):= "000000000100011011001000";
signal p3: std_logic_vector(23 downto 0):= "000000000100100100000100";
signal p4: std_logic_vector(23 downto 0):= "000000000100101100101010";
signal clk_test, rst_test, simd: std_logic:='0';
signal ce_test: std_logic:='1';
constant clk_period : time := 10 ns;
signal pout: std_logic_vector(31 downto 0):=(others=>'0');

begin
process
begin
    clk_test<='0';
    wait for clk_period/2;
    clk_test<='1';
    wait for clk_period/2;
end process;

uut: pixel_final_sum port map( p0,p1,a,p3,p4,b,c,d,e, simd, rst_test,clk_test,ce_test,Pout);
end Behavioral;
