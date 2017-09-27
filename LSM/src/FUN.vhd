package FUN is 
type arith_mode_type is (signed, unsigned);
function minimum(a,b: in integer) return integer;
end FUN;
package body FUN is
function minimum (a,b: integer) return integer is
variable c: integer; -- local variable
begin
if a < b then
c := a; -- a is min
else
c := b; -- b is min
end if;
return c; -- return min value
end;
end FUN;