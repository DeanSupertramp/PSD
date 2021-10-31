----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2021 17:24:00
-- Design Name: 
-- Module Name: TB_final - Behavioral
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
LIBRARY std;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;

use IEEE.NUMERIC_STD.ALL;
use std.textio.all;
use IEEE.std_logic_textio.all;





-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_final is
--  Port ( );
end TB_final;

architecture Behavioral of TB_final is
component CONV_SIMD_3X3
PORT ( START: IN STD_LOGIC;
       CLK:  IN STD_LOGIC;
       RST:  IN STD_LOGIC;
       SIMD: IN STD_LOGIC;
       w00,w01,w02,w10,w11,w12,w20,w21,w22 : in std_logic_vector(3 downto 0);
       valid: out std_logic;
       PIXEL_OUT: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END COMPONENT;
component w2f
 PORT( VALID:   IN      STD_LOGIC;
      CLK:     IN      STD_LOGIC;
      PIX_OUT: in     STD_LOGIC_VECTOR(31 DOWNTO 0));
end component;

SIGNAL START_TB:STD_LOGIC:='0';
SIGNAL RST_TB:STD_LOGIC:='1';
SIGNAL CLK_TB:STD_LOGIC:='0';
SIGNAL SIMD: STD_LOGIC:='0';
signal valid_1: std_logic:='0';
constant clk_period : time := 14 ns;
SIGNAL   w00_T,w01_T,w02_T,w10_T,w12_T,w20_T,w21_t,w22_t: std_logic_vector(3 downto 0):="0001";


signal w11_t: std_logic_vector(3 downto 0):="0001";
SIGNAL PIX_OUT_TB:STD_LOGIC_VECTOR(31 DOWNTO 0);--:=(others=>'0');

signal dataM,dataL: std_logic_vector(15 downto 0);





begin
process
begin
    clk_tB<='0';
    wait for clk_period/2;
    clk_tB<='1';
    wait for clk_period/2;
end process;
PROCESS

--variable row : line;
--variable value : std_logic_vector(15 downto 0);

begin
    --VALID_1<=VALID;
    WAIT FOR 132 NS;
    rst_tb <='1';
    wait for 68ns;
    rst_tb<='0';
    start_tb<='1';
    

 --while cont < xx loop
  --      if (rising_edge(clk_tb)) then
   -- if (valid_1='1') then
     -- if clk_tB = '1' then
  --WHILE valid_1= '1' loop
--  FOR  I IN 0 TO XX LOOP
--     if VALID_1 = '1'  then
--           if clk_tB = '1' then
----           WRITE (ROW,VALID_1,RIGHT,0);
----           WRITELINE(RES_FILE,ROW);
--            write(row, to_integer(unsigned(PIX_OUT_TB(31 downto 16))) ,right, 0 );
--            writeline(res_file,row);
--            write(row, to_integer(unsigned(PIX_OUT_TB(15 downto 0))) ,right, 0 );             --8
--            writeline(res_file,row);
----           write(row, to_integer(unsigned(PIX_OUT_TB)) ,right, 0 );                           16
----           writeline(res_file,row);
--            wait for clk_period;
--        end if;
--       END IF;
--    end LOOP;

    wait;
END PROCESS;

UUT: CONV_SIMD_3X3 port map (   START_TB,
                                 CLK_TB,
                                 RST_TB,
                                 SIMD,
                                 w00_T,w01_T,w02_T,w10_T,w11_t,w12_T,w20_T,w21_t,w22_t,
                                 valid_1,
                                 PIX_OUT_TB);
write: w2f port map( valid_1,
                     clk_tb,
                     pix_out_tb);
                    
--fs: fsm port map (
--                    Start_tb,
--                    CLK_TB,
--                    RST_TB,
--                    R,
--                    AIN,
--                    VALID_1,
--                    AOUT,
--                    ENIN,
--                    ENOUT,
--                    W,
--                    CEE,
--                    PAD);
                    
                    
dataM<=pix_out_tb(31 downto 16);
dataL<=pix_out_tb(15 downto 0);                   
end Behavioral;
