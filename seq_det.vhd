--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    08:24:04 04/27/23
-- Design Name:    
-- Module Name:    seq_det - Behavioral
-- Project Name:   
-- Target Device:  
-- Tool versions:  
-- Description:
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Mealy Sequence detector for detecting the sequence "11011".
--2 bit overlapping.

entity seq_det is
	port(	clk : in std_logic;
			reset : in std_logic;
			input : in std_logic;
			output : out std_logic);
end seq_det;

architecture Behavioural of seq_det is

type state_type is (s0,s1,s2,s3,s4);
signal state : state_type := s0;
begin
process(clk, reset)
begin
if( reset = '1' ) then
	output <= '0';
	state <= s0;
elsif ( rising_edge(clk) ) then
	case state is
		when s0 =>
		output <= '0';
		if ( input = '0' ) then
			state <= s0;
		else
			state <= s1;
		end if;
		when s1 =>
		if ( input = '0' ) then
			state <= s0;
			output<='0';
		else
			state <= s2;
			output<='0';
		end if;
		when s2 =>
		if ( input = '0' ) then
			state <= s3;
			output<='0';
		else
			state <= s2;
			output<='0';
		end if;
		when s3 =>
		if ( input = '0' ) then
			state <= s0;
			output<='0';
		else
			state <= s4;
			output<='0';
		end if;
		when s4 =>
		if ( input = '0' ) then
			state <= s0;
			output<='0';
		else	
			state <= s2;
			output <= '1';
		end if;
	when others => NULL;
end case;
end if;
end process;
end Behavioural;