architecture PLMS of PLM_4 is
begin -- arithmetic operations
 Y <= ((not D and not C and B and A) -- A + B
 or (not D and C and not (not B and not A))
 or (D and not C and not B and A) --A-B
 or (D and C and not B)
 or (D and C and B and A)
 ) after td; --element element
end PLMS;