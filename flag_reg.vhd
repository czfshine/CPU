library ieee;
use ieee.std_logic_1164.all;

entity flag_reg is
	port(sst:                         in std_logic_vector(1 downto 0);
	     c,z,v,s,clk,reset:           in std_logic;
	     flag_c,flag_z,flag_v,flag_s: out std_logic);
end flag_reg;

architecture behave of flag_reg is
begin
end behave;