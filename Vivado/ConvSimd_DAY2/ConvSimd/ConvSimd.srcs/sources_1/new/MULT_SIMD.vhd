----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.09.2021 18:14:36
-- Design Name: 
-- Module Name: MULT_SIMD - Behavioral
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

entity MULT_SIMD is
port (PIXEL_IN: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      CLK:  IN STD_LOGIC;
      SIMD: IN STD_LOGIC;
      RST:  IN STD_LOGIC;
       W:   IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      PIXEL_MULTIPLIED: OUT STD_LOGIC_VECTOR (23 DOWNTO 0));
end MULT_SIMD;

architecture Behavioral of MULT_SIMD is
COMPONENT MUX_8
port ( A: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       sel: in std_logic;
       Z: out std_logic_vector(7 downto 0));
end COMPONENT;
-- INSERIRE MUX 13  (0.5 SECONDI)
-- INSERIRE MUX 1  (3 SECONDI)
-- DEFINIRE I SEGNALI REALTIVI A PRODOTTI PARZIALI: PP0,PP1,PP2,PP3,PP4,PP5,PP6,PP7,PP8,PP9
-- GESTIRE IL 2'S
-- GESTIRE I PRODOTTI PARZIALI NEL CASO DI PARALLESIMO 2
-- ESTENSIONE DEI  RISULTATI PRODOTTI PARZIALI (&) PRE-SOMMA ESTENDERLI A 24 BIT ESCULSO IL RIPORTO
-- ADDER TREE: APPROCCIO CARTA E PENNA IN PRIMIS, POI CARRY-SAVE.


begin

-- PROCESS: GESTIRE IL RST, CAMPIONARE I DATI NEI REGISTRI


end Behavioral;
