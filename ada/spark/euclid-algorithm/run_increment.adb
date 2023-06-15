with Text_IO;   use Text_IO;
with Increment; use Increment;

procedure Run_Increment is
   I : Integer;
begin
   I := 15;
   Put_Line(Integer'Image(I));
   Increment.Increment(I);
   Put_Line(Integer'Image(I));
end;
