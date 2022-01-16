pragma Ada_2022;

with Ada.Numerics.Big_Numbers.Big_Integers;
use  Ada.Numerics.Big_Numbers.Big_Integers;

package body GCD with Spark_Mode Is
   
   function Is_GCD (A, B, D : in Positive) return Boolean
   is 
      (Is_Divisor (A, D) and then
         Is_Divisor (B, D) and then
         (for all D1 in D .. Positive'Last =>
            D = D1 or else
            (not Is_Divisor (A, D1)) or else
            (not Is_Divisor (B, D1))))
        with
        Ghost,
        Pre => A > 0 and then B > 0 and then D > 0,
        Post =>
        Is_GCD'Result = 
          (Is_Divisor (A, D) and then
             Is_Divisor (B, D) and then
             (for all D1 in D .. Positive'Last =>
                D = D1 or else
                (not Is_Divisor (A, D1)) or else
                (not Is_Divisor (B, D1))))
          ;
   
   function Is_Common_Divisor (A, B, D : in Positive) return Boolean
   is 
      (Is_Divisor (A, D) and then Is_Divisor (B, D))
        with
        Ghost,
        Pre => A > 0 and then B > 0 and then D > 0,
        Post =>
        Is_Common_Divisor'Result = (Is_Divisor (A, D) and then Is_Divisor (B, D));
   
   function GCD (A, B : in Positive) return Positive
   is
      X, Y : Positive;
   begin
      X := A;
      Y := B;
      
      pragma Assume (for all N in Positive => Is_Divisor (N, N));
      
      pragma Assume (for all U in Positive =>
                       (for all V in Positive =>
                          (for all D in Positive =>
                             (if U >= D then 
                                (U mod D - V mod D) mod D = (U - V) mod D))));
      
      pragma Assert
        (for all G in Positive =>
           (Is_GCD(A, B, G) and then Is_GCD(X, Y, G)) or else
           (not Is_GCD(A, B, G) and then not Is_GCD(X, Y, G)));
      
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
         
         -- pragma Loop_Invariant
         --   (for all G in Positive =>
         --      (Is_GCD(A, B, G) and then Is_GCD(X, Y, G)) or else
         --      (not Is_GCD(A, B, G) and then not Is_GCD(X, Y, G)));
         
         pragma Loop_Invariant (X > 0 and Y > 0);
         
         -- pragma Loop_Invariant (for all N in Positive => 
         --                          (if Is_GCD (A, B, N) then 
         --                              Is_GCD (X, Y, N))
         --                       );
         
         pragma Loop_Invariant (for all N in Positive => 
                                  (if Is_Common_Divisor (A, B, N) then 
                                      Is_Common_Divisor (X, Y, N))
                               );
      
         -- pragma Loop_Invariant (for all N in Positive => 
         --                          (if Is_Common_Divisor (X, Y, N) then 
         --                              Is_Common_Divisor (A, B, N))
         --                       );
      
         pragma Loop_Invariant
           (for all N in Positive => 
              (if Is_Common_Divisor (X, Y, N) then
           (X > Y and then Is_Common_Divisor ((X - Y), Y, N)) or else
           (X < Y and then Is_Common_Divisor ((Y - X), Y, N)))
           );
         
         pragma Loop_Invariant
           (for all N in Positive => 
              (if (X > Y and then Is_Common_Divisor ((X - Y), Y, N)) or else
                 (X < Y and then Is_Common_Divisor ((Y - X), Y, N)) then
           Is_Common_Divisor (X, Y, N)));
         
         if X > Y then
            pragma Assert
              (for all G in Positive =>
                 (Is_GCD((X - Y), Y, G) and then Is_GCD(X, Y, G)) or else
                 (not Is_GCD((X - Y), Y, G) and then not Is_GCD(X, Y, G)));
         
            X := X - Y;
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
                 (Is_GCD(X, (Y - X), G) and then Is_GCD(X, Y, G)) or else
                 (not Is_GCD(X, (Y - X), G) and then not Is_GCD(X, Y, G)));
            
            Y := Y - X;
         end if;
         
         pragma Assert (for all N in Positive => 
                          (if Is_Common_Divisor (A, B, N) then
                              Is_Common_Divisor (X, Y, N))
                       );
         -- pragma Assert (for all N in Positive => 
         --                  (if Is_Common_Divisor (X, Y, N) then
         --                      Is_Common_Divisor (A, B, N))
         --               );
      end loop;
      
      pragma Assert (for all N in Positive => 
                       (if Is_Common_Divisor (A, B, N) then
                           Is_Common_Divisor (X, Y, N))
                    );
      
      pragma Assert (X > 0);
      pragma Assert (X = Y);
      pragma Assert (Is_Divisor (X, X));
      pragma Assert (Is_Divisor (Y, X));
      pragma Assert (Is_Common_Divisor (X, Y, X));
      pragma Assert (Is_Common_Divisor (X, X, X));
      pragma Assert (Is_Common_Divisor (A, B, X));
      
      return X;
   end;
   
end GCD;
