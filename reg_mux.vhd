library ieee;
use ieee.std_logic_1164.all;

entity reg_mux is
	port(reg_0:   in std_logic_vector(7 downto 0);
	     reg_1:   in std_logic_vector(7 downto 0);
		 reg_2:   in std_logic_vector(7 downto 0);
		 reg_3:   in std_logic_vector(7 downto 0);
		 reg_4:   in std_logic_vector(7 downto 0);
		 reg_5:   in std_logic_vector(7 downto 0);
		 reg_6:   in std_logic_vector(7 downto 0);
		 reg_7:   in std_logic_vector(7 downto 0);
		 reg_8:   in std_logic_vector(7 downto 0);
		 reg_9:   in std_logic_vector(7 downto 0);
		 reg_a:   in std_logic_vector(7 downto 0);
		 reg_b:   in std_logic_vector(7 downto 0);
		 reg_c:   in std_logic_vector(7 downto 0);
   		 reg_d:   in std_logic_vector(7 downto 0);
		 reg_e:   in std_logic_vector(7 downto 0);
		 reg_f:   in std_logic_vector(7 downto 0);
		 dest_reg:in std_logic_vector(3 downto 0);
		 sour_reg:in std_logic_vector(3 downto 0);
		 reg_sel: in std_logic_vector(3 downto 0);
		 en:      in std_logic;
		 en_0:    out std_logic;
	     en_1:    out std_logic;
		 en_2:    out std_logic;
		 en_3:    out std_logic;
		 en_4:    out std_logic;
		 en_5:    out std_logic;
		 en_6:    out std_logic;
		 en_7:    out std_logic;
		 en_8:    out std_logic;
		 en_9:    out std_logic;
		 en_a:    out std_logic;
		 en_b:    out std_logic;
		 en_c:    out std_logic;
   		 en_d:    out std_logic;
		 en_e:    out std_logic;
		 en_f:    out std_logic;
		 dr:      out std_logic_vector(7 downto 0);
	     sr:      out std_logic_vector(7 downto 0);
	     reg_out: out std_logic_vector(7 downto 0));
end reg_mux;

architecture behave of reg_mux is
begin
	
end behave;