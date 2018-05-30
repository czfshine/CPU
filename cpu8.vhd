library ieee;
use ieee.std_logic_1164.all;

entity cpu8 is
	port(clk : in std_logic;
		reset : in std_logic;
		sel :in std_logic_vector(1 downto 0) ;
		reg_sel : in std_logic_vector(3 downto 0) ;
		address_bus :out std_logic_vector(7 downto 0) ;
		wr :out std_logic;
		data_bus : inout std_logic_vector(7 downto 0) ;
		red_data : out std_logic_vector(7 downto 0) ;	
		c,z,v,s : out std_logic
		);
end cpu8;

architecture behave of cpu8 is
  
component controller is
port(timer:                   in std_logic_vector(2 downto 0);
     instruction:             in std_logic_vector(7 downto 0);
     c,z,v,s:                 in std_logic;
     dest_reg,sour_reg:       out std_logic_vector(3 downto 0);
     offset:                  out std_logic_vector(7 downto 0);
     sst,sci,rec:             out std_logic_vector(1 downto 0);
     alu_func,alu_in_sel:     out std_logic_vector(2 downto 0);
     en_reg,en_pc,wr:         out std_logic);
end component;

component t2 is
	port(offset_8:in std_logic_vector(7 downto 0);
     offset_16:out std_logic_vector(7 downto 0));
end component;

component pc is
	port(alu_out:   in std_logic_vector(7 downto 0);
	     en:        in std_logic;
	     clk,reset: in std_logic;
	     q:         out std_logic_vector(7 downto 0));
end component;


component reg is
	port(d:            in std_logic_vector(7 downto 0);
	     clk,reset,en: in std_logic;
	     q:out std_logic_vector(7 downto 0));
end component;


component reg_mux is
	port(reg_0:   in std_logic_vector(7 downto 0);
	     reg_1:   in std_logic_vector(7 downto 0);
		 reg_2:   in std_logic_vector(7 downto 0);
		 reg_3:   in std_logic_vector(7 downto 0);
		 dest_reg:in std_logic_vector(3 downto 0);
		 sour_reg:in std_logic_vector(3 downto 0);
		 reg_sel: in std_logic_vector(3 downto 0);
		 en:      in std_logic;
		 en_0:    out std_logic;
	     en_1:    out std_logic;
		 en_2:    out std_logic;
		 en_3:    out std_logic;
		 dr:      out std_logic_vector(7 downto 0);
	     sr:      out std_logic_vector(7 downto 0);
	     reg_out: out std_logic_vector(7 downto 0));
end component;

component flag_reg is
	port(sst:                         in std_logic_vector(1 downto 0);
	     c,z,v,s,clk,reset:           in std_logic;
	     flag_c,flag_z,flag_v,flag_s: out std_logic);
end component;

component t1 is
	port(flag_c:in std_logic;
	     sci:in std_logic_vector(1 downto 0);
	     alu_cin:out std_logic);
end component;

component ir is
	port(mem_data:  in std_logic_vector(7 downto 0);
	     rec:       in std_logic_vector(1 downto 0);
	     clk,reset: in std_logic;
	     q:         out std_logic_vector(7 downto 0));
end component;


component ar is
	port(alu_out:   in std_logic_vector(7 downto 0);
	     pc:        in std_logic_vector(7 downto 0);
	     rec:       in std_logic_vector(1 downto 0);
	     clk,reset: in std_logic;
	     q:         out std_logic_vector(7 downto 0));
end component;


component reg_testa is
	port(clk,reset   : in std_logic;
		 input_a     : in std_logic_vector(2 downto 0);
		 input_b     : in std_logic_vector(2 downto 0);
		 input_c     : in std_logic_vector(2 downto 0);
		 cin         : in std_logic;
		 rec         : in std_logic_vector(1 downto 0);
		 pc_en,reg_en: in std_logic;
	     q           : out std_logic_vector(7 downto 0));
end component;

component alu is
port(cin:in std_logic;
     alu_a,alu_b:in std_logic_vector(7 downto 0);
     alu_func:in std_logic_vector(2 downto 0);
     alu_out:out std_logic_vector(7 downto 0);
     c,z,v,s:out std_logic);
end component;

component bus_mux is
	port(alu_in_sel            : in std_logic_vector(2 downto 0);
	     data,pc,offset,sr,dr  : in std_logic_vector(7 downto 0);
	     alu_sr,alu_dr         : out std_logic_vector(7 downto 0));
end component;


component t3 is
port(wr          : in std_logic;
     alu_out     : in std_logic_vector(7 downto 0);
     output      : out std_logic_vector(7 downto 0));
end component;


component timer is
   port(
      clk      : in std_logic;
      reset    : in std_logic;
      ins      : in std_logic_vector(7 downto 0);
      output   : out std_logic_vector(2 downto 0));
end component;

