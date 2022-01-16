pragma Ada_2022;

with Ada.Numerics.Big_Numbers.Big_Integers;
use  Ada.Numerics.Big_Numbers.Big_Integers;
  
package GCD with Spark_Mode Is

   function Equivalent (L1, L2 : Boolean) return Boolean
   is ((L1 and then L2) or else (not L1 and then not L2))
     with
     Spark_Mode,
     Ghost,
     Pre => L1 in Boolean and L2 in Boolean,
     Post => Equivalent'Result = ((L1 and L2) or (not L1 and not L2));
   
   function Is_Divisor (A,D : Positive) return Boolean
     is (A mod D = 0)
     with
       Ghost,
       Pre => A in Positive and then D in Positive,
       Post => Is_Divisor'Result = (A mod D = 0);
   
   function Is_Common_Divisor (A, B, D : in Positive) return Boolean
   is 
      (Is_Divisor (A, D) and then Is_Divisor (B, D))
        with
        Ghost,
        Pre => A > 0 and then B > 0 and then D > 0,
        Post =>
        Is_Common_Divisor'Result = (Is_Divisor (A, D) and then Is_Divisor (B, D));
   
   function Is_GCD (A, B, D : in Positive) return Boolean
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
   
   function GCD (A, B : in Positive) return Positive
     with
     Pre  => 
       A > 0 and then A <= Positive'Last and then 
       B > 0 and then B <= Positive'Last,
     Post => Is_GCD (A, B, GCD'Result);
         
     -- The following postcondition can not be (easily?) proved in
     -- 'gnatprove':
     -- 
     -- Post =>
     --   GCD'Result > 0 and then
     --   A mod GCD'Result = 0 and then
     --   B mod GCD'Result = 0;
   
end GCD;
