separate(Gen_Filled_Sudoku)

procedure Put (F : in Sudoku_Field) is
begin
   for I in F'Range(1) loop
      for J in F'Range(2) loop
         Put (F (I,J)'Image);
      end loop;
      New_Line;
   end loop;
end;
