----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:06:07 03/26/2026 
-- Design Name: 
-- Module Name:    ClockForward - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity ClockForward is
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end ClockForward;

architecture Behavioral of ClockForward is

signal clk_in_n : std_logic;
begin

    clk_in_n <= not clk_in;

    ODDR2_inst : ODDR2
    generic map (
        DDR_ALIGNMENT => "C0",
        INIT => '0',
        SRTYPE => "ASYNC"
    )
    port map (
        Q  => clk_out,
        C0 => clk_in,
        C1 => clk_in_n,
        CE => '1',
        D0 => '1',
        D1 => '0',
        R  => '0',
        S  => '0'
    );


end Behavioral;

