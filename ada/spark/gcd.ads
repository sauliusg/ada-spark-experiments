pragma Ada_2022;

with Ada.Numerics.Big_Numbers.Big_Integers;
use  Ada.Numerics.Big_Numbers.Big_Integers;
  
package GCD with Spark_Mode Is
   
   function Max (A, B : Integer) return Integer 
   is (if A > B then A else B)
     with
     Ghost,
     Pre => A in Integer and then B in Integer, 
     Post => Max'Result = (if A > B then A else B);       
     
   function GCD (A, B : in Integer) return Integer
     with
     Pre  => 
       A > 0 and then A <= Integer'Last and then 
       B > 0 and then B <= Integer'Last,
     Post => 
         (for some D in 2 .. Max (A,B) => 
            To_Big_Integer (GCD'Result) * To_Big_Integer (D) = 
            To_Big_Integer (A)
         );
         
     -- The following postcondition can not be (easily?) proved in
     -- 'gnatprove':
     -- 
     -- Post =>
     --   GCD'Result > 0 and then
     --   A mod GCD'Result = 0 and then
     --   B mod GCD'Result = 0;
   
end GCD;
