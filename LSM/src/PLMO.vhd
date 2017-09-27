 architecture PLMO of PLM_4 is
begin -- arithmetic operations
 Y <= ((not D and not C and not B and A) -- A + B
 or (not D and not C and B and not A)
 or (not D and C and not B and not A) --A-B
 or (not D and C and B and A)
 --Logical operations
 or (D and not C and B) -- AND
 or (D and C and B) -- OR
 ) after td; --element element
end PLMO;