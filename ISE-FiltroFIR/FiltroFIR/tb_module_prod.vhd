--      BANCO DE PRUEBA DE MODULO DE PRODUCTO

library IEEE;
use IEEE.STD_LOGIC_1164 .ALL;
use ieee.NUMERIC_STD    .all;

entity 	tb_module_prod is
end 		tb_module_prod		;

architecture tb_comport_prod of tb_module_prod is

    component module_prod is 

        port(

            i_delayA    :   in  signed  (31 downto 0)   ;
            i_delayB    :   in  signed  (31 downto 0)   ;
            i_coe       :   in  signed  (11 downto 0)   ;
            o_prod      :   out signed  (31 downto 0)
        );


    end component;
    

        
    signal tb_i_delayA    :     signed  (31 downto 0)   ;
    signal tb_i_delayB    :     signed  (31 downto 0)   ;
    signal tb_i_coe       :     signed  (11 downto 0)   ;
    signal tb_o_prod      :     signed  (31 downto 0)   ;

begin

    module_prod_inst : module_prod
       port map(
        
            i_delayA    =>  tb_i_delayA ,      
            i_delayB    =>  tb_i_delayB ,       
            i_coe       =>  tb_i_coe    ,       
            o_prod      =>  tb_o_prod          
    );

    estim_signal : process
    begin
        
        tb_i_coe    <= (11 downto 1 => '0',others => '1')   ;   -- coeficiente = 1;
        tb_i_delayA <= (31 downto 1 => '0',others => '1')   ;   -- 0000....001 = 9,76 e-4
        tb_i_delayB <= (31 downto 1 => '0',others => '1')   ;   -- 0000....001 = 9,76 e-4
        wait for 30 ns;


        --  TESTEO DE SUMA VALORES NEGATIVOS
        tb_i_delayA <= (31 downto 4 => '1',others       => '0'              )   ; -- 1111....10000 = - 0,0156
        tb_i_delayB <= (31 downto 4 => '1',3 downto 1   => '0',others => '1')   ; -- 1111....10001 = - 0,0146
        wait for 30 ns;

        --  TESTEO DE SUMA VALOR POSTIVO CON NEGATIVO 
        tb_i_delayA <= (31 downto 3 => '0') & "101"   ;   -- 0000....101 =  4,882 e-3
        tb_i_delayB <= (31 downto 3 => '1') & "001";   -- 1111....001 = -6,835 e-3
        wait for 30 ns;
        
    end process;
end tb_comport_prod;

