library ieee;
use ieee.std_logic_1164.all;

entity ar is
	port(alu_out:   in std_logic_vector(7 downto 0);
	     pc:        in std_logic_vector(7 downto 0);
	     rec:       in std_logic_vector(1 downto 0);
	     clk,reset: in std_logic;
	     q:         out std_logic_vector(7 downto 0));
end ar;

architecture behave of ar is
begin
end behave;