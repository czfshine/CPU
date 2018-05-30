library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity alu is
port(cin:in std_logic;
     alu_a,alu_b:in std_logic_vector(7 downto 0);
     alu_func:in std_logic_vector(2 downto 0);
     alu_out:out std_logic_vector(7 downto 0);
     c,z,v,s:out std_logic);
end alu;

architecture behave of alu is
begin
end behave;