
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_d_latch is
--  Port ( );
end tb_d_latch;

architecture Behavioral of tb_d_latch is
       signal s_en    : std_logic;
       signal s_arst  : std_logic;
       signal s_d     : std_logic;
       signal s_q     : std_logic; 
       signal s_q_bar : std_logic;
begin
        uut_d_latch: entity work.d_latch
        port map(
        en    => s_en,
        arst  => s_arst,
        d     => s_d,
        q     => s_q,
        q_bar => s_q_bar
        );
        
        p_reset_gen : process
        begin
            s_arst <= '0';
            wait for 38 ns;
            
            s_arst <= '1';
            wait for 53 ns;
            
            s_arst <= '0';
            
            wait for 300 ns;           
            s_arst <= '1';
            
            wait;
            
        end process p_reset_gen;
        
        p_stimulus : process
        begin
            report "Stimulus process start" severity note;
            s_d  <= '0';
            s_en <= '0';
            
            -- d sekv 
            wait for 10 ns;
            s_d  <= '1';            
            wait for 10 ns;
            s_d  <= '0';            
            wait for 10 ns;
            s_d  <= '1';           
            wait for 10 ns;
            s_d  <= '0';           
            wait for 10 ns;
            s_d  <= '1';           
            wait for 10 ns;
            s_d  <= '0';
            
            s_en <= '1';        -- en to 1
            
            -- d sekv 
            wait for 10 ns;
            s_d  <= '1';          
            wait for 10 ns;
            s_d  <= '0';       
            wait for 10 ns;
            s_d  <= '1';          
            wait for 10 ns;
            s_d  <= '0';           
            wait for 10 ns;
            s_d  <= '1';  
            wait for 10 ns;
            s_en <= '0';        -- en to 0    
            wait for 200 ns;
            s_d  <= '0';
            
           wait for 10 ns;
            s_d  <= '1';            
            wait for 10 ns;
            s_d  <= '0';            
            wait for 10 ns;
            s_d  <= '1';           
            wait for 10 ns;
            s_d  <= '0';           
            wait for 10 ns;
            s_d  <= '1';           
            wait for 10 ns;
            s_d  <= '0';
            
            
            
            report "stimulus process finished" severity note;
            wait;
        end process p_stimulus;

end Behavioral;
