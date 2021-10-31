----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity Mux11 is
Port (
    a, b: in std_logic_vector(11 downto 0);
    sel: in std_logic;
    z : out std_logic_vector(11 downto 0));
end Mux11;

architecture Behavioral of Mux11 is


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
-- 
----------------------------------------------------------------------------------
