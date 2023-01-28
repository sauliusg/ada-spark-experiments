pragma Ada_2022;

with Ada.Text_IO; use Ada.Text_IO;

with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

procedure Gen_Filled_Sudoku is
   
   type Sudoku_Field_Content is new Integer range 0 .. 9;
   
   subtype Sudoku_Integer is Sudoku_Field_Content range 1 .. 9;
   
   type Sudoku_Line is array (Sudoku_Integer) of Sudoku_Integer;
   
   type Sudoku_Field is array (Sudoku_Integer, Sudoku_Integer) of
     Sudoku_Field_Content;
   
   Sudoku_Digits : constant Sudoku_Line :=
     (1, 2, 3, 4, 5, 6, 7, 8, 9);
   
   Sudoku_State : Ada.Numerics.Float_Random.Generator;
   
   Field : Sudoku_Field := (others => (others => 0));
   
   procedure Put (F : in Sudoku_Field) is separate;
   
   procedure Swap (A, B : in out Sudoku_Integer) is
      Tmp : Sudoku_Integer := A;
   begin
      A := B; B := Tmp;
   end Swap;
   
   function Random_Less_Than_One (G : Generator) return Uniformly_Distributed is
      R : Uniformly_Distributed;
   begin
      loop
         R := Random (G);
         exit when R /= 1.0;
      end loop;
      return R;
   end;
   
   function Linear_Map 
     ( 
      Rnd : Uniformly_Distributed;
      First, Last : Sudoku_Integer
     ) return Sudoku_Integer
   is
   begin
      -- 0          1          2          3          4
      -- |----------|----------|----------|----------|
      -- First                                       Last
      --  <- 0.25 ->|<- 0.50 ->|<- 0.75 ->|<- 1.00 ->|
      --     => 0       => 1       => 2       => 3
      pragma Assert (Rnd < 1.0);
      return Sudoku_Integer (Natural (First) + Natural (Float'Floor (Float (Last - First) * Rnd)));
   end Linear_Map;
   
   function Random_Index 
     (
      G : Generator;
      First, Last : Sudoku_Integer
     ) return Sudoku_Integer is
   begin
      return Linear_Map (Random_Less_Than_One (G), First, Last);
   end;
   
begin
   
   Reset (Sudoku_State);
   
   declare
      Line : Sudoku_Line := Sudoku_Digits;
      N : Positive := Positive (Line'Last);
   begin
      -- Fisher–Yates shuffle:
      -- https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
      for I in Line'First .. Line'Last - 1 loop
         Swap (Line (I), Line (Random_Index (Sudoku_State, Line'First, Line'Last)));
      end loop;
      for I in Line'Range loop
         Field (1,I) := Line (I);
      end loop;
   end;
   
   Put (Field);
   New_Line;
   
end Gen_Filled_Sudoku;
