library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HEXA is
    Port (
        SALIDA1:OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        E_0,E_1,E_2,E_3, A_0, A_1, A_2, A_3 : in STD_LOGIC;
        seg_1 : out STD_LOGIC_VECTOR(6 downto 0);
		  seg_2:out STD_LOGIC_VECTOR(6 downto 0);
		  UP_DOWN:in std_logic;
        clk_i: in std_logic;
        Q0,Q1,Q2,QN0,QN1,QN2,Q3, QN3: buffer std_logic;
        SALIDA:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
end HEXA;

architecture Behavioral of HEXA is


signal ENTRADA:std_LOGIC_VECTOR(3 downto 0);
signal ENTRA:std_LOGIC_VECTOR(3 downto 0);
component contador is

port(J:in std_logic;
K:in std_logic;
clk: in std_logic;
Q,QN: buffer std_logic);
end component;
signal l0,l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,l14,l13,l15,l16,l17,l18,l19: std_logic;
SIGNAL UP: std_logic;
signal   clk_div : std_logic := '0';
signal   clk_div2 : std_logic := '0';
signal s0,s1,s2,sN0,sN1,sN2,s3,sN3, s4,s5,s6,sN4,sN5,sN6,s7,sN7: std_logic;


--contador de 8 bits

component contador_ochobits is

port(UP_DOWN:in std_logic;
clk_i: in std_logic;
Q0,Q1,Q2,QN0,QN1,QN2,Q3,Q4,Q5,QN3,QN4,QN5,Q6,Q7,QN6,QN7: buffer std_logic;
SALIDA:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));

end component;

---- salida hexagesimal 
component HEX
        Port ( 
        entrada : in STD_LOGIC_VECTOR(3 downto 0);
        segmentos : out STD_LOGIC_VECTOR(6 downto 0)
		  );
    end component;
begin

--Divisores de frecuecia para los contadores y el clock del ADC 

clock_div : entity work.clk_div generic map
	(
		DIV_TICKS => 30
	)	
	port map
	(
		 clk_i 	=> clk_i,
		 clk_o	=> clk_div
	);


clock_div2 : entity work.clk_div generic map
	(
		DIV_TICKS => 3e6
		
	)	
	port map
	(
		 clk_i 	=> clk_i,
		 clk_o	=> clk_div2
	);
	
-- Conntadores 
CONT1:contador_ochobits port map(
UP_DOWN=> UP_DOWN,
clk_i=> clk_div2,
Q0=> s0,
Q1=>s1,
Q2=>s2,
Q3=>s3,
Q4=>S4,
Q5=>S5,
Q6=>S6,
Q7=>S7,
QN0=>sN0,
QN1=>sn1,
QN2=>sn2,
QN3=>sn3,
QN4=>sn4,
QN5=>sn5,
QN6=>sn6,
QN7=>sn7,
SALIDA=>SALIDA);





	
	
-- contador para el ADC
	
UP<=UP_DOWN;
FF0: contador port map(
J=>'1',
K=>'1',
clk=>clk_div,
Q=>l0,
QN=>l1);

Q0<=l0;
QN0<=l1;
l2<=UP AND l0;
l3<=NOT(UP) AND l1;
l4<= l2 OR l3;

FF1:contador port map(
J=>l4,
K=>l4,
clk=>clk_div,
Q=>l5,
QN=>l6);

Q1<=l5;
QN1<=l6;
l7<=l2 AND l5;
l8<=l3 AND l6;
l9<=l7 OR l8;
FF2:contador port map(
J=>l9,
K=>l9,
clk=>clk_div,
Q=>l10,
QN=>l11);

Q2<=l10;
QN2<=l11;
l12<=l7 AND l10;
l13<=l8 AND l11;
l14<=l13 OR l12;

FF3:contador port map(
J=>l14,
K=>l14,
clk=>clk_div,
Q=>l15,
QN=>l16);

Q3<=l15;
QN3<=l16;
l17<=l12 AND l15;
l18<=l13 AND l16;
l19<=l18 OR l17;


SALIDA1<=QN3&QN2&QN1&QN0;

--LEDs
ENTRADA<=E_3&E_2&E_1&E_0;
ENTRA<=A_3&A_2&A_1&A_0;
HEX_1: HEX port map(entrada => ENTRADA, segmentos => seg_1);
HEX_2: HEX port map(entrada => ENTRA, segmentos => seg_2);
end Behavioral;
