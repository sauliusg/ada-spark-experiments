pragma Ada_2022;

package body GCD_Rec with Spark_Mode Is
   
   function GCD (A, B : in Natural) return Positive
   is
   begin
      
      pragma Assert
        (for all N in Positive => Is_GCD (0, N, N));
           
      pragma Assume
        (for all M in Positive =>
           (for all N in Positive =>
              (for all D in Positive =>
                 Equivalent (Is_GCD (M, N, D), Is_GCD (N mod M, M, D)) )));
      
      if B = 0 then
         return A;
      else
         return GCD (B, A mod B);
      end if;
      
   end;
   
end GCD_Rec;
