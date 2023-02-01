separate(Sudoku)

function Digit_Is_Permissible
  (
   F : Sudoku_Field;     -- The Sudoku field, filled from the top to the bottom
   N : Sudoku_Integer;   -- The number to be checked
   L, C : Sudoku_Integer -- line and column of the new number
  ) return Boolean is
   Square_Row, Square_Col : Sudoku_Integer;
begin
   Square_Row := 1 + ((L - 1) / 3) * 3;
   Square_Col := 1 + ((C - 1) / 3) * 3;
   
   -- Check the row:
   for I in F'Range(2) loop
      if F (L, I) = N then
         return False;
      end if;
   end loop;
   
   -- Check the column:
   for I in F'Range(1) loop
      if F (I, C) = N then
         return False;
      end if;
   end loop;
   
   -- Check the square:
   for I in Square_Row .. Square_Row + 2 loop
      for J in Square_Col .. Square_Col + 2 loop
         if F (I, J) = N then
            return False;
         end if;
      end loop;
   end loop;
   
   return True;
end Digit_Is_Permissible;
