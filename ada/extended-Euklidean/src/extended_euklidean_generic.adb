
package body Extended_Euklidean_Generic is
   
   -- Test implementaion of the Extended Euclidean Algorithm.
   -- URL: https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm
   
   procedure GCD
     ( 
      A, B : in  Positive_Number; -- original numbers
      D    : out Positive_Number; -- GCD of the two numbers A and B
      M, N : out Number           -- Bézout coefficients: A * M + B * N = D
     ) is
      P : Number := 1; -- X = P*A + Q*B at any point
      Q : Number := 0;
      S : Number := 0; -- Y = S*A + T*B at any point
      T : Number := 1;
      X : Positive_Number := A; 
      Y : Positive_Number := B;
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
      M := P;
      N := Q;
      -- The naive computation of the N value can overflow:
      -- N := (X - P*A) / B;
      pragma Assert (X = Y);
      -- pragma Assert 
      --   (
      --    Long_Integer (D) =
      --      Long_Integer (A) * Long_Integer (M) + 
      --      Long_Integer (B) * Long_Integer (N)
      --   );
   end GCD;
   
end Extended_Euklidean_Generic;
