----------------------------------------------------------------------------------
--			MODULO DE CONVERSION DE DATOS EN SERIE A PARALELO

--	Proyecto		: Filtro Digital
--	Alumno			: Vellido Tomas, Eduardo Torres
--	Informacion		:
--		Modulo encargado de pasar los datos en serie proveniente del ADC a paralelo para el filtro digital
--		Entrada : Señal de 1 bits en Serie
--		Salida	: Señal de 12 bits en Paralelo
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------------------------
-- Definicion de las entradas

entity module_ADC_ctrl is
	Port ( 
		i_clk 		:	in 	std_logic						;	--	Clock del Sistema
		i_ini		:	in 	std_logic						;
		i_serie_a	:	in 	std_logic						;	--	Datos de Entrada en Serie

		o_dato		:	out std_logic_vector (11 downto 0)	; 	--	Datos de Salida en Paralelo (12 Bits)
		o_cs 		:	out	std_logic							--	Indicador de Conversion Completada

		--sclk : out std_logic
	);
end module_ADC_ctrl	;

----------------------------------------------------------------------------------
-- Definicion del comportamiento

architecture comport_module_ADC_ctrl of module_ADC_ctrl is

signal ini_ant 	: std_logic := '0'				;			--	Variable de Inicializacion 
signal data 	: std_logic_vector(11 downto 0)	;

begin

--sclk <= clk;
	process (i_clk,i_ini)

	variable cuenta : integer range 0 to 17 := 0	;

	begin
		if i_clk'event and i_clk = '1' then

			if i_ini = '1' and ini_ant = '0' then 			-- Inicializacion del Proceso
				cuenta 	:= 	0		;
				o_cs 	<= '0'		;

			elsif cuenta < 4 then							--OJO! VALORES PARA 20MHZ CLK Y 1MSPS
				cuenta	:= cuenta+1	;
				o_cs 	<= '0'		;
			----------------------------------------------------------------------------------
				--	A partir de aca desde 4 a 14 (total de 11 repeticiones) el dato en serie de 1 bit i_serie
				--	se va guardando y desplazando por el registro data
			----------------------------------------------------------------------------------
			elsif cuenta < 15 then
		   		o_cs 	<= '0'		;

				for i in 11 downto 1 loop
					data(i) <= data(i-1)	;
				end loop;

				data(0) <= i_serie_a	;
				cuenta 	:= cuenta +1	;

			elsif cuenta = 15 then
				o_cs 	<= '0'			;

				for i in 11 downto 1 loop
					data(i) <= data(i-1)	;
				end loop;

				data(0) <= i_serie_a	;
				cuenta 	:= cuenta +1	;
				o_dato 	<= data			;

			else
				o_dato 	<= data			;
				o_cs 	<= '1'			;

			end if;

			ini_ant <= i_ini	;

		end if;

	end process;

end comport_module_ADC_ctrl;
	-- Uncomment the following library declaration if using
	-- arithmetic functions with Signed or Unsigned values
	--use IEEE.NUMERIC_STD.ALL;
	
	-- Uncomment the following library declaration if instantiating
	-- any Xilinx primitives in this code.
	--library UNISIM;
	--use UNISIM.VComponents.all;