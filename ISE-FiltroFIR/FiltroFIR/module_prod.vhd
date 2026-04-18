--      MODULO DE PRODUCTO

library IEEE    ;

use ieee.std_logic_1164 .all    ;
use ieee.numeric_std    .all    ;

entity module_prod is 
    port(

        i_delayA    :   in  signed  (31 downto 0)   :=  (others => '0')   ;
        i_delayB    :   in  signed  (31 downto 0)   :=  (others => '0')   ;
        i_coe       :   in  signed  (11 downto 0)   :=  (others => '0')   ;

        o_prod      :   out signed  (31 downto 0)   :=  (others => '0')
    );
end module_prod;

architecture comport_module_prod of module_prod is

    signal  suma    :   signed(32 downto 0) :=  (others => '0') ;               --  Realizo la suma de ambas muestras simetricas
    signal  suma_t  :   signed(17 downto 0) :=  (others => '0') ;               --  La trunco a un valor que pueda introducise dentro del modulo DSP de la FPGA (18 bits)
    signal  result  :   signed(29 downto 0) :=  (others => '0') ;               --  Resultado de 30 bits (12 + 18 bits)

begin

    suma <= resize(i_delayA,33) + resize(i_delayB,33);

    suma_t <= suma(27 downto 10);

    result <= i_coe * suma_t;

    o_prod <= resize(result(28 downto 11),32);                                  --  Le devuelvo su tamaño real de 32 bits.


end comport_module_prod;