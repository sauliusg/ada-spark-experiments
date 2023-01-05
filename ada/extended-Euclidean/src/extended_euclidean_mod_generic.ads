generic
   type Number is private;
   type Positive_Number is new Number;
   Zero : Number;
   Unity : Number;
   with function ">" (A, B : Number) return Boolean is <>;
   with function "-" (A, B : Number) return Number is <>;
   with function "+" (A, B : Number) return Number is <>;
   with function "/" (A, B : Number) return Number is <>;
   with function "*" (A, B : Number) return Number is <>;
   with function "-" (A, B : Positive_Number) return Positive_Number is <>;
   with function "/" (A, B : Positive_Number) return Positive_Number is <>;
   with function "*" (A, B : Positive_Number) return Positive_Number is <>;
     
package Extended_Euclidean_Mod_Generic is
   
   -- subtype Positive_Number is Number range 1 .. Number'Last;
   
   procedure GCD
     ( 
      A, B : in  Positive_Number; -- original numbers
      D    : out Positive_Number; -- GCD of the two numbers A and B
      M, N : out Number           -- Bézout coefficients: A * M + B * N = D
     )
     with Pre => (Number (A) > Zero and Number (B) > Zero);
   
   -- Find multiplicative inverse for a number.
   procedure Inverse
     (
      A : in Positive_Number; -- a number to find inverse for
      P : in Positive_Number; -- a prime module
      X : out Positive_Number -- inverse of A: A*X = 1 (mod P)
     );

end Extended_Euclidean_Mod_Generic;
