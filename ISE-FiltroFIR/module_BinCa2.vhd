----------------------------------------------------------------------------------
--			MODULO CONVERSOR BINARIO A CA2

--	Proyecto	: Filtro Digital
--	Alumno		: Vellido Tomas, Eduardo Torres
--	Informacion	:
--		Modulo encargado de convertir señal de dato de 12 bits proveniente de un ADC que va de "0..0" a "1...1" en el cual 
--		esta muestrando y codificando en binario señales analogicas.
--		Las Señales analogicas vendran con un offset de 1.65 volt para poder entrar dentro de los rangos de 0 a 3.3 volts
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164	.ALL;
use	ieee.NUMERIC_STD	.all;

----------------------------------------------------------------------------------
-- Definicion de las entradas

entity module_BinCa2 is
    Port ( 
		i_Entrada	:	in	signed (11 downto 0)	;
        o_x0 		:	out	signed (31 downto 0)
	);
end module_BinCa2;

----------------------------------------------------------------------------------
-- Definicion del comportamiento

architecture comport_module_BinCa2 of module_BinCa2 is

signal x : signed(31 downto 0) := (others => '0')	;

begin

	--	Establece las condiciones para que el sistema reconosca los datos que son valores positivos y cuales negativos

	process(i_Entrada) is
	
	begin

		if(i_Entrada(11)='0') then
			x <= "11111111111" & i_Entrada(10 downto 0) & "0000000000"	;

		else
			x <= "00000000000" & i_Entrada(10 downto 0) & "0000000000"	;

		end if	;

	end process	;

	o_x0	<=	x	;

end comport_module_BinCa2;



	-- Company: 
	-- Engineer: 
	-- 
	-- Create Date:    03:28:38 12/17/2023 
	-- Design Name: 
	-- Module Name:    BinCa2 - Behavioral 
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

