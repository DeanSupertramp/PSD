----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2021 16:13:16
-- Design Name: 
-- Module Name: RCA16 - Behavioral
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

entity RCA_17 is
PORT(A,B: IN STD_LOGIC_VECTOR(16 DOWNTO 0);
     Sum: out std_logic_vector(17 downto 0));
end RCA_17;

architecture Behavioral of RCA_17 is
component FA
port (A,B,Cin: in std_logic;
      Cout,Sum: out std_logic);
end component;

signal cint: std_logic_vector(15 downto 0);
begin
FA0: FA port map (A(0),B(0),'0',cint(0),Sum(0));
FA31: FA port map (A(16),B(16),cint(15),Sum(17),Sum(16));
GEN_FA:
FOR i in 1 to 15 generate
    FAX: FA port map (A(i),B(i), cint(i-1),cint(i),Sum(i));
end generate GEN_FA;
END Behavioral;
