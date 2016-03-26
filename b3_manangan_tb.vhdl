library IEEE; use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity b3_manangan_tb is
	constant MAX_COMB: integer := 64;
	constant DELAY: time := 10 ns;
end entity;

architecture tb of b3_manangan_tb is

	component b3_manangan is
			port(out_alarm: out std_logic; i5,i4,i3,i2,i1,i0: in std_logic);
	end component;
	
	signal out_alarm: std_logic;
	signal i5,i4,i3,i2,i1,i0: std_logic;
	
begin --architecture

	uut: component b3_manangan port map(out_alarm, i5,i4,i3,i2,i1,i0);
	main: process is
			variable temp: unsigned(5 downto 0);
			variable out_alarm;
			variable error_count: integer := 0;
			
	begin --process
	
		report "start simulation";
		
		for i in 0 to 64 loop
			temp := TO_UNSIGNED(i, 6);
			--assign each input a value from temp
			i5 <= temp(5);
			i4 <= temp(4);
			i3 <= temp(3);
			i2 <= temp(2);
			i1 <= temp(1);
			i0 <= temp(0);
			
			if (i <= 2) then out_alarm := "0";
			elsif ((i = 4 )or (i = 5) or (i = 8) or (i = 10) or (i = 16) or (i = 17) or (i = 20) or(i = 21) or (i = 32) or (i = 35) or (i = 40) or (i = 42)) then out_alarm := "0";
			else out_alarm := "1";
			end if;
			wait for DELAY;
			
		end loop;
		
		wait for DELAY;
		assert (error_count = 0)
			report "ERROR: There were " &
				integer'image(error_count) & " errors!";
			if(error_count = 0)
				then report "Simulation completed with NO errors.";
			end if;
		wait;
	end process;
end architecture tb;



