----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2021 18:59:54
-- Design Name: 
-- Module Name: TB_REG_FILE - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_REG_FILE is
--  Port ( );
end TB_REG_FILE;

architecture Behavioral of TB_REG_FILE is
COMPONENT reg_file
PORT ( --PIXEL_IN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
       CLK: IN STD_LOGIC;
       RST: IN STD_LOGIC;
       PADDING: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       SIMD: IN STD_LOGIC;
       CE: IN STD_LOGIC;
       EN_MEM_IN: IN STD_LOGIC;
       WEA_MEM_OUT: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
       ADDR_IN: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
       ADDR_OUT: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
       EN_MEM_OUT: IN STD_LOGIC;
       w00,w01,w02,w10,w11,w12,w20,w21,w22 : in std_logic_vector(3 downto 0);
       Pixel_out:   out STD_LOGIC_VECTOR(31 DOWNTO 0));
end COMPONENT;
SIGNAL START_TB:STD_LOGIC:='0';
SIGNAL RST_TB:STD_LOGIC:='1';
SIGNAL CLK_TB:STD_LOGIC:='1';
SIGNAL SIMD,ce_tb: STD_LOGIC:='0';
signal PADDING: std_logic_vector(7 downto 0):="11111111";
signal SIMD_TEST: std_logic:='0';
constant clk_period : time := 10 ns;
SIGNAL   w00_T,w01_T,w02_T,w10_T,w11_t,w12_T,w20_T,w21_t,w22_t: std_logic_vector(3 downto 0):="0001";
SIGNAL PIX_OUT_TB:STD_LOGIC_VECTOR(31 DOWNTO 0):=(OTHERS=>'0');
SIGNAL ADDRESS_IN, ADDRESS_OUT: STD_LOGIC_VECTOR(11 DOWNTO 0):=(OTHERS=>'0');
SIGNAL EN_MEM_IN,EN_MEM_OUT:STD_LOGIC:='1';
SIGNAL wea: std_logic_vector(0 downto 0):="1";
signal pix: std_logic_vector(31 downto 0):=(others=>'0');

constant lat: std_logic_vector(5 downto 0):="100011";
signal w00: std_logic_vector(3 downto 0):="0001";
signal w01: std_logic_vector(3 downto 0):="0001";
signal w02: std_logic_vector(3 downto 0):="0001";
signal w10: std_logic_vector(3 downto 0):="0001";
signal w11: std_logic_vector(3 downto 0):="0001";
signal w12: std_logic_vector(3 downto 0):="0001";
signal w20: std_logic_vector(3 downto 0):="0001";
signal w21: std_logic_vector(3 downto 0):="0001";
signal w22: std_logic_vector(3 downto 0):="0001";
begin

process 
begin

    if (address_in >= lat-1) then
        address_out<=address_out+1;
     end if;
        address_in<=address_in +1;
end process;

process 
begin 
    clk_tB<='0';
wait for clk_period/2;
clk_tB<='1';
wait for clk_period/2;
end process;

process
begin
WAIT FOR 100 NS;
    rst_tb <='1';
    ce_tb<='0';
    wait for 100ns;
    rst_tb<='0';
    ce_tb<='1';
    --start_tb<='1';
    wait for 100830 ns;
END PROCESS;
--       CLK: IN STD_LOGIC;
--RST: IN STD_LOGIC;
--PADDING: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--SIMD: IN STD_LOGIC;
--CE: IN STD_LOGIC;
--EN_MEM_IN: IN STD_LOGIC;
--WEA_MEM_OUT: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--ADDR_IN: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
--ADDR_OUT: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
--EN_MEM_OUT: IN STD_LOGIC;
--w00,w01,w02,w10,w11,w12,w20,w21,w22 : in std_logic_vector(3 downto 0);
--Pixel_out:   out STD_LOGIC_VECTOR(31 DOWNTO 0));
uut: reg_file port map (        clk_tb,
                                rst_tb,
                                padding,
                                simd,
                                ce_tb,
                                en_mem_in,
                                wea,
                                address_in,
                                address_out,
                                en_mem_out,
                                w00,w01,w02,w10,w11,w12,w20,w21,w22,
                                pix);


end Behavioral;
