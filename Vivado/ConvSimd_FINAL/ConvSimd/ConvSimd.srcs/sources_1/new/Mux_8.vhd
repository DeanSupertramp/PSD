----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.09.2021 17:56:24
-- Design Name: 
-- Module Name: MuxExt - Behavioral
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

entity Mux_8 is
port ( A: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       sel: in std_logic;
       Z: out std_logic_vector(7 downto 0));
end Mux_8;

architecture Behavioral of Mux_8 is

begin
process (A,sel)
begin
    if (sel='1') then
        Z<=A;
    else
        Z<=(others=>('0'));
    end if;
end process;
  




end Behavioral;
