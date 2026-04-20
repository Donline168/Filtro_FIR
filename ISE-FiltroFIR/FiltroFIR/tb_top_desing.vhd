--          BANCO DE PRUEBA DEL MODULO TOP_DESING

library IEEE    ;
use IEEE.STD_LOGIC_1164 .ALL    ;
use ieee.NUMERIC_STD    .all    ;

entity 	tb_top_desing is
end     tb_top_desing		    ;

architecture tb_comport of tb_top_desing is
    
    constant clk_period : time := 2 us     ;
    
    -- Declaración del componente a probar
    component top_desing
        generic (
            selector_sample     :   integer := 31     ;                                       -- Ancho de datos por defecto (31 o 29)
            selector_coe        :   integer := 16                                             -- Elegir entre 16 coeficientes(15 iguales) 
                                                                                              -- ó 15 coeficientes (14 iguales)
        );
        Port (
            i_signal_adc        :   in  std_logic_vector    (11 downto 0)   ;                 --Señal de muestreo en 12 bits
            i_clock             :   in  std_logic                           ;                 --Señal del clock
            i_reset             :   in  std_logic_vector    (0 downto 0 )   ;             
            i_filter_selec      :   in  std_logic_vector    (1 downto 0 )   ;                      
            o_signal_filter     :   out std_logic_vector    (11 downto 0)                     --Señal filtrada de 12 bits al DAC
        );

    end component;

    -- Seales internas para conectar al DUT
    
    signal    tb_signal_adc     :   std_logic_vector    (11 downto 0)   :=  (others => '0') ; --Señal de muestreo en 12 bits
    signal    tb_clock          :   std_logic                           :=  '0'             ; --Señal del clock
    signal    tb_reset          :   std_logic_vector    (0 downto 0 )   :=  (others => '0') ;
    signal    tb_filter_selec   :   std_logic_vector    (1 downto 0 )   :=  (others => '0') ;                   
    signal    tb_signal_filter  :   std_logic_vector    (11 downto 0)   :=  (others => '0') ; --Señal filtrada de 12 bits al DAC


begin

    top_desing_inst : top_desing
     port map(
        i_signal_adc    =>  tb_signal_adc   ,
        i_clock         =>  tb_clock        ,
        i_reset         =>  tb_reset        ,
        i_filter_selec  =>  tb_filter_selec ,
        o_signal_filter =>  tb_signal_filter
    );
    
    inicial_var : process
    begin
        tb_reset        <=      "1"         ;
        wait for 0.5 us;
        tb_reset        <=      "0"         ;
        wait;

    end process;

    estim_clock : process
    begin

        tb_clock        <= '0'  ;
		wait for clk_period / 2             ;

        tb_clock        <= '1'  ;
        wait for clk_period / 2             ;

    end process;

    estim_proce : process
    begin

        tb_signal_adc   <=  "111111111111"  ;
        tb_filter_selec <=  (others => '1') ;
        wait for 0.5 us                      ;
        tb_filter_selec <=  (others => '0') ;
        wait for 2 us                      ;
        tb_signal_adc   <=  "011111111111" ;
        wait                                ;


    end process ;
end tb_comport  ;