pragma Ada_2022;

with Text_IO;             use Text_IO;
with Ada.Command_Line;    use Ada.Command_Line;

with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

with Extended_Euclidean_Mod_Generic;

procedure Multiplicative_Inverse is
   
   -- subtype Number is Long_Integer;
   -- subtype Positive_Number is Number range 1 .. Number'Last;
   -- subtype Positive_Number is Number;
   
   type Number is new Big_Integer;
   type Positive_Number is new Big_Positive;
   
   package Extended_Euclidean_Mod is 
      new Extended_Euclidean_Mod_Generic (Number, Positive_Number, 0, 1);
      
   use Extended_Euclidean_Mod;
   
   A, P, I : Positive_Number;
   -- A: original number
   -- P: module (a prime number, or at least co-prime with A)
   -- I: multiplicative inverse of A in the ring mod P.
   
   function From_String (S : String) return Long_Integer is
      (Long_Integer'Value (S));
   
begin -- Multiplicative_Inverse
   A := From_String (Argument (1));
   P := From_String (Argument (2));

   Put ("A = "); Put (A'Image); New_Line;
   Put ("P = "); Put (P'Image); New_Line;
   New_Line;
   
   Inverse (A, P, I);
   
   Put ("I = "); Put (I'Image); New_Line;
   Put ("Check: A*I mod P = ");
   declare
      Product : Number;
   begin
      Product := Number ((A * I) mod P);
      Put (Product'Image);
   end;
   New_Line;
   
end Multiplicative_Inverse;
