----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.09.2021 17:20:05
-- Design Name: 
-- Module Name: RCA_24 - Behavioral
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



entity RCA_24 is
PORT(A,B: IN STD_LOGIC_VECTOR(23 DOWNTO 0);
     Sum: out std_logic_vector(24 downto 0));
end RCA_24; 


architecture Behavioral of RCA_24 is
component FA
port (A,B,Cin: in std_logic;
      Cout,Sum: out std_logic);
end component;
signal cint: std_logic_vector(22 downto 0);
begin
FA0: FA port map (A(0),B(0),'0',cint(0),Sum(0));
FA31: FA port map (A(23),B(23),cint(22),Sum(24),Sum(23));
GEN_FA:
FOR i in 1 to 22 generate
    FAX: FA port map (A(i),B(i), cint(i-1),cint(i),Sum(i));
end generate GEN_FA;
END Behavioral;
