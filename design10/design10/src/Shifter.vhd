library	ieee;
use ieee.std_logic_1164.all;


entity shifter is
	port (
	ctrl:in std_logic_vector(3 downto 0);
	BBUS:in std_logic_vector(15 downto 0);
	shifter_res:out std_logic_vector(15 downto 0)
	);
	
end entity;	  

architecture sft of  shifter is

begin
   
	process (ctrl,BBUS)
	begin
	 if ctrl ="1000" then 	-- 8-bit right rotation (ROR8).
		shifter_res<= BBUS(7 downto 0) &	 BBUS(15 downto 8);
	 elsif ctrl ="1001" then   --4-bit right rotation (ROR8).
		shifter_res<= BBUS(3 downto 0) &	 BBUS(15 downto 4);
	  elsif ctrl ="1010" then			--left shift (SLL8), filling with zeros
		shifter_res<= BBUS(7 downto 0) &	 x"00";
	  else 
		shifter_res<= (others =>'0');
		end if;
		
	end process;	
	

	
	
end architecture;