--use CNetwork.all, FUN.all;	
library ieee;
use ieee.numeric_bit.all;	

entity LSM is
port(F : in BIT;-- function
	 A : in BIT_VECTOR(11 downto 0);-- first operand
	 B : in BIT_VECTOR(11 downto 0);-- second operand
	 C0: in BIT; -- transfer port
	 Y : out BIT_VECTOR(11 downto 0);-- result
	 C3: out BIT; -- transfer output
	 Z: out BIT); -- a sign of zero result
end LSM;

architecture BEH of LSM is
signal  yi: signed(12 downto 0);
signal ai, bi, ci: signed(11 downto 0);
signal ybi: BIT_VECTOR (12 downto 0);	

function MIN(a,b:signed)return signed is
begin			  
	if a> b then
		return b;
	else
		return a;
		end if;
   
	end function ;

begin
-- Present the input data as integers --
ai <= signed(A);
bi <= signed(B);
--ci <= BIT_TO_INT (C0);
-- Adder - subtractor --
ADDER: yi <= RESIZE(ai,13) + bi + signed('0'&ci) when F = '0';
-- Results multiplexer --
MUX: with F select

ybi <= bit_vector(yi) when '0', -- adder

 bit_vector(MIN(ai,bi)) when others;
 C3 <= ybi (12); -- output transfer
 Z <= '1' when ybi (11 downto 0) = "000000000000" else '0'; -- zero sign
 Y <= ybi (11 downto 0); -- Result
end BEH;