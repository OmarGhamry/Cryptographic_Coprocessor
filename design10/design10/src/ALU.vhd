library	ieee;
use ieee.std_logic_1164.all;


entity ALU is
	port (
	ctrl:in std_logic_vector(3 downto 0);
	ABUS,BBUS:in std_logic_vector(15 downto 0);
	ALU_out:out std_logic_vector(15 downto 0)
	);
	
end entity;	  

architecture bhv of  ALU is
signal temp : std_logic_vector(15 downto 0);
signal Cout: std_logic_vector(16 downto 0);
signal exSignal: std_logic;
begin

	
	exSignal<='1' when ctrl="0001" else '0';
	Cout(0)<=exSignal;
	
	G: for i in 0 to 15 generate
	FullAdder : entity FA			   
	port map (A=>ABUS(i),B=>BBUS(i),Cin=>Cout(i),Cout=>Cout(i+1),k=>exSignal,S=>temp(i));	
	end generate;
	
	
	process (ctrl,ABUS,BBUS,temp)
	begin
	if ctrl="0000" then	ALU_out<=temp;  --add    
	elsif ctrl="0001" then	ALU_out<=temp; --sub 
	elsif ctrl="0010" then	ALU_out<=ABUS and BBUS;
	elsif ctrl="0011" then	ALU_out<=ABUS or BBUS;	
	elsif ctrl="0100" then	ALU_out<=ABUS xor BBUS ;
	elsif ctrl="0101" then	ALU_out<=not ABUS ;
	elsif ctrl="0110" then	ALU_out<=ABUS ;	 	
	else ALU_out<=(others =>'0') ;
	 end if;
	end process;
	

end architecture;	