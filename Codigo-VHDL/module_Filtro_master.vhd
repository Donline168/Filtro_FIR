------------------------------------------------------------
--		MODULO INSTANCIAMIENTO DE PERIFERICOS

--	Proyecto	: Filtro Digital
--	Alumno		: Vellido Tomas, Eduardo Torres
--	Informacion	:
--		
------------------------------------------------------------

library IEEE	;
use IEEE.STD_LOGIC_1164.ALL	;

------------------------------------------------------------
library UNISIM;
use UNISIM.VComponents.all;
------------------------------------------------------------
-- Definicion de las entradas
entity module_Filtro_Master is
	generic (
		selector_sample : integer := 31	;						-- Ancho de datos por defecto (31 o 29)
    	selector_coe    : integer := 16  						-- Elegir entre 16 coeficientes(15 iguales) ó 15 coeficientes (14 iguales)
	);
	port ( 

		clk				: 	in	std_logic						;
		reset 			: 	in 	std_logic_vector (0 downto 0)	;
------------------------------------------------------------
	--	Terminales del modulon ADC

		JB8 			: 	in  std_logic 	;
		JB7 			: 	out std_logic	;
		JB10			: 	out std_logic	;
------------------------------------------------------------
	--	Terminales del modulon DAC

		JA7 			:	out std_logic	;
		JA8 			:  	out std_logic	;
		JA9 			:  	out std_logic	;
		JA10 			:  	out std_logic	;
------------------------------------------------------------
	--	Terminales del Modulo Top_Desing

		selec_filter	:	in	std_logic_vector(1 downto 0)	;
------------------------------------------------------------
		Led 			:  	out std_logic_vector(7 downto 0)


	);
end module_Filtro_Master;

------------------------------------------------------------
-- Definicion del comportamiento

architecture comport_module_Filtro_Master of module_Filtro_Master is

-- Divisor de frecuencia configurable

component  DivFrec is
	Generic ( 
		cuenta 			:	integer := 8
	);

    Port ( 
		clk 			: 	in	STD_LOGIC	;
        clkout 			: 	out STD_LOGIC
    );
end component;

component ClockForward is
    Port ( 
		clk_in 			:	in	STD_LOGIC	;
        clk_out 		: 	out STD_LOGIC
	);
end component;

component DivFrecppal
	Port(
		-- Clock in ports
  		CLK_IN1			: 	in	std_logic	;
  		-- Clock out ports
  		CLK_OUT1		: 	out	std_logic
 	);
end component;

-- Controlador ADC, PModAD1 o 2

component module_ADC_ctrl is
	Port ( 		
		i_clk 			:	in	std_logic							;
		i_ini			: 	in	std_logic							;
		i_serie_a 		: 	in	std_logic							;

		o_dato			: 	out	std_logic_vector 	(11 downto 0)	;
		o_cs 			: 	out	std_logic
		--sclk 			: 	out	std_logic
	);
end component;

-- Controlador DAC, PModDA1 o 2

component module_DAC_ctrl is
	Port ( 
		i_clk 			: 	in 	std_logic							;
		i_ini 			: 	in 	std_logic							;
		i_dato			: 	in 	std_logic_vector 	(11 downto 0)	;
	 	i_datob			:	in	std_logic_vector 	(11 downto 0)	;

		o_serie_a		: 	out std_logic							;
	 	o_serie_b		: 	out std_logic							;
		o_sync 			: 	out std_logic						
		--sclk : out std_logic
	);
end component;

-- Modulo Top_Desing
component top_desing is
    generic (
        i_selector_sample : integer     ;                       	-- Ancho de datos por defecto (31 o 29)
        i_selector_coe    : integer                             	-- Elegir entre 16 coeficientes(15 iguales) 
                                                                    	-- ó 15 coeficientes (14 iguales)
    );
    port (
        i_signal_adc  	:	in  std_logic_vector	(11 downto 0)   ; 	-- Señal de muestreo en 12 bits
        i_clock       	:	in  std_logic                           ; 	-- Señal del clock
        i_reset       	:	in  std_logic_vector	(0  downto 0)	;
        i_filter_selec	:	in  std_logic_vector    (1  downto 0)   ;                   

        o_signal_filter :   out std_logic_vector    (11 downto 0)    	-- Señal filtrada de 12 bits al DAC  
    );
end component;

--seales de reloj:

signal clks 	: std_logic	;											--reloj de muestreo 10kHz
signal clkdac 	: std_logic	;											--reloj DAC ADC 20MHz

--seales que salen del ADC y entran al DAC

signal Entrada	: std_logic_vector(11 downto 0)	;
signal Salida 	: std_logic_vector(11 downto 0)	;

begin

	Led <= Entrada(11 downto 4);
	DivFrecppal_1 : DivFrecppal
		Port map(
			-- Clock in ports
		    CLK_IN1			=> clk		,								-- Entran 100MHz
		    -- Clock out ports
		    CLK_OUT1		=> clkdac									-- Salen  20MHz
		);
	div2 : DivFrec
		Generic map( 
			cuenta => 40
		)
	    Port map( 
			clk 			=> clkdac	, 								--entran 20MHz
	        clkout 			=> clks 									--salen 500kHz
	);

	ADC: module_ADC_ctrl  												--1 ADC arroja dato en "Entrada"
		Port map( 
			i_clk 			=> clkdac	,
			i_ini  			=> clks		,								--inicio de conversin cada 10kHz
			i_serie_a		=> jb8		,

			o_dato			=> Entrada	,
			o_cs  			=> jb7
			--sclk  		=> jb10;
	);

	clkForward1 : ClockForward 
	    Port map ( 
			clk_in			=> clkdac	,
	        clk_out 		=> jb10
		);
	
	Top_Desing_Filter : top_desing
		generic map(
    	    i_selector_sample =>	selector_sample     	,                               -- Ancho de datos por defecto (31 o 29)
    	    i_selector_coe    =>	selector_coe                                      -- Elegir entre 16 coeficientes(15 iguales) 
                                                                        -- ó 15 coeficientes (14 iguales)
    	)
    	Port map(
    	    i_signal_adc   	=> Entrada,   								-- Señal de muestreo en 12 bits
    	    i_clock        	=> clks,   									-- Señal del clock
    	    i_reset        	=> reset,
    	    i_filter_selec 	=> selec_filter,                   

    	    o_signal_filter => Salida    								-- Señal filtrada de 12 bits al DAC  
    );

	--3 dato entra al controlador de DAC		 
	DAC : module_DAC_ctrl
		Port map( 
			i_clk 			=> 	clkdac			,
			i_ini 			=> 	clks			,
			i_dato 			=>	(others => '0')	,
			i_datob			=> 	Salida			,

			o_serie_a 		=> 	JA8				,
			o_serie_b 		=> 	JA9				,
			o_sync  		=> 	JA7
			--sclk  		=> JA10;
	);

	clkForward2 : ClockForward 
	    Port map ( 

			clk_in 			=> clkdac	,
	        clk_out 		=> JA10
	);

end comport_module_Filtro_Master;