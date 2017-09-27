use CNetwork.all;
entity PLM_4 is generic(td:time:=1 ns); -- delay
port(a, b, c, d: in BIT;
 Y : out BIT);
end PLM_4;