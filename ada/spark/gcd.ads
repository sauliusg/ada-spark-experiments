pragma Ada_2022;

with Ada.Numerics.Big_Numbers.Big_Integers;
use  Ada.Numerics.Big_Numbers.Big_Integers;
  
package GCD with Spark_Mode Is

   function Divisor (A,D : Positive) return Boolean
     is (A mod D = 0)
     with
       Ghost,
       Pre => A in Positive and then D in Positive,
       Post => Divisor'Result = (A mod D = 0);
   
   function GCD (A, B : in Positive) return Positive
     with
     Pre  => 
       A > 0 and then A <= Positive'Last and then 
       B > 0 and then B <= Positive'Last,
     Post => Divisor (A, GCD'Result);
         
     -- The following postcondition can not be (easily?) proved in
     -- 'gnatprove':
     -- 
     -- Post =>
     --   GCD'Result > 0 and then
     --   A mod GCD'Result = 0 and then
     --   B mod GCD'Result = 0;
   
end GCD;
