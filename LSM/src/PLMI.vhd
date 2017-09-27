architecture PLMI of PLM_4 is
begin -- arithmetic operations ------------
 Y <= ((not D and not C and not B and a) -- A + B
 or (not D and not C and B and not A)
 or (not D and C and not B and not A) --A-B
 or (not D and C and B and A)
 -- logical operations --------------------------
 or (D and not C and B and A) -- AND
 or ((D and C) and not (not B and not A)) -- OR
 ) after td; --element element
end PLMI;