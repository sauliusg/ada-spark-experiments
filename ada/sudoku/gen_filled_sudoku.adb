pragma Ada_2022;

with Ada.Text_IO; use Ada.Text_IO;

with Ada.Numerics.Discrete_Random;

procedure Gen_Filled_Sudoku is
   
   type Sudoku_Field_Content is new Integer range 0 .. 9;
   
   subtype Sudoku_Integer is Sudoku_Field_Content range 1 .. 9;
   
   type Sudoku_Line is array (Sudoku_Integer) of Sudoku_Integer;
   
   type Sudoku_Field is array (Sudoku_Integer, Sudoku_Integer) of
     Sudoku_Field_Content;
   
   Sudoku_Digits : constant Sudoku_Line :=
     (1, 2, 3, 4, 5, 6, 7, 8, 9);
   
   package Random_Sudoku_Integer is new
     Ada.Numerics.Discrete_Random (Sudoku_Integer);
      
   use Random_Sudoku_Integer;
   
   Sudoku_State : Random_Sudoku_Integer.Generator;
   
   Field : Sudoku_Field := (others => (others => 0));
   
   procedure Put (F : in Sudoku_Field) is separate;
   
   procedure Swap (A, B : in out Sudoku_Integer) is
      Tmp : Sudoku_Integer := A;
   begin
      A := B; B := Tmp;
   end Swap;
   
begin
   
   Reset (Sudoku_State);
   
   Put (Random (Sudoku_State)'Image);
   New_Line;
   
   declare
      Line : Sudoku_Line := Sudoku_Digits;
      N : Positive := Positive (Line'Last);
   begin
      -- Fisher–Yates shuffle:
      -- https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
      for I in Line'First .. Line'Last - 1 loop
         Swap (Line (I), Line (Random (Sudoku_State)));
      end loop;
      for I in Line'Range loop
         Field (1,I) := Line (I);
      end loop;
   end;
   
   Put (Field);
   New_Line;
   
end Gen_Filled_Sudoku;
