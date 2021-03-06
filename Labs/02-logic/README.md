# 02-logic

## Truth table

### 
	| **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** |
	| :-: | :-: | :-: | :-: | :-: | :-: |
	| 0 | 0 0 | 0 0 | 0 | 1 | 0 |
	| 1 | 0 0 | 0 1 | 0 | 0 | 1 |
	| 2 | 0 0 | 1 0 | 0 | 0 | 1 |
	| 3 | 0 0 | 1 1 | 0 | 0 | 1 |
	| 4 | 0 1 | 0 0 | 1 | 0 | 0 |
	| 5 | 0 1 | 0 1 | 0 | 1 | 0 |
	| 6 | 0 1 | 1 0 | 0 | 0 | 1 |
	| 7 | 0 1 | 1 1 | 0 | 0 | 1 |
	| 8 | 1 0 | 0 0 | 1 | 0 | 0 |
	| 9 | 1 0 | 0 1 | 1 | 0 | 0 |
	| 10 | 1 0 | 1 0 | 0 | 1 | 0 |
	| 11 | 1 0 | 1 1 | 1 | 0 | 0 |
	| 12 | 1 1 | 0 0 | 1 | 0 | 0 |
	| 13 | 1 1 | 0 1 | 1 | 0 | 0 |
	| 14 | 1 1 | 1 0 | 0 | 0 | 1 |
	| 15 | 1 1 | 1 1 | 0 | 1 | 0 |

## K.Map

### ![ScreenShot](https://github.com/xmatou35/Digital-electronics-1/blob/main/Labs/02-logic/image/kmap.jpg)
#### *https://github.com/xmatou35/Digital-electronics-1/blob/main/Labs/02-logic/image/kmap.jpg*

## VHDL code

#### **https://www.edaplayground.com/x/Bvup**

### *testbranch* 

#### 		library ieee;
		use ieee.std_logic_1164.all;

		------------------------------------------------------------------------
		-- Entity declaration for testbench
		------------------------------------------------------------------------
		entity tb_comparator_2bit is
		end entity tb_comparator_2bit;

		------------------------------------------------------------------------
		-- Architecture body for testbench
		------------------------------------------------------------------------
		architecture testbench of tb_comparator_2bit is

  		 -- Local signals
  		 signal s_a       : std_logic_vector(4 - 1 downto 0);
   		 signal s_b       : std_logic_vector(4 - 1 downto 0);
   		 signal s_B_greater_A : std_logic;
   		 signal s_B_equals_A  : std_logic;
  		 signal s_B_less_A    : std_logic;

		 begin
    		 -- Connecting testbench signals with comparator_2bit entity (Unit Under Test)
    		 uut_comparator_2bit : entity work.comparator_2bit
        	 port map(
            	 a_i           => s_a,
           	 b_i           => s_b,
            	 B_greater_A_o => s_B_greater_A,
           	 B_equals_A_o  => s_B_equals_A,
           	 B_less_A_o    => s_B_less_A
       		 );

    		 --------------------------------------------------------------------
    		 -- Data generation process
    		 --------------------------------------------------------------------
    		 p_stimulus : process
    		 begin
        	 -- Report a note at the beginning of stimulus process
        	 report "Stimulus process started" severity note;


        -- First test values
        s_b <= "0000"; s_a <= "0000"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '1') and (s_B_less_A = '0'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0000" severity error;
        
        	s_b <= "0000"; s_a <= "0001"; wait for 100 ns;
			assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
			report "Test failed for input combination: 0000, 0001" severity error;       

			s_b <= "0000"; s_a <= "0010"; wait for 100 ns;
			assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
			report "Test failed for input combination: 0000, 0010" severity error;       

			s_b <= "0000"; s_a <= "0011"; wait for 100 ns;
			assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
			report "Test failed for input combination: 0000, 0011" severity error;       

			s_b <= "0001"; s_a <= "0000"; wait for 100 ns;
			assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
			report "Test failed for input combination: 0001, 0000" severity error;      

			s_b <= "0001"; s_a <= "0001"; wait for 100 ns;
			assert ((s_B_greater_A = '0') and (s_B_equals_A = '1') and (s_B_less_A = '0'))
			report "Test failed for input combination: 0001, 0001" severity error;

			s_b <= "0001"; s_a <= "0010"; wait for 100 ns;
			assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
			report "Test failed for input combination: 0001, 0010" severity error;

			s_b <= "0001"; s_a <= "0011"; wait for 100 ns;
			assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
			report "Test failed for input combination: 0001, 0011" severity error;

			s_b <= "0010"; s_a <= "0000"; wait for 100 ns;
			assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
			report "Test failed for input combination: 0010, 0000" severity error;

			s_b <= "0010"; s_a <= "0001"; wait for 100 ns;
			assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
			report "Test failed for input combination: 0010, 0001" severity error;

			s_b <= "0100"; s_a <= "0000"; wait for 100 ns;
			assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '1')) 
			report "Test failed for input combination: 0100, 0000" severity error;			-- chyba


       	 -- Report a note at the end of stimulus process
       	 report "Stimulus process finished" severity note;
       	 wait;
   	 end process p_stimulus;

	end architecture testbench;

### Design

#### 
	library ieee;
	use ieee.std_logic_1164.all;

	------------------------------------------------------------------------
	-- Entity declaration for 2-bit binary comparator
	------------------------------------------------------------------------
	entity comparator_2bit is
    	port(
        a_i           : in  std_logic_vector(4 - 1 downto 0);
        b_i			  : in  std_logic_vector(4 - 1 downto 0);
        B_less_A_o    : out std_logic;	      
        B_greater_A_o : out std_logic;
        B_equals_A_o   : out std_logic
        
   	 );
	end entity comparator_2bit;

	------------------------------------------------------------------------
	-- Architecture body for 2-bit binary comparator
	------------------------------------------------------------------------
	architecture Behavioral of comparator_2bit is
	begin
   	 B_less_A_o   <= '1' when (b_i < a_i) else '0';
	B_greater_A_o<= '1' when (b_i > a_i) else '0';
   	 B_equals_A_o <= '1' when (b_i = a_i) else '0';

	end architecture Behavioral;

### console

#### 
	[2021-02-23 17:32:48 EST] ghdl -i design.vhd testbench.vhd  && ghdl -m  tb_comparator_2bit && ghdl -r  tb_comparator_2bit   --vcd=dump.vcd && sed -i 's/^U/X/g; s/^-/X/g; s/^H/1/g; s/^L/0/g' dump.vcd 
	analyze design.vhd
	analyze testbench.vhd
	elaborate tb_comparator_2bit
	testbench.vhd:52:9:@0ms:(report note): Stimulus process started
	testbench.vhd:125:24:@1700ns:(assertion error): Test failed for input combination: 0100, 0000
	testbench.vhd:130:9:@1700ns:(report note): Stimulus process finished
	Finding VCD file...
	./dump.vcd
	[2021-02-23 17:32:49 EST] Opening EPWave...
	Done
