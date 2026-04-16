--      MODULO DE SUMA GENERICO
library IEEE    ;

use ieee.std_logic_1164 .all    ;
use ieee.numeric_std    .all    ;

entity modulo_sum is 

    port(

        i_add   :   in  signed  (31 downto 0)   :=  (others => '0')   ;
        i_prod  :   in  signed  (31 downto 0)   :=  (others => '0')   ;

        o_suma  :   out signed  (31 downto 0)   :=  (others => '0')
    );


end modulo_sum;

architecture comport_modulo_sum of modulo_sum is

signal result : signed  (32 downto 0) := (others => '0');

begin

    result <= ('0' & i_add) + ('0' & i_prod);

    o_suma <= result(31 downto 0);

end comport_modulo_sum;