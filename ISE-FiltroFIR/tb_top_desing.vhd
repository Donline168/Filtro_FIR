--          BANCO DE PRUEBA DEL MODULO TOP_DESING

library IEEE    ;
use IEEE.STD_LOGIC_1164 .ALL    ;
use ieee.NUMERIC_STD    .all    ;

entity 	tb_top_desing is
end     tb_top_desing		    ;

architecture tb_comport of tb_top_desing is
    
    constant clk_period : time := 20 ns     ;
    
    -- Declaración del componente a probar
    component top_desing
        Port (

        signal_adc                  :   in  SIGNED              (31 downto 0)   ;   --Señal de muestreo en 12 bits
        clock                       :   in  std_logic                           ;   --Señal del clock
        reset                       :   in  SIGNED                              ;
        signal_selector_filter      :   in  signed              (1 downto 0)    ;                   

        filter_data                 :   out SIGNED              (31 downto 0)       --Señal filtrada de 12 bits al DAC
        );

    end component;

    -- Seales internas para conectar al DUT
    
    signal    tb_signal_adc                 :   SIGNED          (31 downto 0)   :=  (others => '0') ; --Señal de muestreo en 12 bits
    signal    tb_clock                      :   std_logic                       :=  '0'             ; --Señal del clock
    signal    tb_reset                      :   signed          (0 downto 0 )   :=  (others => '0') ;
    signal    tb_signal_selector_filter     :   signed          (1 downto 0 )   :=  (others => '0') ;                   
    signal    tb_filter_data                :   SIGNED          (31 downto 0)   :=  (others => '0') ; --Señal filtrada de 12 bits al DAC


begin

    top_desing_inst : top_desing
     port map(
        signal_adc              =>      tb_signal_adc               ,
        clock                   =>      tb_clock                    ,
        reset                   =>      tb_reset                    ,
        signal_selector_filter  =>      tb_signal_selector_filter   ,
        filter_data             =>      tb_filter_data
    );
    
    inicial_var : process
    begin
        --tb_clock                    <=      '0'         ;
        tb_reset                    <=      "1"         ;
        --tb_signal_selector_filter   <= (others => '0')  ;
        
        wait for 10 ns;
        tb_reset                    <=      "0"         ;
        wait;

    end process;

    estim_clock : process
    begin

        tb_clock                    <= '0'  ;
		wait for clk_period / 2             ;

        tb_clock                    <= '1'  ;
        wait for clk_period / 2             ;

    end process;

    estim_proce : process
    begin

        tb_signal_adc               <=  (31 downto 22 => '0') & "11111111111" & (others => '0') ;
        tb_signal_selector_filter   <=  (others => '1')                                         ;

        wait for 10 ns                                                                          ;

        tb_signal_selector_filter   <=  (others => '0')                                         ;

        wait for 15 ns                                                                          ;

        tb_signal_adc               <=  (others => '0')                                         ;

        wait                                                                                    ;


    end process ;
end tb_comport  ;