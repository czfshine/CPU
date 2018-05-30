library ieee;
use ieee.std_logic_1164.all;

entity bus_mux is
	port(alu_in_sel            : in std_logic_vector(2 downto 0);
	     data,pc,offset,sr,dr  : in std_logic_vector(7 downto 0);
	     alu_sr,alu_dr         : out std_logic_vector(7 downto 0));
end bus_mux;

architecture behave of bus_mux is
begin
end behave;