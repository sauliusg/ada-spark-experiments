
separate (Main)
procedure Swap (X, Y : in out Integer) is
   T : Integer;
begin
   T := X; X := Y; Y := T;
end;
