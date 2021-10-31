----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.10.2021 15:34:31
-- Design Name: 
-- Module Name: W2F - Behavioral
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
use STD.TEXTIO.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity W2F is
 PORT( VALID:   IN      STD_LOGIC;
       CLK:     IN      STD_LOGIC;
       PIX_OUT: in     STD_LOGIC_VECTOR(31 DOWNTO 0));
end W2F;

architecture Behavioral of W2F is
file res_file : text open write_mode is "file8_postimplementation.txt";
--signal pi_out: std_logic_vector(31 downto );

begin

PROCESS(CLK)
variable row:line;
begin
if (rising_edge(clk)) then
    if (valid='1') then
--            write(row, to_integer(unsigned(PIX_OUT(31 downto 16))) ,right, 0 );
--                writeline(res_file,row);
--                write(row, to_integer(unsigned(PIX_OUT(15 downto 0))) ,right, 0 );             --8
--                writeline(res_file,row);
                write(row, to_integer(unsigned(PIX_OUT)) ,right, 0 );                           --16
                writeline(res_file,row);
     end if;
end if;
end process;

end Behavioral;
