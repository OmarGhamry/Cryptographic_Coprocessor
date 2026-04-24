library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nonlinear_lut is
  port (
    LUTin  : in std_logic_vector(7 downto 0);
    LUTout : out std_logic_vector(7 downto 0)
  );
end entity ;

architecture rtl of nonlinear_lut is

  signal upper_in, lower_in, upper_out, lower_out : std_logic_vector(3 downto 0);
begin

  upper_in <= LUTin(7 downto 4);
  lower_in <= LUTin(3 downto 0);

  SBOX_1 : process (upper_in)
  begin
    case(upper_in) is
      when "0000" => upper_out <= "0001";
      when "0001" => upper_out <= "1011";
      when "0010" => upper_out <= "1001";
      when "0011" => upper_out <= "1100";
      when "0100" => upper_out <= "1101";
      when "0101" => upper_out <= "0110";
      when "0110" => upper_out <= "1111";
      when "0111" => upper_out <= "0011";
      when "1000" => upper_out <= "1110";
      when "1001" => upper_out <= "1000";
      when "1010" => upper_out <= "0111";
      when "1011" => upper_out <= "0100";
      when "1100" => upper_out <= "1010";
      when "1101" => upper_out <= "0010";
      when "1110" => upper_out <= "0101";
      when "1111" => upper_out <= "0000";
      when others => upper_out <= "0000";
    end case;
  end process;

  SBOX_2 : process (lower_in)
  begin
    case(lower_in) is
      when "0000" => lower_out <= "1111";
      when "0001" => lower_out <= "0000";
      when "0010" => lower_out <= "1101";
      when "0011" => lower_out <= "0111";
      when "0100" => lower_out <= "1011";
      when "0101" => lower_out <= "1110";
      when "0110" => lower_out <= "0101";
      when "0111" => lower_out <= "1010";
      when "1000" => lower_out <= "1001";
      when "1001" => lower_out <= "0010";
      when "1010" => lower_out <= "1100";
      when "1011" => lower_out <= "0001";
      when "1100" => lower_out <= "0011";
      when "1101" => lower_out <= "0100";
      when "1110" => lower_out <= "1000";
      when "1111" => lower_out <= "0110";
      when others => lower_out <= "0000";
    end case;
  end process;

  LUTout <= upper_out & lower_out;
end architecture;