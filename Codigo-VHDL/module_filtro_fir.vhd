--      MODULO FILTRO FIR

library ieee    ;

use ieee.std_logic_1164 .all    ;
use IEEE.NUMERIC_STD    .ALL    ;

-------------------------------------------------------------------------
-- Definicion de las entradas del modulo Principal

entity module_filtro_fir is
    generic (   
        i_sample_selec      :   integer                         ;
        i_coe_selec         :   integer
    );
    port (
        i_signal_data       :   in  signed          (31 downto 0)   ;
        i_clock             :   in  std_logic                       ;
        i_filter_selec      :   in  std_logic_vector(1  downto 0)  ;
        i_reset             :   in  signed          (0  downto 0)  ;
    
        o_signal_operation  :   out signed          (31 downto 0)   
    );
end module_filtro_fir;

-------------------------------------------------------------------------
-- Definicion del comportamiento del Filtro FIR


architecture Comportamient_fir of module_filtro_fir is

--  Declaracion de los las matrices 

    type    delay_matriz                    is  array(i_sample_selec-1 downto 0)   of  signed(31 downto 0)  ;
  
    type    prod_matriz                     is  array(i_coe_selec-1 downto 0)      of  signed(31 downto 0)  ;

   type    coeb_impulrespon_rect_matriz    is  array(15 downto 0)                 of  signed(11 downto 0)  ;

    type    coeb_impulrespon_hamm_matriz    is  array(15 downto 0)                 of  signed(11 downto 0)  ;

    type    coeb_impulrespon_barl_matriz    is  array(15 downto 0)                 of  signed(11 downto 0)  ;

    type    suma_matriz                     is  array(i_coe_selec-2 downto 0)      of  signed(31 downto 0)  ;

    type    coeb_impulrespon_matriz         is  array(i_coe_selec-1 downto 0)      of  signed(11 downto 0)  ;

--  Declaracion de las señales matriciales

    signal  coeb_impulrespon_rect   : coeb_impulrespon_rect_matriz  := (others => (others => '0'))  ;

    signal  coeb_impulrespon_hamm   : coeb_impulrespon_hamm_matriz  := (others => (others => '0'))  ;

    signal  coeb_impulrespon_barl   : coeb_impulrespon_barl_matriz  := (others => (others => '0'))  ;

    signal  coeb_impulrespon        : coeb_impulrespon_matriz       := (others => (others => '0'))  ;     

    signal  delay                   : delay_matriz                  := (others => (others => '0'))  ;

    signal  prod                    : prod_matriz                   := (others => (others => '0'))  ;

    signal  suma                    : suma_matriz                   := (others => (others => '0'))  ;

    signal  recuperacion            : SIGNED    (11 downto 0) := (others => '0') ;
    
    signal step                     : integer   ;
-------------------------------------------------------------------------
component modulo_sum is  
   port(
        i_add       :   in  signed  (31 downto 0)   :=  (others => '0')   ;
        i_prod      :   in  signed  (31 downto 0)   :=  (others => '0')   ;

        o_suma      :   out signed  (31 downto 0)   :=  (others => '0')
    );
end component;

component module_prod is 

    port(

        i_delayA    :   in  signed  (31 downto 0)   :=  (others => '0')   ;
        i_delayB    :   in  signed  (31 downto 0)   :=  (others => '0')   ;
        i_coe       :   in  signed  (11 downto 0)   :=  (others => '0')   ;

        o_prod      :   out signed  (31 downto 0)   :=  (others => '0')
    );

end component;

begin

--  Declaraciones de los Coeficientes de cada tipo de Ventaneo

