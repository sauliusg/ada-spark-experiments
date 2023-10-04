with Text_IO;   use Text_IO;

procedure Run_Integer_Overflow is
   I : Integer;
begin
   I := Integer'Last - 2;
   
   for J in 1 .. 4 loop
      I := I + 1;
      Put_Line(Integer'Image(I));
   end loop;
   
end;
