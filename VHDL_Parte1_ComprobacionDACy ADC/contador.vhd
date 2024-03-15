library ieee;
use ieee.std_logic_1164.all;

entity contador is
port(J:in std_logic;
K:in std_logic;
clk: in std_logic;
Q,QN: buffer std_logic);

end contador;

architecture BH of contador is
begin
process(clk,J,K)
begin
if (rising_edge(clk)) then
 if(J='0' and K='0') then
  Q<=Q;QN<=NOT(Q);
  elsif (J='0' and K='1') then
  Q<='0';QN<= '1';
  elsif (J='1' and K='0') then
  Q<='1';QN<= '0';
  elsif (J='1' and K='1') then
  Q<=not(Q);QN<=Q;
  end if;
 end if;
 end process;
end architecture;