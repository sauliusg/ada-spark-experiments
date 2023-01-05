pragma Ada_2022;

with Text_IO;             use Text_IO;
with Ada.Command_Line;    use Ada.Command_Line;

with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

with Extended_Euclidean_Mod_Generic;

procedure Extended_Euclidean_Mod_Gen is
   
   -- Test implementaion of the Extended Euclidean Algorithm.
   -- URL: https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm
   
   -- Test implementaion of the Extended Euclidean Algorithm.
   -- URL: https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm
   
   -- subtype Number is Long_Integer;
   -- subtype Positive_Number is Number range 1 .. Number'Last;
   -- subtype Positive_Number is Number;
   
   type Number is new Big_Integer;
   type Positive_Number is new Big_Positive;
   
   package Extended_Euclidean_Mod is 
      new Extended_Euclidean_Mod_Generic (Number, Positive_Number, 0, 1);
      
   use Extended_Euclidean_Mod;
   
   A, B : Positive_Number;
   D    : Positive_Number;
   M, N : Number;
   
   function From_String (S : String) return Long_Integer is
      (Long_Integer'Value (S));
   
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
   
end Extended_Euclidean_Mod_Gen;