--  RECTANGULAR

    coeb_impulrespon_rect(0)    <=  "111111100110"  ; -- - 0,0127
    coeb_impulrespon_rect(1)    <=  "111111011001"  ; -- - 0,0190
    coeb_impulrespon_rect(2)    <=  "111111001111"  ; -- - 0,0239
    coeb_impulrespon_rect(3)    <=  "111111001011"  ; -- - 0,0259
    coeb_impulrespon_rect(4)    <=  "111111001110"  ; -- - 0,0244
    coeb_impulrespon_rect(5)    <=  "111111011010"  ; -- - 0,0186
    coeb_impulrespon_rect(6)    <=  "111111101110"  ; -- - 0,0088
    coeb_impulrespon_rect(7)    <=  "000000001010"  ; --   0,0049
    coeb_impulrespon_rect(8)    <=  "000000101101"  ; --   0,0220
    coeb_impulrespon_rect(9)    <=  "000001010100"  ; --   0,0410
    coeb_impulrespon_rect(10)   <=  "000001111100"  ; --   0,0605
    coeb_impulrespon_rect(11)   <=  "000010100011"  ; --   0,0746
    coeb_impulrespon_rect(12)   <=  "000011000101"  ; --   0,0962
    coeb_impulrespon_rect(13)   <=  "000011011111"  ; --   0,1089
    coeb_impulrespon_rect(14)   <=  "000011110000"  ; --   0,1172
    coeb_impulrespon_rect(15)   <=  "000011110110"  ; --   0,12

--  HAMMING

    coeb_impulrespon_hamm(0)    <=  "111111111110"  ; -- - 0,000997   
    coeb_impulrespon_hamm(1)    <=  "111111111101"  ; -- - 0,00172
    coeb_impulrespon_hamm(2)    <=  "111111111011"  ; -- - 0,00287
    coeb_impulrespon_hamm(3)    <=  "111111111001"  ; -- - 0,00436
    coeb_impulrespon_hamm(4)    <=  "111111110111"  ; -- - 0,00566
    coeb_impulrespon_hamm(5)    <=  "111111110110"  ; -- - 0,00579
    coeb_impulrespon_hamm(6)    <=  "111111111010"  ; -- - 0,00349
    coeb_impulrespon_hamm(7)    <=  "000000000100"  ; --   0,00245
    coeb_impulrespon_hamm(8)    <=  "000000011000"  ; --   0,01287
    coeb_impulrespon_hamm(9)    <=  "000000110110"  ; --   0,02786
    coeb_impulrespon_hamm(10)   <=  "000001011100"  ; --   0,04658
    coeb_impulrespon_hamm(11)   <=  "000010000110"  ; --   0,06727
    coeb_impulrespon_hamm(12)   <=  "000010110001"  ; --   0,08749
    coeb_impulrespon_hamm(13)   <=  "000011010101"  ; --   0,10453
    coeb_impulrespon_hamm(14)   <=  "000011101101"  ; --   0,11590
    coeb_impulrespon_hamm(15)   <=  "000011110110"  ; --   0,12

--  BARLETT

    coeb_impulrespon_barl(0)    <=  "000000000000"  ; --   0
    coeb_impulrespon_barl(1)    <=  "111111111101"  ; -- - 0,0015
    coeb_impulrespon_barl(2)    <=  "111111111001"  ; -- - 0,0034
    coeb_impulrespon_barl(3)    <=  "111111110101"  ; -- - 0,0054
    coeb_impulrespon_barl(4)    <=  "111111110011"  ; -- - 0,0063
    coeb_impulrespon_barl(5)    <=  "111111110011"  ; -- - 0,0063
    coeb_impulrespon_barl(6)    <=  "111111111001"  ; -- - 0,0034
    coeb_impulrespon_barl(7)    <=  "000000000101"  ; --   0,0024
    coeb_impulrespon_barl(8)    <=  "000000011000"  ; --   0,0117
    coeb_impulrespon_barl(9)    <=  "000000110010"  ; --   0,0244
    coeb_impulrespon_barl(10)   <=  "000001010011"  ; --   0,0405
    coeb_impulrespon_barl(11)   <=  "000001110111"  ; --   0,0581
    coeb_impulrespon_barl(12)   <=  "000010011101"  ; --   0,0767
    coeb_impulrespon_barl(13)   <=  "000011000001"  ; --   0,0942
    coeb_impulrespon_barl(14)   <=  "000011100000"  ; --   0,1094
    coeb_impulrespon_barl(15)   <=  "000011110110"  ; --   0,12

