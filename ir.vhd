library ieee;
use ieee.std_logic_1164.all;

entity ir is
	port(mem_data:  in std_logic_vector(7 downto 0);
	     rec:       in std_logic_vector(1 downto 0);
	     clk,reset: in std_logic;
	     q:         out std_logic_vector(7 downto 0));
end ir;

architecture behave of ir is
begin
end behave;