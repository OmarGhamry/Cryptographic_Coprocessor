LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity tb_shifter is
end entity ;
 
ARCHITECTURE behavior of tb_shifter is 

   signal SHIFTINPUT : std_logic_vector(15 downto 0) := (others => '0');
   signal SHIFT_Ctrl : std_logic_vector(3 downto 0) := (others => '0');
   signal SHIFTOUT : std_logic_vector(15 downto 0);
 
begin
   uut: entity shifter port map (
          BBUS => SHIFTINPUT,
          ctrl => SHIFT_Ctrl,
          shifter_res => SHIFTOUT
        );
   
   process
   begin  
  SHIFTINPUT <= x"00FF";
  wait for 100 ns; 
  
  SHIFT_Ctrl <= "1000";-- ROR8
  wait for 100 ns; 
  
  SHIFT_Ctrl <= "1001";-- ROR4
  wait for 100 ns; 
  
  SHIFT_Ctrl <= "1010";-- SLL8
      wait;
  
   end process;

END architecture;