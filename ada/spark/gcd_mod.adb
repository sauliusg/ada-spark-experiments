pragma Ada_2022;

package body GCD_Mod with Spark_Mode Is
   
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
      X, Y, T : Natural;
   begin
      X := A;
      Y := B;
      
      while X > 0 loop
         pragma Loop_Invariant (for all N in Positive => 
                                  (if Is_Common_Divisor (X, Y, N) then 
                                      Is_Common_Divisor (A, B, N))
                               );
         T := X;
         X := Y mod X;
         Y := T;
      end loop;
      
      pragma Assert (Y > 0);
      pragma Assert (Is_Common_Divisor (A, B, Y));
      
      return Y;
   end;
   
end GCD_Mod;
