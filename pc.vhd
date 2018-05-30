library ieee;
use ieee.std_logic_1164.all;

entity pc is
	port(alu_out:   in std_logic_vector(7 downto 0);
	     en:        in std_logic;
	     clk,reset: in std_logic;
	     q:         out std_logic_vector(7 downto 0));
end pc;

architecture behave of pc is
begin
end behave;