# 03-Vivado

### *tomas matousek 222734*

## 1.task

### *Not completed*

## 2.task

### VHDL Architecture
```
architecture Behavioral of mux_2bit_4to1 is
begin
        f_o <= a_i when (sel_i = "00") else
               b_i when (sel_i = "01") else
               c_i when (sel_i = "10") else
               d_i;                 -- All other combinations
       
end architecture Behavioral;
```

### VHDL stimulus process

```
p_stimulus : process
    begin

        report "Stimulus process started" severity note;
        
        s_d <= "11"; s_c <= "10"; s_b <= "01"; s_a <= "00";
        s_sel <= "00"; wait for 100 ns;
        s_sel <= "01"; wait for 100 ns;
        s_sel <= "11"; wait for 100 ns;
        s_sel <= "10"; wait for 100 ns;
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```
### Screenshot waveforms

![ScreenShot](https://github.com/xmatou35/VUT-Digital-Electronics-1/blob/Labs/03-vivado/Images/waveform.jpg)

## Vivado tutorial
![ScreenShot](https://github.com/xmatou35/VUT-Digital-Electronics-1/blob/Labs/03-vivado/Images/1.jpg)
![ScreenShot](https://github.com/xmatou35/VUT-Digital-Electronics-1/blob/Labs/03-vivado/Images/2.jpg)
![ScreenShot](https://github.com/xmatou35/VUT-Digital-Electronics-1/blob/Labs/03-vivado/Images/3.jpg)
![ScreenShot](https://github.com/xmatou35/VUT-Digital-Electronics-1/blob/Labs/03-vivado/Images/4.jpg)
![ScreenShot](https://github.com/xmatou35/VUT-Digital-Electronics-1/blob/Labs/03-vivado/Images/5.jpg)
![ScreenShot](https://github.com/xmatou35/VUT-Digital-Electronics-1/blob/Labs/03-vivado/Images/6.jpg)
![ScreenShot](https://github.com/xmatou35/VUT-Digital-Electronics-1/blob/Labs/03-vivado/Images/7.jpg)
![ScreenShot](https://github.com/xmatou35/VUT-Digital-Electronics-1/blob/Labs/03-vivado/Images/8.jpg)
![ScreenShot](https://github.com/xmatou35/VUT-Digital-Electronics-1/blob/Labs/03-vivado/Images/9.jpg)

###### [? Top](#table-of-contents)
