pragma Ada_2022;

with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

with SPARK.Arithmetic_Lemmas; 

package body GCD with Spark_Mode Is
   
   package Integer_Arithmetic_Lemmas
   is new SPARK.Arithmetic_Lemmas (Int => Integer,
                                   Big => To_Big_Integer);

   use Integer_Arithmetic_Lemmas;
  
   function GCD (A, B : in Integer) return Integer
   is
      X, Y : Integer;
   begin
      X := A;
      Y := B;
      
      Lemma_Div_Is_Monotonic (A, B, X);
      
      while X /= Y loop
         pragma Loop_Invariant (X > 0 and Y > 0);
         if X > Y then
            X := X - Y;
         else
            Y := Y - X;
         end if;
      end loop;
      
      return X;
   end;
   
end GCD;
