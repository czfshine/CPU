library ieee;
use ieee.std_logic_1164.all;

entity reg_testa is
	port(clk,reset   : in std_logic;
		 input_a     : in std_logic_vector(2 downto 0);
		 input_b     : in std_logic_vector(2 downto 0);
		 input_c     : in std_logic_vector(2 downto 0);
		 cin         : in std_logic;
		 rec         : in std_logic_vector(1 downto 0);
		 pc_en,reg_en: in std_logic;
	     q           : out std_logic_vector(7 downto 0));
end reg_testa;

architecture behave of reg_testa is
begin
end behave;