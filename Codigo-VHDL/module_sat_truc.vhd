--      MODULO TRUNCAMIENTO Y REDONDEO DE SEÑAL 

library ieee;

use ieee.std_logic_1164     .all    ;
use ieee.STD_LOGIC_UNSIGNED .all    ;
use ieee.NUMERIC_STD        .all    ;
   
entity module_sat_truc  is

    port(

        i_signal_operation  :   in  signed    (48 downto 0)   ;   --Señal de 32 bit resultado del modulo filtro fir

        o_signal_trun       :   out signed    (31 downto 0)       -- Señal de salida al DAC de 12 bits truncados

    );
end module_sat_truc;

architecture    Comportamient_module_ST of  module_sat_truc is

    signal compa :  signed(5 downto 0);
    signal compa1 : signed(5 downto 0);

begin

    
    compa <= (others => i_signal_operation(42));
    compa1 <= i_signal_operation(48 downto 43);

    o_signal_trun <=    (31 => '1' ,others => '0') when compa1 /= compa else
                        (31 => '0' ,others => '1') when compa1 /= compa else
                        i_signal_operation(42 downto 11);
            
end Comportamient_module_ST;