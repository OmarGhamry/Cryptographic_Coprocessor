library	ieee;
use ieee.std_logic_1164.all;


entity opunit is
	port (
	ABUS:in std_logic_vector(15 downto 0);
	LU_out:out std_logic_vector(15 downto 0)
	);
	
end entity;	  

architecture opu of  opunit is

begin

	first7bit : entity nonlinear_lut 
		port map(LUTin => ABUS(7 downto 0),LUTout=>LU_out(7 downto 0)) ;
	
	LU_out(15 downto 8)<=ABUS(15 downto 8);	
	
	
end architecture;