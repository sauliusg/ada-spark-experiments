generic
   type Number is private;
   Zero : Number;
   Unity : Number;
   with function "-" (A, B : Number) return Number is <>;
   with function ">" (A, B : Number) return Boolean is <>;
     
package Extended_Euklidean_Generic is
   
   -- subtype Positive_Number is Number range 1 .. Number'Last;
   
   procedure GCD
     ( 
      A, B : in Number;  -- original numbers
      D    : out Number; -- GCD of the two numbers A and B
      M, N : out Number  -- Bézout coefficients: A * M + B * N = D
     );   
   
end Extended_Euklidean_Generic;
