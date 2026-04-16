----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
entity module_DAC_ctrl is
	Port (
		i_clk 		:	in 	std_logic						;
		i_ini 		:	in 	std_logic						;
		i_dato 		:	in 	std_logic_vector (11 downto 0)	;	-- No se usa este terminal
		i_datob		:	in 	std_logic_vector (11 downto 0)	;	-- Salida del ultimo modulo del sistema (Datos de 12 bits)

		o_serie_a 	:	out	std_logic						;
		o_serie_b 	:	out	std_logic						;
		o_sync 		:	out	std_logic							-- Señal de aviso con el DAC de proceso Terminado
		--sclk : out std_logic
	);
end module_DAC_ctrl	;
----------------------------------------------------------------------------------
architecture Behavioral of module_DAC_ctrl is

signal ini_ant 	: std_logic := '0'				;				--	Variable de Inicializacion 
signal data 	: std_logic_vector(15 downto 0)	;
signal datb 	: std_logic_vector(15 downto 0)	;

begin

	--sclk <= clk;
	o_serie_a	<= data(15)	;
	o_serie_b 	<= datb(15)	;
	
	process (i_clk,i_ini)
	
	variable cuenta : integer range 0 to 31 := 0;
	
	begin

		if i_clk'event and i_clk = '1' then

			if i_ini = '1' and ini_ant = '0' then				-- Inicializacion del Proceso
				cuenta 				:= 0		;
				o_sync 				<= '1'		;
				
				data(15 downto 12)	<= "0000"	;
				data(11 downto 0 ) 	<= i_dato	;
				datb(15 downto 12) 	<= "0000"	;
				datb(11 downto 0 ) 	<= i_datob	;

			elsif cuenta = 0 then
				o_sync 				<= '0'		;
				cuenta 				:= cuenta +1;
			----------------------------------------------------------------------------------
				-- Desplazamiento de los datos en paralelo a serie, guardandose en la señal o_serie_b
			----------------------------------------------------------------------------------
			elsif cuenta < 16 then								

				for i in 15 downto 1 loop
				
					data(i) <= data(i-1)	;
					datb(i) <= datb(i-1)	;
				
				end loop;
				
		 		cuenta 				:= cuenta +1;
		   		o_sync 				<= '0'		;

			else
				o_sync 				<= '1'		;

			end if;

			ini_ant <= i_ini	;

		end if	;

	end process	;

end Behavioral	;

	-- Uncomment the following library declaration if using
	-- arithmetic functions with Signed or Unsigned values
	--use IEEE.NUMERIC_STD.ALL;
	
	-- Uncomment the following library declaration if instantiating
	-- any Xilinx primitives in this code.
	--library UNISIM;
	--use UNISIM.VComponents.all;
