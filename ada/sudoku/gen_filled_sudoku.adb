pragma Ada_2022;

with Ada.Text_IO; use Ada.Text_IO;

with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

procedure Gen_Filled_Sudoku is
   
   type Sudoku_Field_Content is new Integer range 0 .. 9;
   
   subtype Sudoku_Integer is Sudoku_Field_Content range 1 .. 9;
   
   type Sudoku_Line_Segment is array (Sudoku_Integer range <>) of Sudoku_Integer;
   
   subtype Sudoku_Line is Sudoku_Line_Segment (Sudoku_Integer);
   
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
   
   function Digit_Is_Permissible
     (
      F : Sudoku_Field;     -- The Sudoku field, filled from the top to the bottom
      N : Sudoku_Integer;   -- The number to be checked
      L, C : Sudoku_Integer -- line and column of the new number
     ) return Boolean is separate;
   
   NO_PERMISSIBLE_DIGITS : exception;
   
   procedure Put (Line : Sudoku_Line_Segment) is
   begin
      for I in Line'Range loop
         Put (Line (I)'Image);
      end loop;
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
      Put (Line);
      New_Line;
   end;
   
   for L in Field'First + 1 .. Field'Last loop
      for I in Field'Range(2) loop
         declare
            Permissible_Digits : Sudoku_Line;
            N_Digits : Integer := Integer (Permissible_Digits'First) - 1;
         begin
            for D in Sudoku_Integer'Range loop
               if Digit_Is_Permissible (Field, D, L, I) then
                  N_Digits := N_Digits + 1;
                  Permissible_Digits (Sudoku_Integer (N_Digits)) := D;
               end if;
            end loop;
            
            Put ("Permissible digits: ");
            Put (Permissible_Digits (Permissible_Digits'First .. Sudoku_Integer (N_Digits)));
            New_Line;

            if N_Digits < Integer (Permissible_Digits'First) then
               raise NO_PERMISSIBLE_DIGITS with
                 "No permissible digits could be found for row " &
                 L'Image &
                 ", column " &
                 I'Image;
            end if;
            Field (L,I) := Permissible_Digits 
              (
               Random_Index (Sudoku_State, Permissible_Digits'First, 
                             Sudoku_Integer (N_Digits))
              );
            Put ("Digit chosen:" & Field (L,I)'Image);
            New_Line;
         end;
      end loop;
   end loop;
   
   Put (Field);
   New_Line;
   
end Gen_Filled_Sudoku;
