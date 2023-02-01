with Ada.Text_IO; use Ada.Text_IO;

package body Sudoku is
   
   function Digit_Is_Permissible
     (
      F : Sudoku_Field;     -- The Sudoku field, filled from the top to the bottom
      N : Sudoku_Integer;   -- The number to be checked
      L, C : Sudoku_Integer -- line and column of the new number
     ) return Boolean is separate;
   
   procedure Put (F : in Sudoku_Field) is separate;

end Sudoku;
