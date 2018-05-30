library ieee;
use ieee.std_logic_1164.all;

entity reg is
	port(d:            in std_logic_vector(7 downto 0);
	     clk,reset,en: in std_logic;
	     q:out std_logic_vector(7 downto 0));
end reg;

architecture behave of reg is
begin
end behave;