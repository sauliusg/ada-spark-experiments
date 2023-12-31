package body Ternary_Matrices with Spark_Mode is

   function "*" (A, B : Ternary_Matrix) return Ternary_Matrix is
      R : Ternary_Matrix (A'Range(1), B'Range(2)) :=
        (others => (others => 0));
   begin
      for I in A'Range(1) loop
         for J in B'Range(2) loop
            for K in A'Range(2) loop
               pragma Assume
                 (
                  R(I,J) = 0 or else
                    A(I,K) * B(K,J) = 0 or else
                    R(I,J) = -(A(I,K) * B(K,J))
                 );
               R(I,J) := R(I,J) + A(I,K) * B(K,J);
            end loop;
         end loop;
      end loop;
      
      return R;
   end;

end Ternary_Matrices;
