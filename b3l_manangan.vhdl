--EXERCISE 3
--CMSC 132 T-3L
--FLORES, MELVIN
--MANANGAN, KLARENCE

library IEEE; use IEEE.std_logic_1164.all;

entity b3l_manangan is
	port(out_alarm: out std_logic;
		i5,i4,i3,i2,i1,i0: in std_logic);
end entity;

architecture farm_alarm of b3l_manangan is
begin
	process(i5,i4,i3,i2,i1,i0) is
		begin
			if((i5 ='1') and ((i4 = '1') or (i2 = '1') or (i0 = '1')) then out_alarm <= "1";
			elsif((i3 ='1') and ((i4 = '1') or (i2 = '1') or (i0 = '1')) then out_alarm <= "1";
			elsif((i1 ='1') and ((i4 = '1') or (i2 = '1') or (i0 = '1')) then out_alarm <= "1";
			elsif((i4 ='1') and ((i5 = '1') or (i3 = '1') or (i1 = '1')) then out_alarm <= "1";
			elsif((i2 ='1') and ((i5 = '1') or (i3 = '1') or (i1 = '1')) then out_alarm <= "1";
			elsif((i0 ='1') and ((i5 = '1') or (i3 = '1') or (i1 = '1')) then out_alarm <= "1";
			else out_alarm <= "0";
			end if;
		
	end process;
end architecture;