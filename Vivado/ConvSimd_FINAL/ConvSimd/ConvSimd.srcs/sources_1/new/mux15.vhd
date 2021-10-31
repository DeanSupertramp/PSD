----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.10.2021 10:54:09
-- Design Name: 
-- Module Name: MUX13 - Behavioral
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

entity Mux15 is
port ( A,B: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
       sel: in std_logic;
       Z: out std_logic_vector(15 downto 0));
end Mux15;

architecture Behavioral of Mux15 is

begin
process (A,B,sel)
begin
    if (sel='0') then
        Z<=A;
    else
        Z<=B;
    end if;
end process;
  




end Behavioral;
