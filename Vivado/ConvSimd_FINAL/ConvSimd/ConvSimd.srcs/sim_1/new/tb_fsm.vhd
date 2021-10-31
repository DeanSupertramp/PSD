----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.10.2021 11:35:47
-- Design Name: 
-- Module Name: tb_fsm - Behavioral
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

entity tb_fsm is
--  Port ( );
end tb_fsm;

architecture Behavioral of tb_fsm is
component FSM
PORT ( START:       IN STD_LOGIC;
       RST:         IN STD_LOGIC;
       CLK:         IN STD_LOGIC;
       ADDR_IN:     OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
       ADDR_OUT:    OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
       EN_MEM_IN:   OUT STD_LOGIC;
       EN_MEM_OUT:  OUT STD_LOGIC;
       WEA_MEM_OUT: OUT STD_LOGIC_vector(0 downto 0);
       CE:          OUT STD_LOGIC;
       PADDING:     OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
end COMPONENT;

SIGNAL START_TB:STD_LOGIC:='0';
SIGNAL RST_TB:STD_LOGIC:='0';
SIGNAL CLK_TB:STD_LOGIC:='1';

SIGNAL ADDR_IN_TB,ADDR_OUT_TB: STD_LOGIC_VECTOR(11 DOWNTO 0):=(OTHERS=>'0');
SIGNAL EN_MEM_OUT_TB,EN_MEM_IN_TB: STD_LOGIC:='0';
SIGNAL CE_TB: STD_LOGIC:='0';
SIGNAL PADDING_TB: STD_LOGIC_VECTOR(7 DOWNTO 0):="11111111";
signal wea_mem_out_tb: std_logic_vector(0 downto 0):="0";

constant clk_period : time := 10 ns;

begin



process
begin
    clk_tB<='0';
    wait for clk_period/2;
    clk_tB<='1';
    wait for clk_period/2;
end process;
PROCESS
begin
    WAIT FOR 100 NS;
    rst_tb <='1';
    --ce_tb<='0';
    wait for 100ns;
    rst_tb<='0';
    --ce_tb<='1';
    start_tb<='1';
    wait for 41830 ns;
END PROCESS;

uut: fsm port map (start_tb,rst_tb,clk_tb,addr_in_tb,addr_out_tb,en_mem_in_tb,en_mem_out_tb,wea_mem_out_tb,ce_tb,padding_tb);

end Behavioral;
