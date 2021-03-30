# 07-ffs

### Tomas Matousek 222734

## preparation task

| **D** | **q(n)** | **q(n+1)** | **Comm** |
| :-: | :-: | :-: | :-- |
| 0 | 0 | 0 | No change |
| 0 | 1 | 0 | Reset |
| 1 | 0 | 1 | Set |
| 1 | 1 | 1 | No change |

| **J** | **k** | **q(n)** | **q(n+1)** | **Comm** |
| :-: | :-: | :-: | :-: | :-- |
| 0 | 0 | 0 | 0 | No change |
| 0 | 0 | 1 | 1 | No change |
| 0 | 1 | 0 | 0 | Reset|
| 0 | 1 | 1 | 0 | Reset |
| 1 | 0 | 0 | 1 | Set |
| 1 | 0 | 1 | 1 | Set |
| 1 | 1 | 0 | 1 | Inverse |
| 1 | 1 | 1 | 0 | Inverse |

| **T** | **q(n)** | **q(n+1)** | **Comm** |
| :-: | :-: | :-: | :-- |
| 0 | 0 | 0 | No change |
| 0 | 1 | 1 | No change |
| 1 | 0 | 1 | Inverse |
| 1 | 1 | 0 | Inverse |

## Process 

```VHDL
p_d_latch : process(d, arst, en)
    begin   
        if (arst = '1') then
            q     <= '0';
            q_bar <= '1';
        elsif (en = '1') then
            q     <= d;
            q_bar <= not d; 
        end if;
    
    end process p_d_latch;
```

## Stimuluss process from the testbench

```VHDL
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
```

## Simulation 

![ScreenShot](https://github.com/xmatou35/Digital-Electronics-1/blob/main/Labs/07-ffs/Images/07-simulation.jpg)