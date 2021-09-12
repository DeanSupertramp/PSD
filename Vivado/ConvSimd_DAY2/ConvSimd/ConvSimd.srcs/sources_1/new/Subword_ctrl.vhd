----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.09.2021 16:38:24
-- Design Name: 
-- Module Name: Subword_ctrl - Behavioral
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


entity Subword_ctrl is
PORT (A: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      PADDING_CTRL: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      Z: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
end Subword_ctrl;

architecture Behavioral of Subword_ctrl is
signal b: std_logic_vector(7 downto 0);
begin
b<="0000"&padding_ctrl;
z<=A and b;


end Behavioral;
