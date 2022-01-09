package body GCD with Spark_Mode Is
   
   function GCD (A, B : in Integer) return Integer
   is
      X, Y : Integer;
   begin
      X := A;
      Y := B;
      
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
