pragma Ada_2022;

package body GCD_Mod with Spark_Mode Is
   
   function GCD (A, B : in Positive) return Positive
   is
      X, Y, T : Natural;
   begin
      X := A;
      Y := B;
      
      pragma Assert
        (for all N in Positive => 0 mod N = 0);
           
      pragma Assert
        (for all N in Positive => Is_Divisor (0, N));
           
      pragma Assert
        (for all N in Positive => Is_GCD (0, N, N));
           
      pragma Assert
        (for all N in Positive =>
           (for all D in Positive =>
              (if N = D then Is_GCD (0, N, D))
           ));
      
      pragma Assert
        (for all N in Positive =>
           (for all M in Natural =>
              (for all D in Positive =>
                 (if Is_GCD(M, N, D) then 
                     Is_Divisor (M, D) and Is_Divisor (N, D)
                 ))));
                 
      pragma Assert
        (for all N in Positive =>
           (for all D in Positive =>
              (if Is_GCD (0, N, D) then Is_Divisor (N, D))
           ));
      
      pragma Assert
        (for all N in Natural =>
           (for all D in Positive =>
              (if N < D then N mod D = N)
           ));
      
      pragma Assert
        (for all N in Positive => Is_GCD (N, N, N));
      
      pragma Assert
        (for all N in Positive =>
           (for all D in Positive =>
              (if Is_GCD (1, N, D) then D = 1)
           ));
      
      pragma Assert
        (for all N in Positive =>
           (for all D in Positive =>
              (if Is_GCD (0, N, D) then Is_Divisor (N, D))
           ));
      
      pragma Assert
        (for all N in Positive =>
           (for all D in Positive =>
              (if Is_GCD (0, N, D) then Is_GCD (N, N, D))
           ));
      
      pragma Assert
        (for all N in Positive =>
           (for all D in Positive =>
              (if Is_GCD (N, N, D) then D = N)
           ));
      
      pragma Assert
        (for all N in Positive =>
           (for all D in Positive =>
              (if Is_GCD (0, N, D) then D = N)
           ));
      
      pragma Assert
        (for all M in Positive =>
           (for all N in Positive =>
              (for all D in Positive =>
                 Equivalent (Is_GCD (M, N, D), Is_GCD (N mod M, M, D)) )));
      
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
              X = 0 or else Equivalent (Is_GCD(A, B, G), Is_GCD(X, Y, G))));
               
         end;
      end loop;
      
      pragma Assert (Y > 0);
      pragma Assert (Is_GCD (A, B, Y));
      
      return Y;
   end;
   
end GCD_Mod;
