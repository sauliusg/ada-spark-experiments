pragma Ada_2022;

with Ada.Numerics.Big_Numbers.Big_Integers;
use  Ada.Numerics.Big_Numbers.Big_Integers;
  
package body GCD_Lemmas with Spark_Mode Is

   function Is_Divisor (A,D : Positive) return Boolean
     is (A mod D = 0)
     with
       Ghost,
       Pre => A in Positive and then D in Positive,
       Post => Is_Divisor'Result = (A mod D = 0);   
     
   function Is_GCD (A, B, D : in Positive) return Boolean
     -- GCD == Greatest Common Divisor
   is 
      (Is_Divisor (A, D) and then
         Is_Divisor (B, D) and then
         (for all D1 in D .. Positive'Last =>
            D = D1 or else
            (not Is_Divisor (A, D1)) or else
            (not Is_Divisor (B, D1))))
        with
        Ghost,
        Pre => A > 0 and then B > 0 and then D > 0,
        Post =>
        Is_GCD'Result = 
          (Is_Divisor (A, D) and then
             Is_Divisor (B, D) and then
             (for all D1 in D .. Positive'Last =>
                D = D1 or else
                (not Is_Divisor (A, D1)) or else
                (not Is_Divisor (B, D1))))
          ;
   
   function Is_Common_Divisor (A, B, D : in Positive) return Boolean
   is 
      (Is_Divisor (A, D) and then Is_Divisor (B, D))
        with
        Ghost,
        Pre => A > 0 and then B > 0 and then D > 0,
        Post =>
        Is_Common_Divisor'Result = (Is_Divisor (A, D) and then Is_Divisor (B, D));
        
        pragma Assume 
          (for all U in Positive =>
             (for all V in Positive =>
                (for all D in Positive =>
                   (if U >= D then 
          (U mod D - V mod D) mod D = (U - V) mod D))));
        
        pragma Assert 
          (for all D in Positive => 
             (for all M in Positive =>
                (for all N in Positive =>
                   (if M > N and then Is_Common_Divisor (M, N, D) then 
          Is_Common_Divisor ((M - N), N, D))))
          );
        
        pragma Assert
          (for all D in Positive => 
             (for all M in Positive =>
                (for all N in Positive =>
                   (if M > N and then Is_Common_Divisor ((M - N), N, D) then 
          Is_Common_Divisor (M, N, D))))
          );    
   
        pragma Assert 
          (for all D in Positive => 
             (for all M in Positive =>
                (for all N in Positive =>
                   (if M > N and then Is_GCD (M, N, D) then 
          Is_GCD ((M - N), N, D))))
          );
        
        pragma Assert
          (for all D in Positive => 
             (for all M in Positive =>
                (for all N in Positive =>
                   (if M > N and then Is_GCD ((M - N), N, D) then 
          Is_GCD (M, N, D))))
          );    
   
end GCD_Lemmas;
