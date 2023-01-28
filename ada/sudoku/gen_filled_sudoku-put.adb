separate(Gen_Filled_Sudoku)

procedure Put (F : in Sudoku_Field) is
begin
   for I in F'Range(1) loop
      for J in F'Range(2) loop
         Put (F (I,J)'Image);
         if J mod 3 = 0 then
            Put (" ");
         end if;
      end loop;
      New_Line;
      if I mod 3 = 0 and then I < F'Last(1) then
         New_Line;
      end if;
   end loop;
end;
