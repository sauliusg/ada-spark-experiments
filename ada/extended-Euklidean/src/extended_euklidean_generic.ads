generic
   type Number is range <>;
     
package Extended_Euklidean_Generic is
   
   procedure GCD
     ( 
      A, B : in Number;  -- original numbers
      D    : out Number; -- GCD of the two numbers A and B
      M, N : out Number  -- Bézout coefficients: A * M + B * N = D
     );   
   
end Extended_Euklidean_Generic;
