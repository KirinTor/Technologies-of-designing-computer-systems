architecture STR_LUT of LSM is
 signal c, x, yi: BIT_VECTOR (4 downto 0);
 component LUT4 is
 generic(mask:BIT_VECTOR(15 downto 0):=X"ffff"; td:time:=1 ns); 
 port (a, b, c, d: in BIT;
 Y: out BIT);
 end component;
begin
 C(0)<=C0; 
-- Arithmetic-logic circuit diagram ---------------------------
LSM_STR:for i in 0 to 3 generate
 LNI:LUT4 generic map(mask=>X"E896")
 port map(a=>A(i),b=>B(i),c=> F(0),d =>F(1), Y =>X(i));
 LNO:LUT4 generic map(mask=>X"CC96")
 port map(a=>C(i),b=>X(i),c=> F(0),d =>F(1), Y =>yi(i));
 LNC:LUT4 generic map(mask=>X"B2E8")
 port map(a=>A(i),b=>B(i),c=> c(i),d =>F(0), Y =>c(i+1));
end generate;
-- Definition of zero result ----------------------------------------
 UZ:LUT4 generic map(mask=>X"8000")
 port map(a=>yi(3),b=>yi(2),c=> yi(1),d =>yi(0), Y =>Z);

 Y<=yi(3 downto 0);
 C3<=c(4);  --extraction of transfer
end STR_LUT;