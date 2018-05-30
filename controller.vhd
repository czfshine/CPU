library ieee;
use ieee.std_logic_1164.all;

entity controller is
port(timer:                   in std_logic_vector(2 downto 0);
     instruction:             in std_logic_vector(7 downto 0);
     c,z,v,s:                 in std_logic;
     dest_reg,sour_reg:       out std_logic_vector(3 downto 0);
     offset:                  out std_logic_vector(7 downto 0);
     sst,sci,rec:             out std_logic_vector(1 downto 0);
     alu_func,alu_in_sel:     out std_logic_vector(2 downto 0);
     en_reg,en_pc,wr:         out std_logic);
end controller;

architecture behave of controller is
begin
end behave;