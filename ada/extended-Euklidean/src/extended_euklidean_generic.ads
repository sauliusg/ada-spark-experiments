generic
   type Number is range <>;
     
package Extended_Euklidean_Generic is
   
   subtype Positive_Number is Number range 1 .. Number'Last;
   
   procedure GCD
     ( 
      A, B : in Positive_Number;  -- original numbers
      D    : out Positive_Number; -- GCD of the two numbers A and B
      M, N : out Number           -- Bézout coefficients: A * M + B * N = D
     );   
   
end Extended_Euklidean_Generic;
