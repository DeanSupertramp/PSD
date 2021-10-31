----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2021 15:53:52
-- Design Name: 
-- Module Name: RCA8 - Behavioral
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



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RCA8 is
PORT(A,B: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
     Sum: out std_logic_vector(8 downto 0));
     
end RCA8;

architecture Behavioral of RCA8 is
component FA
port (A,B,Cin: in std_logic;
      Cout,Sum: out std_logic);
end component;
signal cint: std_logic_vector(6 downto 0);
begin
FA0: FA port map (A(0),B(0),'0',cint(0),Sum(0));
FA31: FA port map (A(7),B(7),cint(6),Sum(8),Sum(7));
GEN_FA:
FOR i in 1 to 6 generate
    FAX: FA port map (A(i),B(i), cint(i-1),cint(i),Sum(i));
end generate GEN_FA;
END Behavioral;

