pragma Ada_2022;

package body GCD with Spark_Mode Is
   
   function GCD (A, B : in Positive) return Positive
   is
      X, Y : Positive;
   begin
      X := A;
      Y := B;
      
      --  This is an important assumption, without it the 'gnatprove'
      --  can not prove the postcondition, and can not prove the
      --  assumption itself without a hint:      
      pragma Assume (for all U in Positive =>
                       (for all V in Positive =>
                          (for all D in Positive =>
                             (if U >= D then 
                                (U mod D - V mod D) mod D = (U - V) mod D))));
      
      --  We need to state the every number is a divisor of itself,
      --  'gnatprove' can not figure it out herself:
      pragma Assert (for all N in Positive => Is_Divisor (N, N));
      
      pragma Assert
        (for all N in Positive =>
           (for all M in N .. Positive'Last =>
              (for all G in Positive =>
                 (if M > N then
        (if Is_GCD(M, N, G) then Is_GCD((M - N), N, G))))));
      
      pragma Assert
        (for all N in Positive =>
           (for all M in N .. Positive'Last =>
              (for all G in Positive =>
                 (if M > N then
        (if Is_GCD((M - N), N, G) then Is_GCD(M, N, G))))));
      
      while X /= Y loop
         
         pragma Loop_Invariant
           (for all G in Positive =>
              Equivalent (Is_GCD(A, B, G), Is_GCD(X, Y, G)));
         
         pragma Loop_Invariant (X > 0 and Y > 0);
         
         pragma Loop_Invariant (for all N in Positive => 
                                  (if Is_GCD (A, B, N) then 
                                      Is_GCD (X, Y, N))
                               );
         
         if X > Y then
            
            declare
               X_Prev : constant Positive := X with Ghost;
               Y_Prev : constant Positive := Y with Ghost;
            begin
               X := X - Y;
            
               pragma Assert
                 (for all G in Positive =>
                    (if Equivalent (Is_GCD(A, B, G), Is_GCD(X_Prev, Y_Prev, G)) then
                 Equivalent (Is_GCD(A, B, G), Is_GCD(X, Y, G))));
               
            end;
         
         else
            pragma Assert (X < Y);
            
            pragma Assert
              (for all G in Positive =>
                 (if Is_GCD(X, (Y - X), G) then Is_GCD(X, Y, G)));
            
            pragma Assert
              (for all G in Positive =>
                 (if Is_GCD(X, Y, G) then Is_GCD(X, (Y - X), G)));
            
            pragma Assert
              (for all G in Positive =>
                 Equivalent (Is_GCD(X, (Y - X), G), Is_GCD(X, Y, G)));
            
            declare
               X_Prev : constant Positive := X with Ghost;
               Y_Prev : constant Positive := Y with Ghost;
            begin
               Y := Y - X;
               
               pragma Assert
                 (for all G in Positive =>
                    (if Equivalent (Is_GCD(A, B, G), Is_GCD(X_Prev, Y_Prev, G)) then
                 Equivalent (Is_GCD(A, B, G), Is_GCD(X, Y, G))));
         
            end;
         end if;
         
      end loop;
      
      --  The following two assertions are not necessary to prove the
      --  postcondition, 'gnatprove' figures them out automatically,
      --  but IMHO they clarify the logic of the proof, so I retain
      --  them:
      pragma Assert (X > 0);
      pragma Assert (X = Y);
      
      --  The following two assertions are essential to prove the
      --  postcondition:
      pragma Assert (Is_GCD (X, X, X));
      pragma Assert (Is_GCD (A, B, X));
      
      return X;
   end;
   
end GCD;
