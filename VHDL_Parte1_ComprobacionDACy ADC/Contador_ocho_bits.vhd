library ieee;
use ieee.std_logic_1164.all;

entity CONTADOR_BIDIRECCIONAL is
port(
UP_DOWN:in std_logic;
C: in std_logic;
Q0,Q1,Q2,QN0,QN1,QN2,Q3,Q4,Q5,QN3,QN4,QN5,Q6,Q7,QN6,QN7: buffer std_logic;
SALIDA:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));

end CONTADOR_BIDIRECCIONAL;

architecture BH of CONTADOR_BIDIRECCIONAL is

component contador is

port(J:in std_logic;
K:in std_logic;
clk: in std_logic;
Q,QN: buffer std_logic);
end component;
signal X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X14,X13,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,X33,X34,X35,X36,X37,X38,X39: std_logic;
SIGNAL UP: std_logic;

begin
UP<=UP_DOWN;
FF0: contador port map(
J=>'1',
K=>'1',
clk=>C,
Q=>X0,
QN=>X1);

Q0<=X0;
QN0<=X1;
X2<=UP AND X0;
X3<=NOT(UP) AND X1;
X4<= X2 OR X3;

FF1:contador port map(
J=>X4,
K=>X4,
clk=>C,
Q=>X5,
QN=>X6);

Q1<=X5;
QN1<=X6;
X7<=X2 AND X5;
X8<=X3 AND X6;
X9<=X7 OR X8;
FF2:contador port map(
J=>X9,
K=>X9,
clk=>C,
Q=>X10,
QN=>X11);

Q2<=X10;
QN2<=X11;
X12<=X7 AND X10;
X13<=X8 AND X11;
X14<=X13 OR X12;

FF3:contador port map(
J=>X14,
K=>X14,
clk=>C,
Q=>X15,
QN=>X16);

Q3<=X15;
QN3<=X16;
X17<=X12 AND X15;
X18<=X13 AND X16;
X19<=X18 OR X17;

FF4:contador port map(
J=>X19,
K=>X19,
clk=>C,
Q=>X20,
QN=>X21);

Q4<=X20;
QN4<=X21;
X22<=X17 AND X20;
X23<=X18 AND X21;
X24<=X23 OR X22;

FF5:contador port map(
J=>X24,
K=>X24,
clk=>C,
Q=>X25,
QN=>X26);

Q5<=X25;
QN5<=X26;
X27<=X22 AND X25;
X28<=X23 AND X26;
X29<=X28 OR X27;

FF6:contador port map(
J=>X29,
K=>X29,
clk=>C,
Q=>X30,
QN=>X31);

Q6<=X30;
QN6<=X31;
X32<=X27 AND X30;
X33<=X28 AND X31;
X34<=X32 OR X33;

FF7:contador port map(
J=>X34,
K=>X34,
clk=>C,
Q=>X35,
QN=>X36);

Q7<=X35;
QN7<=X36;
X37<=X32 AND X35;
X38<=X33 AND X36;
X39<=X37 OR X38;
SALIDA<=X35&X30&X25&X20&X15&X10&X5&X0;
end architecture;
