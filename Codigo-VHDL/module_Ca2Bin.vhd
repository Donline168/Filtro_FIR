----------------------------------------------------------------------------------
--			MODULO CONVERSOR COMPLEMENTO A 2 A BINARIO

--	Proyecto	: Filtro Digital
--	Alumno		: Vellido Tomas, Eduardo Torres
----------------------------------------------------------------------------------

library IEEE	;
use IEEE.STD_LOGIC_1164		.ALL	;
use IEEE.STD_LOGIC_unsigned	.ALL	;
use IEEE.NUMERIC_STD		.ALL	;

----------------------------------------------------------------------------------
-- Definicion de las entradas

entity module_Ca2Bin is
    Port ( 
		i_y 		:	in 	signed (31 downto 0)	;	--	Datos Codificados Complemento a 2
        o_salida 	:	out signed (11 downto 0)		--	Datos Binarios
	);
end module_Ca2Bin	;

----------------------------------------------------------------------------------
-- Definicion del comportamiento

architecture comport_module_Ca2Bin of module_Ca2Bin is

signal x : signed(11 downto 0) := (others => '0')	;

begin

	process(i_y) is
	begin

		if(i_y(31)	=	'0') then
			x	<=	"1"	 &	i_y(21 downto 11)	;

		else
			x	<=	"0"  &	i_y(21 downto 11)	;

		end if	;

	end process	;

    o_salida <= x	;
	
end comport_module_Ca2Bin;

	-- Company: 
	-- Engineer: 
	-- 
	-- Create Date:    03:36:42 12/17/2023 
	-- Design Name: 
	-- Module Name:    Ca2Bin - Behavioral 
	-- Project Name: 
	-- Target Devices: 
	-- Tool versions: 
	-- Description: 
	--
	-- Dependencies: 
	--
	-- Revision: 
	-- Revision 0.01 - File Created
	-- Additional Comments: 
	--
	-- Uncomment the following library declaration if using
	-- arithmetic functions with Signed or Unsigned values
	--use IEEE.NUMERIC_STD.ALL;

	-- Uncomment the following library declaration if instantiating
	-- any Xilinx primitives in this code.
	--library UNISIM;
	--use UNISIM.VComponents.all;
