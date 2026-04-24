library	ieee;
use ieee.std_logic_1164.all;


entity combinational is
	port (
	ctrl:in std_logic_vector(3 downto 0);
	ABUS,BBUS:in std_logic_vector(15 downto 0);
	Result:out std_logic_vector(15 downto 0)
	);
	
end entity;	  

architecture com of  combinational is 
signal temp1,temp2,temp3:  std_logic_vector(15 downto 0);

begin
	
		LUOUnit: entity	opunit
		port map(ABUS=>ABUS,LU_out=>temp1) ;

		ALUnit: entity	ALU
		port map(ABUS=>ABUS,BBUS=>BBUS,ctrl=>ctrl,ALU_out=>temp2) ;
		
		shifting: entity shifter
		port map(BBUS=>BBUS,ctrl=>ctrl,shifter_res=>temp3) ;	
	

	process (ctrl,temp1,temp2,temp3)
	begin
	 if ctrl(3)='0' then   -- de bta3et el ALU
		Result <= temp2;
	 elsif ctrl(1 downto 0)="11" then -- de bta3et el LUT
		 Result <= temp1;
	 else
		 Result <= temp3;	-- de hatro7 le Shifter
	   end if;

	
   end process;
	
	
end architecture;