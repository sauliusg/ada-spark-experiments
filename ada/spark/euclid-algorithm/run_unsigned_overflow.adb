with Text_IO;   use Text_IO;

procedure Run_Unsigned_Overflow is
   I : Positive;
begin
   I := Positive'Last - 2;
   
   for J in 1 .. 4 loop
      I := I + 1;
      Put_Line(Positive'Image(I));
   end loop;
   
end;