component reg_out is
    port(ir,pc,reg_in:        in std_logic_vector(7 downto 0);
         offset,alu_a,alu_b:  in std_logic_vector(7 downto 0);
         alu_out,reg_testa:   in std_logic_vector(7 downto 0);
         reg_sel:             in std_logic_vector(3 downto 0);
         sel:                 in std_logic_vector(1 downto 0);
         reg_data:            out std_logic_vector(7 downto 0));
end component;


signal offset8 : std_logic_vector(7 downto 0);
signal pcen    : std_logic ;
signal regen   : std_logic;   
signal destreg : std_logic_vector(3 downto 0) ;
signal sourreg : std_logic_vector(3 downto 0) ;
signal sst_t   : std_logic_vector(1 downto 0) ;
signal sci_t   : std_logic_vector(1 downto 0) ;
signal rec_t   : std_logic_vector(1 downto 0) ;
signal off     : std_logic_vector(7 downto 0) ;
signal offout  : std_logic_vector(7 downto 0) ;
signal alu_fun : std_logic_vector(2 downto 0) ;
signal alu_out : std_logic_vector(7 downto 0) ;
signal timerout: std_logic_vector(2 downto 0) ;
signal instruction : std_logic_vector(7 downto 0) ;
signal con_wr  : std_logic;
signal con_c   : std_logic;
signal con_z   : std_logic;
signal con_v   : std_logic;
signal con_s   : std_logic;
signal alu_c   : std_logic;
signal alu_z   : std_logic;
signal alu_v   : std_logic;
signal alu_s   : std_logic;
signal alu_sr  : std_logic_vector(7 downto 0) ;
signal alu_dr  : std_logic_vector(7 downto 0) ;
signal cin     : std_logic;
signal alu_sel : std_logic_vector(2 downto 0) ;
signal idata   : std_logic_vector(7 downto 0) ;
signal pcdata  : std_logic_vector(7 downto 0) ;


signal reg0en  : std_logic;
signal reg1en  : std_logic;
signal reg2en  : std_logic;
signal reg3en  : std_logic;

signal reg0d   : std_logic_vector(7 downto 0) ;
signal reg1d   : std_logic_vector(7 downto 0) ;
signal reg2d   : std_logic_vector(7 downto 0) ;
signal reg3d   : std_logic_vector(7 downto 0) ;
signal regout_s: std_logic_vector(7 downto 0) ;
signal regsel  : std_logic_vector(3 downto 0) ;
signal regtests: std_logic_vector(7 downto 0) ;
signal regdr   : std_logic_vector(7 downto 0) ;
signal regsr   : std_logic_vector(7 downto 0) ;
signal a3 : std_logic_vector(2 downto 0);
signal a2 : std_logic_vector(1 downto 0);
signal a4 : std_logic_vector(3 downto 0);
signal a1 : std_logic;
signal a8 : std_logic_vector(7 downto 0);
begin

	-- ok 
  contro   : controller  port map (timerout,instruction,con_c,con_z,con_v,con_s,destreg,sourreg,off,sst_t,sci_t,rec_t,alu_fun,a3,regen,pcen,con_wr);
  time3    : t3          port map (con_wr,alu_out,idata);
  time2    : t2          port map (off,offout);
  time1    : t1          port map (con_c,sci_t,cin);
  timer1   : timer       port map (clk,reset,idata,timerout);
  thepc    : pc          port map (alu_out,pcen,clk,reset,pcdata);
  
  reg_0    : reg         port map (alu_out,clk,reset,reg0en,reg0d);
  reg_1    : reg         port map (alu_out,clk,reset,reg1en,reg1d);
  reg_2    : reg         port map (alu_out,clk,reset,reg2en,reg2d);
  reg_3    : reg         port map (alu_out,clk,reset,reg3en,reg3d);

  flagreg  : flag_reg    port map (sst_t,alu_c,alu_z,alu_v,alu_s,clk,reset,con_c,con_z,con_v,con_s);
  ireg     : ir          port map (idata,rec_t,clk,reset,instruction);
  areg     : ar          port map ( alu_out,pcdata,rec_t,clk,reset,address_bus);
  regtest  : reg_testa   port map ( clk,reset,timerout,alu_fun,alu_sel,cin,rec_t,pcen,regen,regtests);
  alu1     : alu         port map (cin,alu_sr,alu_dr,alu_fun,alu_out,alu_c,alu_z,alu_v,alu_s);
  regout   : reg_out     port map (instruction,pcdata,regout_s,offout,alu_sr,alu_dr,alu_out,regtests,regsel,sel,red_data);
  busmux   : bus_mux     port map (alu_sel,idata,pcdata,offout,regsr,regdr,alu_sr,alu_dr);
  regmux   : reg_mux     port map (reg0d,reg1d,reg2d,reg3d,destreg,sourreg,regsel,regen,reg0en,reg1en,reg2en,reg3en,regsr,regdr,regout_s);
  
  data_bus<=idata;
  wr<=con_wr;
  c<=con_c;
  regsel<=reg_sel;
end behave;	