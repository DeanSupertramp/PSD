----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2021 16:59:32
-- Design Name: 
-- Module Name: CONV_SIMD_3X3 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CONV_SIMD_3X3 is
PORT ( START: IN STD_LOGIC;
       CLK:  IN STD_LOGIC;
       RST:  IN STD_LOGIC;
       SIMD: IN STD_LOGIC;
       w00,w01,w02,w10,w11,w12,w20,w21,w22 : in std_logic_vector(3 downto 0);
       valid: out std_logic;
       PIXEL_OUT: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
       
end CONV_SIMD_3X3;


architecture Behavioral of CONV_SIMD_3X3 is
-- REG FILE

COMPONENT reg_file
PORT (
       CLK: IN STD_LOGIC;
       RST: IN STD_LOGIC;
       PADDING: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       SIMD: IN STD_LOGIC;
       CE: IN STD_LOGIC;
       --VALID_IN: IN STD_LOGIC;
       EN_MEM_IN: IN STD_LOGIC;
       WEA_MEM_OUT: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
       ADDR_IN: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
       ADDR_OUT: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
       EN_MEM_OUT: IN STD_LOGIC;
       w00,w01,w02,w10,w11,w12,w20,w21,w22 : in std_logic_vector(3 downto 0);
       --valid: out std_logic;
       Pixel_out:   out STD_LOGIC_VECTOR(31 DOWNTO 0));
end component;

-- FSM
COMPONENT FSM
PORT ( START:       IN STD_LOGIC;
       RST:         IN STD_LOGIC;
       CLK:         IN STD_LOGIC;
       RST_OUT:     OUT STD_LOGIC;
       ADDR_IN:     OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
       Valid:       out std_logic;
       ADDR_OUT:    OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
       EN_MEM_IN:   OUT STD_LOGIC;
       EN_MEM_OUT:  OUT STD_LOGIC;
       WEA_MEM_OUT: OUT STD_LOGIC_vector(0 downto 0);
       CE:          OUT STD_LOGIC;
       PADDING:     OUT STD_LOGIC_VECTOR(7 DOWNTO 0));

END COMPONENT;

--- SEGNALI COLLEGAMENTI
-- COEFFICIENTI FILTRO
SIGNAL RST_c: std_logic;--:='1';
SIGNAL CE_c,En_memory_in,En_memory_out: std_logic;--:='0';
signal WEA_OUT: std_logic_vector(0 downto 0);--:="0";
signal address_in, address_out: std_logic_vector(11 downto 0);
signal pad_ctrl: std_logic_vector(7 downto 0);
signal valid_S,valid_r: std_logic;
--SIGNAL POUT: STD_LOGIC_VECTOR(31 DOWNTO 0);--:=(OTHERS=>'0');


begin
--pixel_out<=(others=>'0');
CONTROL_UNIT: FSM PORT MAP(
                            START,
                            RST,
                            CLK,
                            RST_C,
                            ADDRESS_IN,
                            valid_S,
                            ADDRESS_OUT,
                            En_memory_in,
                            En_memory_out,
                            WEA_OUT,
                            ce_c,
                            pad_ctrl);
                            
--       CLK: IN STD_LOGIC;
--                            RST: IN STD_LOGIC;
--                            PADDING: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--                            SIMD: IN STD_LOGIC;
--                            CE: IN STD_LOGIC;
--                            EN_MEM_IN: IN STD_LOGIC;
--                            WEA_MEM_OUT: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--                            ADDR_IN: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
--                            ADDR_OUT: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
--                            EN_MEM_OUT: IN STD_LOGIC;
--                            w00,w01,w02,w10,w11,w12,w20,w21,w22 : in std_logic_vector(3 downto 0);
--                            Pixel_out:   out STD_LOGIC_VECTOR(31 DOWNTO 0));
CONVOLUTORE: REG_FILE PORT MAP ( 
                                CLK,
                                RST_C,
                                --RST,
                                PAD_CTRL,
                                SIMD,
                                CE_C,
                                --valid_s,
                                En_memory_in,
                                WEA_OUT,
                                address_in,
                                address_out,
                                En_memory_out,
                                w00,w01,w02,w10,w11,w12,w20,w21,w22,
                                --valid_s,
                                pixel_out);
                                
--valid_r<=valid_s;
valid<=valid_s;

      
                           


end Behavioral;
