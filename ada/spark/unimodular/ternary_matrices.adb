package body Ternary_Matrices with Spark_Mode is

   function "*" (A, B : Ternary_Matrix) return Ternary_Matrix is
      R : Ternary_Matrix (A'Range(1), A'Range(2));
   begin
      for I in A'Range(1) loop
         for J in A'Range(2) loop
            R(I,J) := 0;
            for K in A'Range(1) loop
               R(I,J) := R(I,J) + A(I,K) * B(K,J);
            end loop;
         end loop;
      end loop;
      
      return R;
   end;

end Ternary_Matrices;
