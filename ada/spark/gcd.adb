pragma Ada_2022;

with Ada.Numerics.Big_Numbers.Big_Integers;
use  Ada.Numerics.Big_Numbers.Big_Integers;
  
package body GCD with Spark_Mode Is
   
   function GCD (A, B : in Positive) return Positive
   is
      X, Y : Positive;
   begin
      X := A;
      Y := B;
      
      pragma Assume (for all U in Positive =>
                       (for all V in Positive =>
                          (for all D in Positive =>
                             (if U >= D then 
                                (U mod D - V mod D) mod D = (U - V) mod D))));
         
      while X /= Y loop
         pragma Loop_Invariant (X > 0 and Y > 0);
         pragma Loop_Invariant (
                                for all D in Positive =>
                                  (if X mod D = 0 and then
                                     Y mod D = 0 and then
                                     X > Y
                                     then (X - Y) mod D = 0)
                               );
         if X > Y then
            X := X - Y;
         else
            Y := Y - X;
         end if;
      end loop;
      
      return X;
   end;
   
end GCD;
