library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HEX is
    Port ( 
        entrada : in STD_LOGIC_VECTOR(3 downto 0);
        segmentos : out STD_LOGIC_VECTOR(6 downto 0)
    );
end HEX;

architecture Behavioral of HEX is

begin

    process(entrada)
    begin
        case entrada is
            when "0000" => segmentos <= "0000001"; -- 0 en hexadecimal
            when "0001" => segmentos <= "1001111"; -- 1 en hexadecimal
            when "0010" => segmentos <= "0010010"; -- 2 en hexadecimal
            when "0011" => segmentos <= "0000110"; -- 3 en hexadecimal
            when "0100" => segmentos <= "1001100"; -- 4 en hexadecimal
            when "0101" => segmentos <= "0100100"; -- 5 en hexadecimal
            when "0110" => segmentos <= "0100000"; -- 6 en hexadecimal
            when "0111" => segmentos <= "0001111"; -- 7 en hexadecimal
            when "1000" => segmentos <= "0000000"; -- 8 en hexadecimal
            when "1001" => segmentos <= "0000100"; -- 9 en hexadecimal
            when "1010" => segmentos <= "0001000"; -- A en hexadecimal
            when "1011" => segmentos <= "1100000"; -- B en hexadecimal
            when "1100" => segmentos <= "0110001"; -- C en hexadecimal
            when "1101" => segmentos <= "1000010"; -- D en hexadecimal
            when "1110" => segmentos <= "0110000"; -- E en hexadecimal
            when "1111" => segmentos <= "0111000"; -- F en hexadecimal
            when others => segmentos <= "-------"; -- Valor no definido
        end case;
    end process;

end Behavioral;
