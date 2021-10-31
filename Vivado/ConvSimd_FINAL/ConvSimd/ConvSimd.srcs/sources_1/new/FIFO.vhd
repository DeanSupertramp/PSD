----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.09.2021 16:33:34
-- Design Name: 
-- Module Name: FIFO - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL; -- FORNISCE FUNZ ARITMETICHE X I VETT




-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIFO is     
generic (depth : integer:=61);
port (data_in: IN std_logic_vector (15 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      rst: in std_logic;
      data_out: OUT std_logic_vector (15 downto 0));
end FIFO;

architecture Behavioral of FIFO is
type reg_array is array (depth-1 downto 0) of std_logic_vector (15 downto 0);  -- creare un array 1D a cui associo un segnale
signal my_fifo : reg_array;
begin 
process (clk)--rst, clk)
begin

if rising_edge (clk) then
    if (rst='1') then
             for j in 0 to depth-1 loop
                my_fifo(j)<=(others=>'0');
             end loop;
   else
           if (ce='1') then
            for j in 1 to depth-1 loop
                my_fifo(j)<=my_fifo(j-1);    
            end loop;
        my_fifo(0)<=data_in;
   end if;
        end if;
        end if;
end process;
data_out <=my_fifo(depth-1);
       
end Behavioral;
