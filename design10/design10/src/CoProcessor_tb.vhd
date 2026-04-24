library	ieee;
use ieee.std_logic_1164.all;


entity CoProcessor_tb is 
end entity;	  

architecture sim of  CoProcessor_tb is	
signal ctrl:  std_logic_vector(3 downto 0):=(others=>'0');
signal clk,rst: std_logic:= '0';
signal Ra,Rb,Rd: std_logic_vector(3 downto 0):=(others=>'0');
	  

begin
	
	
	DUT: entity	 CoProcessor
	  port map(ctrl=>ctrl,clk=>clk,rst=>rst,Ra=>Ra,Rb=>Rb,Rd=>Rd);
	  
	  
	  clock_process :process
  	  begin
  	     	 clk <= '0';
 			 wait for 10 ns;
  	    	 clk <= '1';
    	 	 wait for 10 ns;
     end process;
	 
	 
	 
   process
   begin  
      
			  rst <= '1';
			  Ra <= "0000";
			  Rb <= "0000";
			  Rd <= "0000";
			  CTRL <= "0111";
			      wait for 100 ns; 
			  rst <= '0';-- ADD R5,R4, R12
			  Ra <= "0101";
			  Rb <= "0100";
			  Rd <= "1100";
			  CTRL <= "0000";
			      wait for 20 ns;
			  Ra <= "0001"; -- XOR R1,R8,R7
			  Rb <= "1000";
			  Rd <= "0111";
			  CTRL <= "0100";
			      wait for 20 ns;
			  Ra <= "0001"; -- ROR4 R12,R0
			  Rb <= "1100";
			  Rd <= "0000";
			  CTRL <= "1001";
			      wait for 20 ns;    
			  Ra <= "0001"; -- SLL8 R9,R3
			  Rb <= "1001";
			  Rd <= "0011";
			  CTRL <= "1010";
			      wait for 20 ns;
			  Ra <= "0000"; -- ADD R0,R7,R10
			  Rb <= "0111";
			  Rd <= "1010";
			  CTRL <= "0000";
			      wait for 20 ns;
			  Ra <= "0111"; -- SUB R7,R3,R12
			  Rb <= "0011";
			  Rd <= "1100";
			  CTRL <= "0001";
			      wait for 20 ns;
			  Ra <= "0111"; -- SUB R7,R3,R12
			  Rb <= "0011";
			  Rd <= "1100";
			  CTRL <= "0111"; --NOP
			      wait for 20 ns;
			  Ra <= "1100"; -- AND R12,R10,R9
			  Rb <= "1010";
			  Rd <= "1001";
			  CTRL <= "0010";
			  	  wait for 20 ns;
			  Ra <= "1100"; -- AND R12,R10,R9
			  Rb <= "1010";
			  Rd <= "1001";
			  CTRL <= "0111"; -- NOP
			  wait for 20 ns;
			 
			 
			  Ra <= "1001"; -- LUT R9,R2
			  Rb <= "1010";
			  Rd <= "0010";
			  CTRL <= "1011";  
			  wait;	 
			  
			  
			  
   
   end process;
   
end architecture ;	