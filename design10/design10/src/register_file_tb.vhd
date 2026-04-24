library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_file_tb is
end entity;

architecture sim of reg_file_tb is 
	signal clk ,rst ,en :  std_logic :='0';
	signal ra , rb , rd :  std_logic_vector(3 downto 0):= "0000";
	signal res: std_logic_vector(15 downto 0):= x"0000";
	signal ABUS,BBUS:  std_logic_vector(15 downto 0):= x"0000";  
	
	
begin 	   
	reg1: entity reg_file
		port map(clk=>clk ,
		rst=>rst , 
		en=>en , 
		ra=>ra ,  
		rb=>rb , 
		rd=>rd ,  
		res=>res , 
		ABUS=>ABUS , 
		BBUS=>BBUS
		);
		
	process 
	begin  	
		while true loop
			clk <= '0';
		wait for 5ns;
		clk <= '1';
		wait for 5ns;
		end loop;	
		
	end process;
		
		
	process 
	begin 
	  rst <= '1';
 	  wait for 20 ns;

	
	rst <= '0';
    en  <= '1';
    rd  <= "0001";
 	res <= x"AAAA";
 
	wait for 20 ns;


	   
	rd  <= "0010";
	res <= x"5555";
	
	wait for 20 ns;


	en <= '0';
	ra <= "0001";
	rb <= "0010";
   
	wait for 20 ns;


	ra <= "0000";
	rb <= "0000";
    
	wait for 20 ns;

    en  <= '1';
	rd  <= "0011";
 	res <= x"F0F0";
	ra  <= "0011";  
	
	wait for 20 ns;

  
	en <= '0';
	
	wait for 20 ns;

 
	rst<='1'; 
	
	wait for 20 ns;
	wait;

		
		
		
	end process;
end architecture ;