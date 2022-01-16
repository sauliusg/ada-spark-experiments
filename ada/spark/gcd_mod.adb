pragma Ada_2022;

package body GCD_Mod with Spark_Mode Is
   
   function GCD (A, B : in Positive) return Positive
   is
      X, Y, T : Natural;
   begin
      X := A;
      Y := B;
      
      while X > 0 loop
         
         pragma Loop_Invariant
           (for all G in Positive =>
              Equivalent (Is_GCD(A, B, G), Is_GCD(X, Y, G)));
         
         declare
            X_Prev : constant Natural := X with Ghost;
            Y_Prev : constant Natural := Y with Ghost;
         begin
            T := X;
            X := Y mod X;
            Y := T;
            
            pragma Assert
              (for all G in Positive =>
                 (if Equivalent (Is_GCD(A, B, G), Is_GCD(X_Prev, Y_Prev, G)) then
              Equivalent (Is_GCD(A, B, G), Is_GCD(X, Y, G))));
               
         end;
      end loop;
      
      pragma Assert (Y > 0);
      pragma Assert (Is_GCD (A, B, Y));
      
      return Y;
   end;
   
end GCD_Mod;
