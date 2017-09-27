use CNetwork.all;
entity LSM is
port(F : in BIT_VECTOR(1 downto 0);-- function
	 A : in BIT_VECTOR(3 downto 0);-- first operand
	 B : in BIT_VECTOR(3 downto 0);-- second operand
	 C0: in BIT; -- transfer port
	 Y : out BIT_VECTOR(3 downto 0);-- result
	 C3: out BIT; -- transfer output
	 Z: out BIT); -- a sign of zero result
end LSM;