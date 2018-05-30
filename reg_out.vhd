library ieee;
use ieee.std_logic_1164.all;

entity reg_out is
    port(ir,pc,reg_in:        in std_logic_vector(7 downto 0);
         offset,alu_a,alu_b:  in std_logic_vector(7 downto 0);
         alu_out,reg_testa:   in std_logic_vector(7 downto 0);
         reg_sel:             in std_logic_vector(1 downto 0);
         sel:                 in std_logic_vector(1 downto 0);
         reg_data:            out std_logic_vector(7 downto 0));
end reg_out;

architecture behave of reg_out is
begin
end behave;
