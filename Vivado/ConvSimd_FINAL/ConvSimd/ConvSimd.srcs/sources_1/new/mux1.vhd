----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2021 16:55:22
-- Design Name: 
-- Module Name: mux1 - Behavioral
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

entity mux1 is
PORT (A,B,SEL: IN STD_LOGIC;
      Z: OUT STD_LOGIC);
      
end mux1;

architecture Behavioral of mux1 is

begin
PROCESS(A,B,SEL)
BEGIN
IF (SEL='0') THEN
    Z<=A;
ELSE
    Z<=b;
END IF;
END PROCESS;


end Behavioral;
