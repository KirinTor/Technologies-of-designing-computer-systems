use CNetwork.all, FUN.all;
architecture BEH of LSM is
signal ai, bi, ci, yi: INTEGER;
signal ybi: BIT_VECTOR (12 downto 0);
begin
-- Present the input data as integers --
ai <= BIT_TO_INT (A);
bi <= BIT_TO_INT (B);
ci <= BIT_TO_INT (C0);
-- Adder - subtractor --
ADDER: yi <= ai + bi + ci when F = '0';
-- Results multiplexer --
MUX: with F select

ybi <= INT_TO_BIT (yi, 13) when '0', -- adder

 INT_TO_BIT (minimum(ai,bi), 13) when others;
 C3 <= ybi (12); -- output transfer
 Z <= '1' when ybi (11 downto 0) = "000000000000" else '0'; -- zero sign
 Y <= ybi (11 downto 0); -- Result
end BEH;