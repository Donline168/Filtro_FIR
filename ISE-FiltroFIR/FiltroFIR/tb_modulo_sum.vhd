--      BANCO DE PRUEBA DE MODLO DE SUMA

library IEEE;
use IEEE.STD_LOGIC_1164 .ALL    ;
use ieee.NUMERIC_STD    .all    ;

entity 	tb_modulo_sum is
end 	tb_modulo_sum		    ;

architecture tb_comport_sum of tb_modulo_sum is

    component modulo_sum is
           port(

            i_add   :   in  signed  (31 downto 0)   ;
            i_prod  :   in  signed  (31 downto 0)   ;

            o_suma  :   out signed  (31 downto 0)
        );
    end component;

    signal tb_i_add   :     signed  (31 downto 0)  ;
    signal tb_i_prod  :     signed  (31 downto 0)  ;
    signal tb_o_suma  :     signed  (31 downto 0)  ;



begin
    
    modulo_sum_inst: modulo_sum
    
    port map(
    
        i_add   => tb_i_add     ,
        i_prod  => tb_i_prod    ,
        o_suma  => tb_o_suma
    
    );
    
    estim_signal : process
    begin
        --  TESTEO DE SUMA VALORES POSITIVOS

        tb_i_add    <= (31 downto 1 => '0',others => '1')   ;   -- 0000....001 = 9,76 e-4
        tb_i_prod   <= (31 downto 1 => '0',others => '1')   ;   -- 0000....001 = 9,76 e-4
        wait for 30 ns;


        --  TESTEO DE SUMA VALORES NEGATIVOS
        tb_i_add    <= (31 downto 4 => '1',others       => '0'              )   ; -- 1111....10000 = - 0,0156
        tb_i_prod   <= (31 downto 4 => '1',3 downto 1   => '0',others => '1')   ; -- 1111....10001 = - 0,0146
        wait for 30 ns;

        --  TESTEO DE SUMA VALOR POSTIVO CON NEGATIVO 
        tb_i_add    <= (31 downto 3 => '0') & "101" ;   -- 0000....101 =  4,882 e-3
        tb_i_prod   <= (31 downto 3 => '1') & "001" ;   -- 1111....001 = -6,835 e-3
        wait for 30 ns;

        wait;
    end process;
end tb_comport_sum;
