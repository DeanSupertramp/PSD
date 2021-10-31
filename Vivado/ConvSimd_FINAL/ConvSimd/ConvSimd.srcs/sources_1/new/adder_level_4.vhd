----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2021 11:44:51
-- Design Name: 
-- Module Name: adder_level_1 - Behavioral
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

entity adder_level_4 is
PORT(A,B,C,D: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
     sel: in std_logic;
     Sum,Sum_2: out std_logic_vector(15 downto 0));
end adder_level_4;

architecture Behavioral of adder_level_4 is
component FA
port (A,B,Cin: in std_logic;
      Cout,Sum: out std_logic);
end component;

signal cint: std_logic_vector(14 downto 0);
signal cintM: std_logic_vector(14 downto 0);
signal Sum1,Sum2: std_logic_vector(16 downto 0);
signal carry_12: std_logic;

begin
FA0: FA port map (c(0),D(0),'0',cint(0),Sum1(0));
FA15: FA port map (C(15),D(15),cint(14),Sum1(16),Sum1(15));
GEN_FA:
FOR i in 1 to 14 generate
    FAX: FA port map (C(i),D(i), cint(i-1),cint(i),Sum1(i));
end generate GEN_FA;


-------------------------------------------------

FA_M0: FA port map (A(0),B(0),carry_12,cintM(0),Sum2(0));
FA15_M: FA port map (A(15),B(15),cintM(14),Sum2(16),Sum2(15));
GEN_FA_M:
FOR j in 1 to 14 generate
    FAX_M: FA port map (A(j),B(j), cintM(j-1),cintM(j),Sum2(j));
end generate GEN_FA_M;
Sum<=Sum1(15 downto 0);
Sum_2<=Sum2(15 downto 0);
process (sel,cint(11))
begin
    if (sel='1') then
        carry_12<='0';
    else
        carry_12 <=cint(11);
end if;

end process;

END Behavioral;
