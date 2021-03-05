------------------------------------------------------------------------
--
-- Testbench for 2-bit binary comparator.
-- EDA Playground
--
-- Copyright (c) 2020-2021 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
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
    signal s_a       : std_logic_vector(2 - 1 downto 0);
    signal s_b       : std_logic_vector(2 - 1 downto 0);
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
        
        s_b <= "00"; s_a <= "00"; wait for 100 ns;
        s_b <= "00"; s_a <= "01"; wait for 100 ns;
        s_b <= "00"; s_a <= "11"; wait for 100 ns;
        
   --     	s_b <= "0000"; s_a <= "0001"; wait for 100 ns;
	--		assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
	--		report "Test failed for input combination: 0000, 0001" severity error;       

	--		s_b <= "0000"; s_a <= "0010"; wait for 100 ns;
	--		assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
	--		report "Test failed for input combination: 0000, 0010" severity error;       

	--		s_b <= "0000"; s_a <= "0011"; wait for 100 ns;
	--		assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
	--		report "Test failed for input combination: 0000, 0011" severity error;       
--
	--		s_b <= "0001"; s_a <= "0000"; wait for 100 ns;
	--		assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
	--		report "Test failed for input combination: 0001, 0000" severity error;      

	--		s_b <= "0001"; s_a <= "0001"; wait for 100 ns;
	--		assert ((s_B_greater_A = '0') and (s_B_equals_A = '1') and (s_B_less_A = '0'))
	--		report "Test failed for input combination: 0001, 0001" severity error;

	--		s_b <= "0001"; s_a <= "0010"; wait for 100 ns;
	--		assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
	--		report "Test failed for input combination: 0001, 0010" severity error;

	--		s_b <= "0001"; s_a <= "0011"; wait for 100 ns;
	--		assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
	--		report "Test failed for input combination: 0001, 0011" severity error;

	--		s_b <= "0010"; s_a <= "0000"; wait for 100 ns;
	--		assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
	--		report "Test failed for input combination: 0010, 0000" severity error;

	--		s_b <= "0010"; s_a <= "0001"; wait for 100 ns;
	--		assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
	--		report "Test failed for input combination: 0010, 0001" severity error;

	--		s_b <= "0100"; s_a <= "0000"; wait for 100 ns;
	--		assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '1')) 
	--		report "Test failed for input combination: 0100, 0000" severity error;			-- chyba


        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
