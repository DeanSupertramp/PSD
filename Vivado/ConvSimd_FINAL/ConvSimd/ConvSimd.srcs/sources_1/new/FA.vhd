----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.09.2021 10:48:09
-- Design Name: 
-- Module Name: FA - Behavioral
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

entity FA is
port (A,B,Cin: in std_logic;
      Cout,Sum: out std_logic);
end FA;

architecture Behavioral of FA is
signal g,p: std_logic;
begin
p<= A xor B;
Sum<= p xor Cin;
Cout<= A when p='0' else
      Cin when p='1' else 'X';
--p<=A xor B;
--Sum<=p xor Cin;
--process(p)
--begin
--    if (p='0') then
--        Cout<=A;
--    else
--        Cout<=Cin;
--end if;

--end process;
end Behavioral;
