package Sudoku is
   
   type Sudoku_Field_Content is new Integer range 0 .. 9;
   
   subtype Sudoku_Integer is Sudoku_Field_Content range 1 .. 9;
   
   type Sudoku_Line_Segment is array (Sudoku_Integer range <>) of 
     Sudoku_Integer;
   
   subtype Sudoku_Line is Sudoku_Line_Segment (Sudoku_Integer);
   
   type Sudoku_Field is array (Sudoku_Integer, Sudoku_Integer) of
     Sudoku_Field_Content;
   
   Sudoku_Digits : constant Sudoku_Line :=
     (1, 2, 3, 4, 5, 6, 7, 8, 9);

   function Digit_Is_Permissible
     (
      F : Sudoku_Field;     -- The Sudoku field, filled from the top to the bottom
      N : Sudoku_Integer;   -- The number to be checked
      L, C : Sudoku_Integer -- line and column of the new number
     ) return Boolean;
   
end Sudoku;
