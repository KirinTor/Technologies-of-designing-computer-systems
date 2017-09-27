use CNetwork.all;
architecture BEH of LSM is
signal ai, bi, ci, yi: INTEGER;
signal ybi: BIT_VECTOR (4 downto 0);
begin
-- Present the input data as integers --
ai <= BIT_TO_INT (A);
bi <= BIT_TO_INT (B);
ci <= BIT_TO_INT (C0);
-- Adder - subtractor --
ADDER: yi <= ai + bi + ci when F (0) = '0' else
 ai-bi-ci;
-- Results multiplexer --
MUX: with F select

 ybi <= INT_TO_BIT (yi, 5) when "00" | "01", -- adder-subtractor
 '0' & (A and B) when "10", --Scheme AND
 '0' & (A or B) when others; -- OR --scheme OR
 C3 <= ybi (4); -- output transfer
 Z <= '1' when ybi (3 downto 0) = "0000" else '0'; -- zero sign
 Y <= ybi (3 downto 0); -- Result
end BEH;