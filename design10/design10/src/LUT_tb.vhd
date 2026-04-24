library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_lut is
end entity;

architecture behavior of tb_lut is	

    signal LUTin  : std_logic_vector(7 downto 0) := (others => '0');
    signal LUTout : std_logic_vector(7 downto 0); 
begin

    UUT: entity work.nonlinear_lut
        port map(
            LUTin  => LUTin,
            LUTout => LUTout
        );
 
    process
    begin  
		LUTIN <= "00000000";
      for i in 0 to 15 loop	 
   LUTIN <= std_logic_vector(to_unsigned(i, 8));
  wait for 100 ns; 
  end loop;
      wait;
   end process;
    

end architecture;