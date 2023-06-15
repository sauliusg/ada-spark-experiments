with Text_IO;   use Text_IO;

procedure Run_Long_Overflow is
   subtype Long is Long_Integer;
   I : Long;
begin
   I := Long'Last - 2;
   
   for J in 1 .. 4 loop
      I := I + 1;
      Put_Line(Long'Image(I));
   end loop;
   
end;
