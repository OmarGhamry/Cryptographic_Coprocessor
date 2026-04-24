library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_TB is
end ALU_TB;

architecture sim of ALU_TB is

signal ABUS    : std_logic_vector(15 downto 0);
signal BBUS    : std_logic_vector(15 downto 0);
signal ALU_ctrl: std_logic_vector(3 downto 0);
signal ALU_OP  : std_logic_vector(15 downto 0);

begin

UUT: entity ALU
port map(
	ABUS => ABUS,
	BBUS => BBUS,
	ctrl => ALU_ctrl,
	ALU_out => ALU_OP
);

process
begin

	-- Test values
	ABUS <= x"000A";  -- 10
	BBUS <= x"0003";  -- 3

	-- ADD
	ALU_ctrl <= "0000";
	wait for 100 ns;

	-- SUB
	ALU_ctrl <= "0001";
	wait for 100 ns;

	-- AND
	ALU_ctrl <= "0010";
	wait for 100 ns;

	-- OR
	ALU_ctrl <= "0011";
	wait for 100 ns;

	-- XOR
	ALU_ctrl <= "0100";
	wait for 100 ns;

	-- NOT ABUS
	ALU_ctrl <= "0101";
	wait for 100 ns;

	-- MOVE ABUS
	ALU_ctrl <= "0110";
	wait for 100 ns;

	-- Another test case
	ABUS <= x"00FF";
	BBUS <= x"0F0F";

	ALU_ctrl <= "0000"; -- ADD
	wait for 100 ns;

	ALU_ctrl <= "0001"; -- SUB
	wait for 100 ns;

	wait;

end process;

end sim;