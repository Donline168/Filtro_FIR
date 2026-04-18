----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DivFrec is
	 Generic ( cuenta : integer := 8);
    Port ( clk : in  STD_LOGIC;
           clkout : out  STD_LOGIC
           );
end DivFrec;

architecture Behavioral of DivFrec is

begin

process (clk)
variable cuenta2 : integer range 0 to cuenta-1 := 0;
begin

if clk'event and clk = '1' then

	if cuenta2 = 0 then
	clkout <= '1';
	cuenta2 := cuenta2+1;
	elsif cuenta2 < (cuenta/2-(cuenta mod 2))+1 then
	clkout <= '1';
	cuenta2 := cuenta2+1;
	elsif cuenta2 < cuenta-1 then
	clkout <= '0';
	cuenta2 := cuenta2+1;
	else
	cuenta2 := 0;
	clkout <= '0';
	end if;
	
end if;

end process;

end Behavioral;