with Text_IO;   use Text_IO;

procedure Run_Modulo_Overflow is
   type U32 is mod 2**32;
   I : U32;
begin
   I := U32'Last - 2;
   
   for J in 1 .. 4 loop
      I := I + 1;
      Put_Line(U32'Image(I));
   end loop;
   
end;
