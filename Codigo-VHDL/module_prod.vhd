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

signal result : signed  (43 downto 0):= (others => '0');

begin

    result <= i_coe * (i_delayA + i_delayB);

    o_prod <= result(42 downto 11);

end comport_module_prod;