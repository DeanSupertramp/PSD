----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.09.2021 17:37:16
-- Design Name: 
-- Module Name: MUX24 - Behavioral
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

entity MUX24 is
Port (
    a, b: in std_logic_vector(23 downto 0);
    sel: in std_logic;
    z : out std_logic_vector(23 downto 0));
end MUX24;

architecture Behavioral of MUX24 is


begin
process(sel,a,b)
begin

if(sel = '0') then
    z <= a;
else
    z <= b;
end if;
end process;
end Behavioral;
