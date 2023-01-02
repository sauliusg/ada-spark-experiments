pragma Ada_2022;

with Text_IO;             use Text_IO;
with Ada.Command_Line;    use Ada.Command_Line;

with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

procedure Extended_Euklidean_Big is
   
   -- Test implementaion of the Extended Euclidean Algorithm.
   -- URL: https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm
   
   procedure GCD
     ( 
      A, B : in Big_Positive;  -- original numbers
      D    : out Big_Positive; -- GCD of the two numbers A and B
      M, N : out Big_Integer   -- Bézout coefficients: A * M + B * N = D
     ) is
      P : Big_Integer := 1; -- X = P*A + Q*B at any point
      Q : Big_Integer := 0;
      S : Big_Integer := 0; -- Y = S*A + T*B at any point
      T : Big_Integer := 1;
      X : Big_Positive := A; 
      Y : Big_Positive := B;
   begin
      while X /= Y loop
         if X > Y then
            X := X - Y;
            P := P - S;
            Q := Q - T;
         else
            Y := Y - X;
            S := S - P;
            T := T - Q;
         end if;
      end loop;
      D := X;
      if abs P > B / (2 * D) then
         -- LCM == Least Common Multiple
         M := P - B / D; -- subtract LCM / A
         N := Q + A / D; -- add      LCM / B
      else
         M := P;
         N := Q;
      end if;
      -- The naive computation of the N value can overflow:
      -- N := (X - P*A) / B;
      pragma Assert (X = Y);
      pragma Assert (D = A * M + B * N);
   end GCD;
   
   A, B : Big_Positive;
   D : Big_Positive;
   M, N : Big_Integer;
begin -- Extended_Euklidean
   A := From_String (Argument (1));
   B := From_String (Argument (2));
   
   GCD (A, B, D, M, N);
   
   Put ("A = "); Put (A'Image); New_Line;
   Put ("B = "); Put (B'Image); New_Line;
   New_Line;
   
   Put ("D = "); Put (D'Image); New_Line;
   Put ("M = "); Put (M'Image); New_Line;
   Put ("N = "); Put (N'Image); New_Line;
   
end Extended_Euklidean_Big;
