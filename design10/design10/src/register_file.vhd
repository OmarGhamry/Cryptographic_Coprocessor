library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_file is
	port(
	clk ,rst ,en : in std_logic :='0';
	ra , rb , rd : in std_logic_vector(3 downto 0);
	res: in std_logic_vector(15 downto 0);
	ABUS,BBUS: out 	 std_logic_vector(15 downto 0):=x"0000"
	);
end entity;

architecture behaviour of reg_file is
type reg_array is array (0 to 15) of std_logic_vector(15 downto 0);
signal REG : reg_array := (others => (others => '0'));
begin 	   
		 	ABUS <= REG(to_integer(unsigned(ra)));  
	        BBUS <= REG(to_integer(unsigned(rb)));	 
			
	process (clk) 
	begin 
		if rising_edge(clk) then 
			if rst = '1' then 
				REG <=	(others => (others => '0'));
				
			elsif en = '1' then 
				REG(to_integer(unsigned(rd))) <=res; 
			end if;
		end if;
	end process;

	
	
	end architecture ;