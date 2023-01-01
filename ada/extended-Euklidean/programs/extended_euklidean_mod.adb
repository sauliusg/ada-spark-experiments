with Text_IO;             use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line;    use Ada.Command_Line;

procedure Extended_Euklidean is
   
   -- Test implementaion of the Extended Euclidean Algorithm.
   -- URL: https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm
   
   procedure GCD
     ( 
      A, B : in  Positive; -- original numbers
      D    : out Positive; -- GCD of the two numbers A and B
      M, N : out Integer   -- Bézout coefficients: A * M + B * N = D
     ) is
      R0 : Positive := A;
      S0 : Integer := 1;
      T0 : Integer := 0;
      R1 : Natural := B;
      S1 : Integer := 0;
      T1 : Integer := 1;
      R, S, T : Integer; -- the next set of values
      Q : Integer;
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
   
   A, B : Positive;
   D : Positive;
   M, N : Integer;
begin -- Extended_Euklidean
   A := Positive'Value (Argument(1));
   B := Positive'Value (Argument(2));
   
   GCD (A, B, D, M, N);
   
   Put ("A = "); Put (A); New_Line;
   Put ("B = "); Put (B); New_Line;
   New_Line;
   
   Put ("D = "); Put (D); New_Line;
   Put ("M = "); Put (M); New_Line;
   Put ("N = "); Put (N); New_Line;
   
end Extended_Euklidean;
