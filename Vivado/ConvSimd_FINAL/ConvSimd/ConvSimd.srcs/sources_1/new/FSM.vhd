----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.10.2021 15:55:30
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM is
PORT ( START:       IN STD_LOGIC;
       RST:         IN STD_LOGIC;
       CLK:         IN STD_LOGIC;
       RST_OUT:     OUT STD_LOGIC;
       ADDR_IN:     OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
       VALID:       OUT STD_LOGIC;
       ADDR_OUT:    OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
       EN_MEM_IN:   OUT STD_LOGIC;
       EN_MEM_OUT:  OUT STD_LOGIC;
       WEA_MEM_OUT: OUT STD_LOGIC_vector(0 downto 0);
       CE:          OUT STD_LOGIC;
       PADDING:     OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
end FSM;

architecture Behavioral of FSM is
type state is (IDLE, WAIT_LATENCY, ELABORATION, END_ELABORATION);
signal current_state: state;
SIGNAL RST_OUTT: STD_LOGIC;
constant PAD_1: std_logic_vector(7 downto 0):="11010000"; -- pixel in alto a sx (0,0)
constant PAD_2: std_logic_vector(7 downto 0):="11111000"; --  prima riga (0,i)
constant PAD_3: std_logic_vector(7 downto 0):="01101000"; -- pixel in alto a dx (0,63)
constant PAD_4: std_logic_vector(7 downto 0):="11010110"; -- prima colonna (j,0)
constant PAD_5: std_logic_vector(7 downto 0):="00010110"; -- pixel in basso a sx (63,0)
constant PAD_6: std_logic_vector(7 downto 0):="00011111"; -- ultima riga  (63,i)
constant PAD_7: std_logic_vector(7 downto 0):="00001011"; --  pixel in baso a dx (63,63)
constant PAD_8: std_logic_vector(7 downto 0):="01101011"; -- pixel ultima colonna (j,63)
constant PAD_9: std_logic_vector(7 downto 0):="11111111";-- tutti 1 finche non arriva primo dato valido

constant LATENCY: STD_LOGIC_VECTOR (6 DOWNTO 0):= "1000011"; -- 65+1mem? COLPI DI CLOCK NECESARRI A PRODURRE IL PRIMO DATO UTILE
constant latenc: integer:=77;
signal delay: integer:=0;
SIGNAL VALID_s: std_logic;
constant FINE_COLONNA: STD_LOGIC_VECTOR (5 DOWNTO 0):= "111111"; --63 è ULTIMA RIGA
signal address_mem_in, address_mem_out: std_logic_vector(11 downto 0):=(others=>'0');
signal riga,colonna: std_logic_vector(5 downto 0):="000000"; 
--signal rst_t: std_logic;




begin
PROCESS (CLK) IS
BEGIN 
    IF (rising_edge(clk)) then  
            delay<=delay+1;
        if rst='1' then
            current_state<=IDLE;
            PADDING<=(OTHERS=>'0');
            rst_outt<='1';
            valid_s<='0';
            en_mem_in<='0';
            en_mem_out<='0';
            wea_mem_out<="0";
        else
        
            case CURRENT_STATE IS
                
                WHEN IDLE=>
                    rst_outt<='1';
                    ce<='0';
                    valid_s<='0';
                    PADDING<=(OTHERS=>'0');      --- IN IDLE viene preparata la finestra per il primo valore
                    en_mem_in<='0';
                    en_mem_out<='0';
                    wea_mem_out<="0";
                    riga<=(others=>'0');
                    colonna<=(others=>'0');
                    address_mem_in<=(others=>'0');
                    address_mem_out<=(others=>'0');
                    IF (START='1') THEN
                        CURRENT_STATE<=WAIT_LATENCY;
                         rst_outt<='0';
                         EN_MEM_IN<='1';
                         valid_S<='0';
                         --address_mem_in<=address_mem_in+1;
                        ce<='1';
                        ELSE
                            RST_OUTt<='1';
                    END IF;
             
                    
                    
               WHEN WAIT_LATENCY=>
               
                     rst_outt<='0';
                     en_mem_in<='1';
                     en_mem_out<='0';
                     address_mem_out<=(others=>'0');
                     wea_mem_out<="0";
                     address_mem_in<=address_mem_in+1;

                     if (address_mem_in = LATENCY) then     
                        CURRENT_STATE<=ELABORATION;
                        en_mem_out<='1';
                        wea_mem_out<="1";
                        PADDING<=PAD_1; 
                        --valid_S<='1';
                      else 
                        current_state<=wait_latency;
                        end if;
                     
                  
                 WHEN ELABORATION=>
                    -- valid_s<='1';
                     rst_outt<='0';
                     en_mem_in<='1';
                     en_mem_out<='1';
                     colonna<=colonna+1;
                    if (address_mem_in>latenc) then
                        address_mem_out<=address_mem_out+1;
                        
                        END IF;
                    if (address_mem_in>(latenc+1)) then
                          valid_s<='1';
                      end if;
                    if (colonna = 63) THEN
                                        riga<=riga+1;
                    end if;
                     -- GESTIONE PADDING
                    
                     if (riga=0) then
                            if (colonna=63) then
                                   PADDING<=PAD_4; 
                            elsif (colonna=62) then 
                                   PADDING<=PAD_3; 
                            else
                                   PADDING<=PAD_2;
 
                            end if;
                     ELSIF (RIGA=62) THEN
                            if (colonna=63) then
                                PADDING<=PAD_5;

                               
                            elsif (colonna=62) then
                                PADDING<=PAD_8;
                            else 
                                  PADDING<=PAD_9; 
                            END IF;  
                     ELSIF (RIGA=63) THEN
                            IF (COLONNA=63) THEN
                                   PADDING<=PAD_1;                
                            ELSIF
                               (COLONNA=62) THEN
                                    PADDING<=PAD_7;
                           ELSE
                                    PADDING<=PAD_8;
                            END IF;
                        ELSE
                            IF (COLONNA=63) THEN
                                   PADDING<=PAD_4; 
                                                         
                            ELSIF
                                   (COLONNA=62) THEN
                                          PADDING<=PAD_8;
                            ELSE
                                                       
                               PADDING<=PAD_9;
                         END IF;

                         
                     END IF;

                     
                     address_mem_in<=address_mem_in+1;
                                        --  address_mem_out<=address_mem_out+1;
                     wea_mem_out<="1"; -- ABILITO LA SCRITTURA DOPO IL PADDING

                     if (address_mem_in = "111111111111") then                   -- 4095  
                        CURRENT_STATE<=END_ELABORATION;
                        valid_s<='1';
                        --en_mem_in<='0';
                        

--                 
                        
                     else
                        CURRENT_STATE<=ELABORATION;
                        
                     end if;

             when END_ELABORATION =>
                rst_outt<='0';
                en_mem_in<='0';
                en_mem_out<='1';
                wea_mem_out<="1";
                address_mem_in<=(others=>'0');
                address_mem_out<=address_mem_out+1;
                IF (RIGA=62) THEN
                       if (colonna=63) then
                           PADDING<=PAD_5;

                          
                       elsif (colonna=62) then
                           PADDING<=PAD_8;
                       else 
                             PADDING<=pad_9; 
                       END IF;  
                ELSIF (RIGA=63) THEN
                       IF (COLONNA=63) THEN
                             PADDING<=PAD_1;   
                             --PADDING<=(others=>'0');              
                       ELSIF
                          (COLONNA=62) THEN
                               PADDING<=PAD_7;
                      ELSE
                               PADDING<=PAD_6;
                       END IF;
                    END IF;

                
                if (address_mem_out = "111111111111"+1) then
                    en_mem_out<='0';
                    wea_mem_out<="0";
                elsif (address_mem_out = "111111111111"+2) then
                      CURRENT_STATE<=IDLE;
                      valid_s<='0';
                      en_mem_out<='0';
                      wea_mem_out<="0";
                      colonna<=(others=>'0');
                      riga<=(others=>'0');
                      ce<='0';
                      rst_outt<='1';
                      PADDING<=(OTHERS=>'0'); 
                      --valid_s<='0';
                else
                    CURRENT_STATE<=END_ELABORATION;
                    
                       if (colonna = 63) then
                                         colonna<=(others=>'0');
                                         riga<=riga+1;
                                      end if;
                            colonna<=colonna+1;
                        valid_s<='1';
                end if;
--                if (colonna=63 and riga=63) then
--                       PADDING<=(OTHERS=>'0'); 
                    
                      --valid_s<='0';
            end case;
        end if;
    end if;
  end process;          

addr_in<=address_mem_in;
addr_out<=address_mem_out;
RST_OUT<=RST_OUTT;
valid<=valid_s;
end Behavioral;
