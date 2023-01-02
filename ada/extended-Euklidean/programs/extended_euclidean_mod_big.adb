pragma Ada_2022;

with Text_IO;             use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line;    use Ada.Command_Line;

with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

procedure Extended_Euclidean_Mod_Big is
   
   -- Test implementaion of the Extended Euclidean Algorithm.
   -- URL: https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm
   
   procedure GCD
     ( 
      A, B : in  Big_Positive; -- original numbers
      D    : out Big_Positive; -- GCD of the two numbers A and B
      M, N : out Big_Integer   -- Bézout coefficients: A * M + B * N = D
     ) is
      R0 : Big_Positive := A;
      S0 : Big_Integer := 1;
      T0 : Big_Integer := 0;
      R1 : Big_Natural := B;
      S1 : Big_Integer := 0;
      T1 : Big_Integer := 1;
      R, S, T : Big_Integer; -- the next set of values
      Q : Big_Integer;
   begin
      while R1 > 0 loop
         Q := R0 / R1;
         R := R0 - Q * R1;
         S := S0 - Q * S1;
         T := T0 - Q * T1;
         S0 := S1; S1 := S;
         R0 := R1; R1 := R;
         T0 := T1; T1 := T;
      end loop;
      D := R0;
      M := S0;
      N := T0;
   end GCD;
   
   A, B : Big_Positive;
   D    : Big_Positive;
   M, N : Big_Integer;
   
begin -- Extended_Euclidean
   A := From_String (Argument (1));
   B := From_String (Argument (2));
   
   GCD (A, B, D, M, N);
   
   Put ("A = "); Put (A'Image); New_Line;
   Put ("B = "); Put (B'Image); New_Line;
   New_Line;
   
   Put ("D = "); Put (D'Image); New_Line;
   Put ("M = "); Put (M'Image); New_Line;
   Put ("N = "); Put (N'Image); New_Line;
   
end Extended_Euclidean_Mod_Big;