-------------------------------------------------------------------------
--  Seleccion de Coeficientes mediente la señal i_filter_selec

    process (i_filter_selec)
    begin
       for i_b in 0 to i_coe_selec-1 loop

            case i_filter_selec is
                when "01"   =>
                    coeb_impulrespon(i_coe_selec - 1 - i_b) <=  coeb_impulrespon_rect(i_b)   ;
                when "10"   =>
                    coeb_impulrespon(i_coe_selec - 1 - i_b) <=  coeb_impulrespon_hamm(i_b)   ;
                when "11"   =>
                    coeb_impulrespon(i_coe_selec - 1 - i_b) <=  coeb_impulrespon_barl(i_b)   ;
                when others =>
                    coeb_impulrespon(i_coe_selec - 1 - i_b) <=  (others => '0')              ;
            end case;

        end loop; 
    end process;


-------------------------------------------------------------------------
--  Proceso de Desplazamiento de los registros con el clock

    process (i_reset,i_clock)
    
    begin

        if (i_reset = 0) then
            if (rising_edge(i_clock))then

                for i in 0 to i_sample_selec-1 loop
                
                    if i = 0 then
                        delay(i) <= i_signal_data   ;
                    else
                        delay(i) <= delay(i-1)      ;

                    end if;

                end loop;

            end if;
        else
            delay   <=  (others => (others => '0')) ; 

        end if;

    end process;


-------------------------------------------------------------------------
 -- Generador de los modulos productos
 
    module_prod_inst: module_prod

        port map(
            i_delayA    =>  delay            (i_sample_selec-1)  ,
            i_delayB    =>  delay            (0)                 ,
            i_coe       =>  coeb_impulrespon (0)                 ,
            o_prod      =>  prod             (0)
        );

   iter_module_prod : for i_c in 1 to i_coe_selec-2 generate

        
        modulo_prod_inst : module_prod
        port map(
            i_delayA    =>  delay            (i_sample_selec-1-i_c) ,
            i_delayB    =>  delay            (i_c)                  ,
            i_coe       =>  coeb_impulrespon (i_c)                  ,
            o_prod      =>  prod             (i_c)
        );  

    end generate;

    modulo_prod_inst : module_prod
        port map(
            i_delayA    =>  delay            (i_sample_selec-i_coe_selec)   ,
            i_delayB    =>  (others => '0')                                 ,
            i_coe       =>  coeb_impulrespon (i_coe_selec-1   )             ,
            o_prod      =>  prod             (i_coe_selec-1   )
        );    
-------------------------------------------------------------------------
--  Bloque de Serie de Sumas de todos los productos

    modulo_sum_inst : modulo_sum
        port map(
            i_add       => prod(0)  ,
            i_prod      => prod(1)  ,
            o_suma      => suma(0)
        );  
    
    iter_modulo_sum : for i_a in 0 to i_coe_selec-3 generate

        
        modulo_sum_inst : modulo_sum
        port map(
            i_add       => suma(i_a     )   ,
            i_prod      => prod(i_a+2   )   ,
            o_suma      => suma(i_a+1   )
        );       

    end generate;

-------------------------------------------------------------------------
--  Salida de la señal final filtrada con 49 bits

    o_signal_operation <= suma(i_coe_selec-2)               ;


