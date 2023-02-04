pragma Ada_2022;

with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;
with Sudoku;       use Sudoku;

with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

procedure Gen_Filled_Sudoku is
   
   Sudoku_State : Ada.Numerics.Float_Random.Generator;
   
   Empty_Field : constant Sudoku_Field := (others => (others => 0));
   Field : Sudoku_Field;
   
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
      --       1          2          3          4
      -- |----------|----------|----------|----------|
      --     First                            Last
      --
      --  <- 0.25 ->|<- 0.50 ->|<- 0.75 ->|<- 1.00 ->|
      --     => 0       => 1       => 2       => 3
      pragma Assert (Rnd < 1.0);
      return Sudoku_Integer 
        (
         Natural (First) + 
         Natural (Float'Floor ((Float (Last - First) + 1.0) * Rnd))
        );
   end Linear_Map;
   
   function Random_Index 
     (
      G : Generator;
      First, Last : Sudoku_Integer
     ) return Sudoku_Integer is
   begin
      return Linear_Map (Random_Less_Than_One (G), First, Last);
   end;
   
   NO_PERMISSIBLE_DIGITS : exception;
   
   Max_Line : Sudoku_Integer;
   
   Epoch : constant Time := Formatting.Time_Of (1970, 1, 1, 0.0);
   
   Current_Time : constant Time := Clock;
   
   Seconds_Since_Epoch : constant Duration := Current_Time - Epoch;
   
   type Small_Mod is mod 2**8;
   type Mod_Integer is mod Long_Integer'Last + 1;
   
   function Int (D : Duration) return Duration is
      -- Rounds away what used to be a fractional part:
      S : Duration := D * Duration'Small;
   begin
      return S / Duration'Small; -- Restores the integer part.
   end;
   
   function Reduce_Small_Mod (D : Duration) return Small_Mod is
      Divisor : Duration := (Duration (Small_Mod'Last) + 1.0);
      DI : Duration := Int (D);            -- Integer part of D
      DQ : Duration := Int (DI / Divisor); -- Quotient
      DR : Duration := DI - DQ * Divisor;  -- Reminder; provably smaller than Divisor
      R : Small_Mod := Small_Mod (DR);     -- Should never trigger range check error
   begin
      -- New_Line;
      -- Put_Line ("Divisor = " & Divisor'Image);
      -- Put_Line ("D = " & D'Image);
      -- Put_Line ("DI = " & DI'Image);
      -- Put_Line ("DQ = " & DQ'Image);
      -- Put_Line ("DR = " & DR'Image);
      -- Put_Line ("R  = " & R'Image);
      return R;
   end;
   
   function Lowest_Bits (D : Duration) return Mod_Integer is
      C : Duration := Int (D); -- Currectn value of D in the loop;
      B : Mod_Integer := 0;
      K : Mod_Integer := 1;
      S : constant Mod_Integer := Mod_Integer (Small_Mod'Last) + 1;
      M : Small_Mod;
      -- N : Natural := 1;
   begin
      while C /= 0.0 loop
         -- Put_Line ("B = " & B'Image);
         -- Put_Line ("C = " & C'Image);
         -- Put_Line ("M = " & M'Image);
         -- Put_Line ("K = " & K'Image);
         -- Put_Line ("S = " & S'Image);
         -- Put_Line ("N = " & N'Image);
         -- New_Line;
         M := Reduce_Small_Mod (C);
         C := Int (C / (Duration (Small_Mod'Last) + 1.0));
         B := B + Mod_Integer (M) * K;
         K := K * S;
         -- N := N + 1;
      end loop;
      return B;
   end;
      
   Random_Seed : Integer := Integer (Lowest_Bits (Seconds_Since_Epoch));
   
begin
   
   Put_Line ("#TIME: " & Duration'Image (Seconds_Since_Epoch));
   Put_Line ("#SEED: " & Random_Seed'Image);
   
   Reset (Sudoku_State, Random_Seed);
   
   loop
      
      Field := Empty_Field;
      
      declare
         Line : Sudoku_Line := Sudoku_Digits;
      begin
         -- Fisher–Yates shuffle:
         -- https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
         for I in Line'First .. Line'Last - 1 loop
            Swap (Line (I), Line (Random_Index (Sudoku_State, I, Line'Last)));
         end loop;
         for I in Line'Range loop
            Field (1,I) := Line (I);
         end loop;
      end;
      
  Generate_Field:
      for L in Field'First + 1 .. Field'Last loop
         Max_Line := L;
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
               
               if N_Digits < Integer (Permissible_Digits'First) then
                  exit Generate_Field;
               end if;
               
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
            end;
         end loop;
      end loop Generate_Field;
      
      if Max_Line = Field'Last(1) then
         Put (Field);
         exit;
      end if;
   
   end loop;
   
end Gen_Filled_Sudoku;
