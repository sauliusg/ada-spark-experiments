pragma Ada_2022;

with Ada.Numerics.Big_Numbers.Big_Integers;
use  Ada.Numerics.Big_Numbers.Big_Integers;
  
package body GCD with Spark_Mode Is
   
   procedure Lemma_Mod_0 (X,Y,D : in out Positive) 
     with 
     Ghost,
     Pre => X in Positive and then Y in Positive and then D in Positive,
     Post => (if X mod D = 0 and then Y mod D = 0 then 
     X mod D - Y mod D = 0)
   is
   begin
      null;
   end;
   
   procedure Lemma_Mod_Distributivity (X,Y,D : in out Positive) 
     with 
     Ghost,
     Pre => X in Positive and then Y in Positive and then D in Positive,
     Post => (if X > Y then (X mod D - Y mod D) mod D = (X-Y) mod D)
   is
   begin
     pragma Assume ( for all X in Positive =>
                       (for all Y in Positive =>
                          (for all D in Positive =>
                             (X mod D - Y mod D) mod D = (X-Y) mod D
                          )
                       )
                   );
      null;
   end;
   
   function GCD (A, B : in Positive) return Positive
   is
      X, Y : Positive;
   begin
      X := A;
      Y := B;
      
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
