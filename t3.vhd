library ieee;
use ieee.std_logic_1164.all;

entity t3 is
port(wr          : in std_logic;
     alu_out     : in std_logic_vector(7 downto 0);
     output      : out std_logic_vector(7 downto 0));
end t3;

architecture behave of t3 is
begin
end behave;