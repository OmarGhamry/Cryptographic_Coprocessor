library	ieee;
use ieee.std_logic_1164.all;


entity CoProcessor is
	port (
	ctrl:in std_logic_vector(3 downto 0);
	clk,rst:in std_logic;
	Ra,Rb,Rd:in std_logic_vector(3 downto 0)
	);
end entity	;


architecture COP of  CoProcessor is	

signal ctrl_result: std_logic_vector(3 downto 0):=x"0";
signal ABUS,BBUS:std_logic_vector(15 downto 0);
signal Result: std_logic_vector(15 downto 0); 
signal en :std_logic; 
signal Rd_tmp: std_logic_vector(3 downto 0):=x"0";

begin

		Combinational_logic:entity combinational
		port map(
		ctrl=>ctrl_result,
		ABUS=>ABUS,BBUS=>BBUS,
		Result=>Result
		);
	
	Register_file_16x16:entity reg_file 
	port map( clk=> clk, rst => rst,
			  en => en,
			  res => Result, 
	          Ra => Ra,
			  Rb => Rb,
			  Rd => Rd_tmp,
              ABUS => ABUS,
			  BBUS => BBUS);
	
	  	process (clk,rst)
	begin 	 
	if(rising_edge(clk)) then	
	if rst='1' then
	 	ctrl_result <=(others => '0');
		Rd_tmp <= (others => '0');
		en<='0';
	  else 
	       Rd_tmp <= Rd;	
	      ctrl_result <=  ctrl;	
	 if(ctrl = "0111") then  -- don't write to Reg_file
     en <= '0';
     else
     en <= '1';	  
	end if;	  
	end if	;
	end if;
		
	end process;
	
end architecture;	