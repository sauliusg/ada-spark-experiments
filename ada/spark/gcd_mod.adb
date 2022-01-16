pragma Ada_2022;

package body GCD_Mod with Spark_Mode Is
   
   function GCD (A, B : in Positive) return Positive
   is
      X, Y, T : Natural;
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
                     (if Is_GCD(M, N, G) then Is_GCD((M - N), N, G)) and then
                     (if Is_GCD((M - N), N, G) then Is_GCD(M, N, G))
                 ))));
      
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
