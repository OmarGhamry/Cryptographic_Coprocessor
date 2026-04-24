library	ieee;
use ieee.std_logic_1164.all;


entity FA is
	port (
	A,B,Cin:in std_logic;
	k:in std_logic;
	Cout,S:out std_logic
	);
	
end entity;	  

architecture adder of  FA is 
signal B_xor : std_logic;
begin
 
	B_xor<=B xor k;
	
S <= A xor B_xor xor Cin;
Cout <= (A and B_xor) or  (A and Cin) or (Cin and B_xor) ;
	

end architecture;