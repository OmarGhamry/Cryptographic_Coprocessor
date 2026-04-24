library ieee;
use ieee.std_logic_1164.all;

entity tb_combinational is
end entity;

architecture tb of tb_combinational is
    signal ctrl       : std_logic_vector(3 downto 0) := (others => '0');
    signal ABUS, BBUS : std_logic_vector(15 downto 0) := (others => '0');
    signal Result     : std_logic_vector(15 downto 0);

begin

    UUT : entity combinational
        port map(ctrl   => ctrl,ABUS => ABUS,BBUS   => BBUS,Result => Result );

    process
    begin
		
        ABUS <= x"F0F0";
        BBUS <= x"0F0F";
        
		-- el goz2 bta3 el ALU
		
        ctrl <= "0000";  -- ADD
		wait for 20 ns;
		
        ctrl <= "0001";	 --Sub
		wait for 20 ns;
		
        ctrl <= "0010";	--AND
		wait for 20 ns;

        ctrl <= "0011"; -- OR
		wait for 20 ns;
  
        ctrl <= "0100"; -- XOR
		wait for 20 ns;
   	   
        ctrl <= "0101";	-- NOT ABUS
		wait for 20 ns;

        ctrl <= "0110";	-- ABUS
		wait for 20 ns;
     
        -- el goz2 bta3 el ALU
        BBUS <= x"ABCD";
	   
        ctrl <= "1000";	--ROR8
		wait for 20 ns;
        
        ctrl <= "1001";	-- ROR4 
		wait for 20 ns;
       	
        ctrl <= "1010"; 
		wait for 20 ns;-- SHL8
     
 		-- el goz2 bta3 el LUT 
		 
        ABUS <= x"F0F0";
        
		ctrl <= "1011";
		wait for 20 ns;
       


        -- All zeros
        ABUS <= x"0000";
        BBUS <= x"0000";
        ctrl <= "0010";--AND
		wait for 20 ns;
        

        -- All ones
        ABUS <= x"FFFF";
        BBUS <= x"FFFF";
        ctrl <= "0000";  -- ADD 
		wait for 20 ns; 
        
	   

    end process;

end architecture;