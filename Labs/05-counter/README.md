# 05-counter

### *Tomas Matousek 222734*

## Calculating clock period
| **Time interval** | **Number of clk periods** | **Number of clk periods in hex** | **Number of clk periods in binary** |
| :-: | :-: | :-: | :-: |
| 2&nbsp;ms   | 200 000     | `x"3_0d40"`   |`b"0011_0000_1101_0100_0000"`           |
| 4&nbsp;ms   | 400 000     | `x"6_1A80"`   |                                        |
| 10&nbsp;ms  | 1 000 000   | `x"F_4240"`   |                                        |
| 250&nbsp;ms | 25 000 000  | `x"17D_7840"` |                                        |
| 500&nbsp;ms | 50 000 000  | `x"2FA_F080"` |                                        |
| 1&nbsp;sec  | 100 000 000 | `x"5F5_E100"` |`b"0101_1111_0101_1110_0001_0000_0000"` |

### Part of code

```
p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                           -- Process is suspended forever
    end process p_clk_gen;
```

```
p_clk_ena : process(clk)
    begin
        if rising_edge(clk) then        -- Synchronous process

            if (reset = '1') then       -- High active reset
                s_cnt_local <= 0;       -- Clear local counter
                ce_o        <= '0';     -- Set output to low

            -- Test number of clock periods
            elsif (s_cnt_local >= (g_MAX - 1)) then
                s_cnt_local <= 0;       -- Clear local counter
                ce_o        <= '1';     -- Generate clock enable pulse

            else
                s_cnt_local <= s_cnt_local + 1;
                ce_o        <= '0';
            end if;
        end if;
    end process p_clk_ena;
```