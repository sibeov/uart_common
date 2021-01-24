-- ----- UART Parameters -----
-- Baud Rate            (9600, 19200, 115200, others)
-- Number of Data Bits  (7, 8)
-- Parity Bit           (On, Off)
-- Stop Bits            (0, 1, 2)
-- Flow Control         (None, On, Hardware)

library ieee;
use ieee.std_logic_1164.all;

package uart_common is

    -- Board specific
    constant GC_CLK_FRQ    : integer := 50_000_000;

    -- Uart specific
    constant GC_BAUD_RATE  : integer := 115200; -- 9600, 19200, 115200, others
    constant GC_DATA_BITS  : integer := 8;      -- 7 or 8
    constant GC_PARITY_BIT : boolean := false;  -- false | true
    constant GC_STOP_BIT   : integer := 1;      -- 0, 1 or 2
    constant GC_FLOW_CTRL  : boolean := false;  -- false | true (none, on , hw)

    function f_CLKS_PR_BIT(
        clk_frq   : in integer;
        baud_rate : in integer
    ) return integer;

end package;

package body uart_common is

    function f_CLKS_PR_BIT(
        clk_frq   : integer;
        baud_rate : integer
    ) return integer is
    begin
        return (clk_frq / baud_rate);
    end function f_CLKS_PR_BIT;

end package body;