end Comportamient_fir;

    -- prod(0) <= coeb_impulrespon(0)  *   (delay(i_sample_selec-2) + i_signal_data);

    -- series_prod : for i_c in 1 to i_coe_selec-2 generate
    -- begin
    --     prod(i_c)     <=  coeb_impulrespon(i_c)     *   (delay(i_c)     +   delay(i_sample_selec-2 - i_c))    ;
    -- end generate;
    
    -- prod(i_coe_selec-1)   <=  coeb_impulrespon(i_coe_selec-1) * delay(i_coe_selec-1);

   -- process (prod)
    -- variable sumatorio : signed (48 downto 0);
    -- begin
    --     sumatorio := (others => '0');

    --     for i_a in 0 to i_coe_selec-1 loop

    --         sumatorio := sumatorio + prod(i_a);

    --     end loop;
    --         suma <= sumatorio;

    -- end process;


       -- if i_sample_selec = 31 then
            
        --     for i_b in 0 to 15 loop
        --         -- with  i_filter_selec select
        --         --     coeb_impulrespon(i_b) <=    coeb_impulrespon_rect(i_b) when  "00"    ,
        --         --                                 coeb_impulrespon_hamm(i_b) when  "01"    ,
        --         --                                 coeb_impulrespon_barl(i_b) when  others  ;
        --         if i_filter_selec = 00 then
        --             coeb_impulrespon(i_b) <= coeb_impulrespon_rect(i_b);
        --         elsif i_filter_selec = 01 then 
        --             coeb_impulrespon(i_b) <= coeb_impulrespon_hamm(i_b);
        --         else
        --             coeb_impulrespon(i_b) <= coeb_impulrespon_barl(i_b);
        --         end if;
        --     end loop;

        -- else

        --     for i_b in 1 to 15 loop
        --         -- with  i_filter_selec select
        --         --     coeb_impulrespon(i_b-1) <=  coeb_impulrespon_rect(i_b) when  "00"    ,
        --         --                                 coeb_impulrespon_hamm(i_b) when  "01"    ,
        --         --                                 coeb_impulrespon_barl(i_b) when  others  ;
        --         if i_filter_selec = 00 then
        --             coeb_impulrespon(i_b-1) <= coeb_impulrespon_rect(i_b);
        --         elsif i_filter_selec = 01 then 
        --             coeb_impulrespon(i_b-1) <= coeb_impulrespon_hamm(i_b);
        --         else
        --             coeb_impulrespon(i_b-1) <= coeb_impulrespon_barl(i_b);
        --         end if;

        -- end loop;
        -- end if;


    -- prod(0)     <=  coeb_impulrespon(0)     *   (delay(30)    +   i_signal_data )    ;
    -- prod(1)     <=  coeb_impulrespon(1)     *   (delay(1)     +   delay(29)     )    ;
    -- prod(2)     <=  coeb_impulrespon(2)     *   (delay(2)     +   delay(28)     )    ;
    -- prod(3)     <=  coeb_impulrespon(3)     *   (delay(3)     +   delay(27)     )    ;
    -- prod(4)     <=  coeb_impulrespon(4)     *   (delay(4)     +   delay(26)     )    ;
    -- prod(5)     <=  coeb_impulrespon(5)     *   (delay(5)     +   delay(25)     )    ;
    -- prod(6)     <=  coeb_impulrespon(6)     *   (delay(6)     +   delay(24)     )    ;
    -- prod(7)     <=  coeb_impulrespon(7)     *   (delay(7)     +   delay(23)     )    ;
    -- prod(8)     <=  coeb_impulrespon(8)     *   (delay(8)     +   delay(22)     )    ;
    -- prod(9)     <=  coeb_impulrespon(9)     *   (delay(9)     +   delay(21)     )    ;
    -- prod(10)    <=  coeb_impulrespon(10)    *   (delay(10)    +   delay(20)     )    ;
    -- prod(11)    <=  coeb_impulrespon(11)    *   (delay(11)    +   delay(19)     )    ;
    -- prod(12)    <=  coeb_impulrespon(12)    *   (delay(12)    +   delay(18)     )    ;
    -- prod(13)    <=  coeb_impulrespon(13)    *   (delay(13)    +   delay(17)     )    ;
    -- prod(14)    <=  coeb_impulrespon(14)    *   (delay(14)    +   delay(16)     )    ;
    -- prod(15)    <=  coeb_impulrespon(15)    *   delay(15)                            ;