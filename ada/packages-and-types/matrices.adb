package body Matrices is
   
   function "*" (A, B : Matrix) return Matrix is
      R : Matrix (A'Range (1), B'Range (2));
   begin
      for I in A'Range (1) loop
         for J in B'Range (2) loop
            R (I, J) := 0.0;
            for K in A'Range (2) loop
               R (I, J) := R (I, J) + A (I, K) * B (K, J);
            end loop;
         end loop;
      end loop;
      return R;
   end;

end Matrices;
