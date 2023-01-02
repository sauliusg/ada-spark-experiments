package body Extended_Euclidean_Mod_Generic is
   
   -- Test implementaion of the Extended Euclidean Algorithm.
   -- URL: https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm
   
   procedure GCD
     ( 
      A, B : in  Positive_Number; -- original numbers
      D    : out Positive_Number; -- GCD of the two numbers A and B
      M, N : out Number           -- Bézout coefficients: A * M + B * N = D
     ) is
      R0 : Positive_Number := A;
      S0 : Number := Unity;
      T0 : Number := Zero;
      R1 : Number := Number (B);
      S1 : Number := Zero;
      T1 : Number := Unity;
      R, S, T : Number; -- the next set of values for R1, S1, T1
      Q : Number;
   begin
      while R1 > Zero loop
         Q := Number (R0) / R1;
         R := Number (R0) - Q * R1;
         S := S0 - Q * S1;
         T := T0 - Q * T1;
         S0 := S1; S1 := S;
         T0 := T1; T1 := T;
         R0 := Positive_Number (R1);
         R1 := R;
      end loop;
      D := R0;
      M := S0;
      N := T0;
   end GCD;
   
end Extended_Euclidean_Mod_Generic;
