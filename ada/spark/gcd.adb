pragma Ada_2022;

with Ada.Numerics.Big_Numbers.Big_Integers;
use  Ada.Numerics.Big_Numbers.Big_Integers;
  
package body GCD with Spark_Mode Is
   
   function Predicate_Is_GCD (A, B, D : in Positive) return Boolean
   is 
      ( A mod D = 0 and then
        B mod D = 0 and then
          (for all D1 in D .. Positive'Last =>
             D = D1 or else
             A mod D1 /= 0 or else
             B mod D1 /= 0))
        with
        Ghost,
        Pre => A > 0 and then B > 0 and then D > 0,
        Post =>
        Predicate_Is_GCD'Result = 
          (A mod D = 0 and then
           B mod D = 0 and then
             (for all D1 in D .. Positive'Last =>
                D = D1 or else
                A mod D1 /= 0 or else
                B mod D1 /= 0 ))
          ;
   
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
      
      pragma Assert (for all N in Positive => 
                       (if Predicate_Is_GCD (A, B, N) then Predicate_Is_GCD (X, Y, N))
                    );
      
      while X /= Y loop
         pragma Loop_Invariant (X > 0 and Y > 0);
         
         -- pragma Loop_Invariant (for all N in Positive => 
         --                          (if Predicate_Is_GCD (A, B, N) then 
         --                              Predicate_Is_GCD (X, Y, N))
         --                       );
      
         pragma Loop_Invariant 
           (for all D in Positive =>
              (if Divisor (X,D) and then Divisor (Y,D) then 
                 (if X > Y then (X - Y) mod D = 0 else (Y - X) mod D = 0)));

         if X > Y then
            X := X - Y;
         else
            Y := Y - X;
         end if;
         
      end loop;
      
      return X;
   end;
   
end GCD;
