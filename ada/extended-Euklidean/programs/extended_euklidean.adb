with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line;    use Ada.Command_Line;

procedure Extended_Euklidean is

   -- Test implementaion of the Extended Euclidean Algorithm.
   -- URL: https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm

   procedure GCD
     (
      A, B : in Positive; -- original numbers
      D : out Positive;   -- GCD of the two numbers A and B
      M, N : out Integer  -- Bézout coefficients: A * M + B * N = D
     )
   is
      P : Integer := 1; -- X = P*A + Q*B at any point
      Q : Integer := 0;
      S : Integer := 0; -- Y = S*A + T*B at any point
      T : Integer := 1;
      X : Positive := A;
      Y : Positive := B;
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
         -- LCM is the Least Common Multiple
         M := P - B / D; -- subtract LCM / A
         N := Q + A / D; -- add      LCM / B
      else
         M := P;
         N := Q;
      end if;
      -- The naive computation of the N value can overflow:
      -- N := (X - P*A) / B;
      pragma Assert (X = Y);
      pragma Assert
        (
         Long_Integer (D) =
           Long_Integer (A) * Long_Integer (M) +
           Long_Integer (B) * Long_Integer (N)
        );
   end GCD;

   A, B : Positive;
   D : Positive;
   M, N : Integer;
begin -- Extended_Euklidean
   A := Positive'Value (Argument (1));
   B := Positive'Value (Argument (2));

   GCD (A, B, D, M, N);

   Put ("A = "); Put (A); New_Line;
   Put ("B = "); Put (B); New_Line;
   New_Line;

   Put ("D = "); Put (D); New_Line;
   Put ("M = "); Put (M); New_Line;
   Put ("N = "); Put (N); New_Line;

end Extended_Euklidean;
