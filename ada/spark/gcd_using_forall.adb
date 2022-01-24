pragma Ada_2022;

package body GCD_Using_Forall with Spark_Mode Is
   
   function GCD (A, B : in Positive) return Positive
   is
      X, Y : Positive;
   begin
      X := A;
      Y := B;
      
      --  We need to state the every number is a divisor of itself,
      --  'gnatprove' can not figure it out herself:
      pragma Assert (for all N in Positive => Is_Divisor (N, N));

      pragma Assert
        (for all M in Positive =>
           (for all D in Positive =>
              (if Is_Divisor (M, D)
                 then M mod D = 0)));
                 
      pragma Assert
        (for all N in Positive =>
           (for all M in N .. Positive'Last =>
              (for all G in Positive =>
                 (if M > N then
                     (if Is_Common_Divisor(M, N, G) then Is_Common_Divisor((M - N), N, G)) and then
                     (if Is_Common_Divisor((M - N), N, G) then Is_Common_Divisor(M, N, G))
                 ))));
      
      pragma Assert
        (for all N in Positive =>
           (for all M in N .. Positive'Last =>
              (for all G in Positive =>
                 (if M > N then
                     (if Is_GCD(M, N, G) then Is_GCD((M - N), N, G)) and then
                     (if Is_GCD((M - N), N, G) then Is_GCD(M, N, G))
                 ))));
      
      while X /= Y loop
         
         pragma Loop_Invariant
           (for all G in Positive =>
              Equivalent (Is_GCD(A, B, G), Is_GCD(X, Y, G)));
         
         declare
            X_Prev : constant Positive := X with Ghost;
            Y_Prev : constant Positive := Y with Ghost;
         begin
               
            if X > Y then
            
               X := X - Y;
            
               pragma Assert
                 (for all G in Positive =>
                    (if Equivalent (Is_GCD(A, B, G), Is_GCD(X_Prev, Y_Prev, G)) then
                 Equivalent (Is_GCD(A, B, G), Is_GCD(X, Y, G))));
               
            else
               pragma Assert
                 (for all G in Positive =>
                    (if Is_GCD(X, Y, G) then Is_GCD(X, (Y - X), G)));
            
               Y := Y - X;
               
               pragma Assert
                 (for all G in Positive =>
                    (if Equivalent (Is_GCD(A, B, G), Is_GCD(X_Prev, Y_Prev, G)) then
                 Equivalent (Is_GCD(A, B, G), Is_GCD(X, Y, G))));
          
            end if;
            
         end;
         
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
   
end GCD_Using_Forall;
