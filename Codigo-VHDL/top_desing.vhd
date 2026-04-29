----------------------------------------------------------------------------------
--              MODULO TOP FILTRO FIR

--  Proyecto	: Filtro Digital
--  Alumno		: Vellido Tomas, Eduardo Torres
--  Informacion	:

--      ENTRADAS    :  SEÑAL DE DATO (12 BITS) , CLOCK , RESET , SELECTOR DE FILTRO (2 BITS)
--      SALIDAS     :  SEÑAL FILTRADO(12 BITS)
--      MODULOS     :  
--          MODULO FILTRO DIGITAL
--          MODULO TRUNCAMIENTO Y REDONDEO
----------------------------------------------------------------------------------

library ieee    ;

use ieee.std_logic_1164     .all    ;
use ieee.STD_LOGIC_UNSIGNED .all    ;
use ieee.NUMERIC_STD        .all    ;


----------------------------------------------------------------------------------
-- Definicion de las entradas del modulo Principal

entity top_desing is  
    generic (
        i_selector_sample     : integer   ;                               
        i_selector_coe        : integer                                                                                       
    );
    port (
        i_signal_adc        :   in  std_logic_vector  (11 downto 0)   ;         -- Señal de muestreo en 12 bits
        i_clock             :   in  std_logic                         ;         -- Señal del clock
        i_reset             :   in  std_logic_vector  (0  downto 0)   ;
        i_filter_selec      :   in  std_logic_vector  (1  downto 0)   ;         
        
        o_signal_filter     :   out std_logic_vector  (11 downto 0)             -- Señal filtrada de 12 bits al DAC  
    );
end top_desing  ;


----------------------------------------------------------------------------------
--  Definicion del comportamiento del modulo Principal

architecture Comportamient_top of top_desing is

--  Definicion de las señales internas

signal  binca2          :   signed  (31 downto 0)   :=  (others => '0') ;
signal  ca2bin          :   signed  (31 downto 0)   :=  (others => '0') ;  

signal  signal_adc      :   signed  (11 downto 0)   :=  (others => '0') ;

signal  signal_filter   :   signed  (11 downto 0)   :=  (others => '0') ;

signal  reset           :   signed  (0  downto 0)   :=  (others => '0') ;

----------------------------------------------------------------------------------
--      MMODULO CONVERSOR BIN A CA2

component module_BinCa2 is
    Port ( 
	    i_Entrada	        :	in	signed    (11 downto 0)	;
        o_x0 		        :	out	signed    (31 downto 0)		
	);
end component;

--      MODULO DEL FILTRO DIGITAL FIR

component module_filtro_fir is
    generic (
        i_sample_selec      :   integer ;
        i_coe_selec         :   integer
    );
    port (
        i_signal_data       :   in  signed              (31 downto 0)   ;               -- Señal del ADC al filtro
        i_clock             :   in  std_logic                           ;           -- Señal del clock
        i_reset             :   in  signed              (0  downto 0)   ;
        i_filter_selec      :   in  std_logic_vector    (1  downto 0)   ;
        
        o_signal_operation  :   out signed              (31 downto 0)                   -- Señal salida del filtro de 32 bits
        );
end component   ;

--      MODULO CONVERSOR CA2 A BIN

component module_Ca2Bin is
    port (
		i_y 		        :	in 	signed    (31 downto 0)	;
        o_salida 	        :	out signed    (11 downto 0)	    
    );
end component;

----------------------------------------------------------------------------------
--  Declaracion de las Instancias entre los submodulos

begin

    signal_adc      <= signed  (i_signal_adc   )        ;

    module_BinCa2_inst: module_BinCa2
        port map(
            i_Entrada           => signal_adc               ,

            o_x0                => binca2
        );

    reset           <= signed   (i_reset)               ;

    module_filtro_fir_inst : module_filtro_fir
        generic map(
            i_sample_selec      =>  i_selector_sample       ,
            i_coe_selec         =>  i_selector_coe
        )
        port map   (

            i_signal_data       =>  binca2                  ,

            i_clock             =>  i_clock                 ,
            i_reset             =>  reset                   ,
            i_filter_selec      =>  i_filter_selec          ,

            o_signal_operation  =>  ca2bin
        );

    module_Ca2Bin_inst: module_Ca2Bin
        port map(
            i_y                 => ca2bin                   ,

            o_salida            => signal_filter
        );

    o_signal_filter <= STD_LOGIC_VECTOR(signal_filter)  ;

end Comportamient_top;

    -- signal data_signal  :   signed              (48 downto 0)   ;
    ------------------------------------------------------------------------
    --  Declaracion de submodulos de la Arquitectura

    --      MODULO TRUNCAMIENTO Y REDONDEO DE LA SEÑAL OPERACION

    --    component module_sat_truc is

    --         port (

    --             i_signal_operation  :   in  signed    (48 downto 0)   ;   --Señal de 32 bit resultado del modulo filtro fir

    --             o_signal_trun       :   out signed    (31 downto 0)       -- Señal de salida al DAC de 12 bits truncados

    --             );

    --     end component   ;

   -- module_sat_truc_inst    : module_sat_truc

    --  port map   (

    --     i_signal_operation  =>  data_signal     ,
    --     o_signal_trun       =>  filter_data
    -- );


