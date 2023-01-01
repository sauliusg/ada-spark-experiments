pragma Ada_2022;

with Text_IO;             use Text_IO;
with Ada.Command_Line;    use Ada.Command_Line;

with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with Extended_Euklidean_Generic;

procedure Extended_Euklidean_Gen is
   
   -- Test implementaion of the Extended Euclidean Algorithm.
   -- URL: https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm
   
   type Number is new Long_Long_Integer;
   
   package Extended_Euklidean is 
      new Extended_Euklidean_Generic (Number);
      
   use Extended_Euklidean;
   
   A, B : Positive_Number;
   D    : Positive_Number;
   M, N : Number;
   
begin -- Extended_Euklidean
   A := Positive_Number'Value (Argument(1));
   B := Positive_Number'Value (Argument(2));
   
   GCD (A, B, D, M, N);
   
   Put ("A = "); Put (A'Image); New_Line;
   Put ("B = "); Put (B'Image); New_Line;
   New_Line;
   
   Put ("D = "); Put (D'Image); New_Line;
   Put ("M = "); Put (M'Image); New_Line;
   Put ("N = "); Put (N'Image); New_Line;
   
end Extended_Euklidean_Gen;
