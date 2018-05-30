library ieee;
use ieee.std_logic_1164.all;

entity timer is
   port(
      clk      : in std_logic;
      reset    : in std_logic;
      ins      : in std_logic_vector(7 downto 0);
      output   : out std_logic_vector(2 downto 0));
end timer;

architecture behave of timer is
	type state_type is(s0,s1,s2,s3,s4,s5);
	signal state:state_type;
begin
end behave;	