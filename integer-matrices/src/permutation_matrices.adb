pragma Ada_2022;

package body Permutation_Matrices with SPARK_Mode is
   
   function Length (P : Permutation_Matrix) return Positive is
   begin
      return P.A'Length (1);
   end;

   function Unity (N : Positive) return Permutation_Matrix_Array is
      (for I in 1 .. N =>
         (for J in 1 .. N => 
            (if I = J then 1 else 0))
      );
   
   function Unity (N : Positive) return Permutation_Matrix is
   begin
      return (N, A => Unity (N));
   end;
   
--   function "*" (P1, P2 : Permutation_Matrix) return Permutation_Matrix is
--      R : Permutation_Matrix := P1;
--   begin
--      for I in R.A'Range(1) loop
--         for J in R.A'Range(2) loop
--            R.A (I,J) := 0;
--            for K in P1.A'Range(2) loop
--               R.A (I,J) := R.A (I,J) + P1.A (I,K) * P2.A (K,J);
--            end loop;
--         end loop;
--      end loop;
--      return R;
--   end;
   
   function Each_Row_Has_Unity (A : Permutation_Matrix_Array) return Boolean
   is
      (for all I in A'Range(1) =>
         (for some J in A'Range(2) => A(I,J) = 1));
   
   function Each_Column_Has_Unity (A : Permutation_Matrix_Array) return Boolean
   is
      (for all J in A'Range(2) =>
         (for some I in A'Range(1) => A(I,J) = 1));
   
   function Each_Row_Has_At_Most_One_Unity (A : Permutation_Matrix_Array) return Boolean 
   is
      (for all I in A'Range(1) =>
         (for all J in A'Range(2) =>
            (if A(I,J) = 1 then (for all K in A'Range(2) => J = K or else A(I,K) = 0))
         )
      );
   
   function Each_Column_Has_At_Most_One_Unity (A : Permutation_Matrix_Array) return Boolean 
   is
      (for all J in A'Range(2) =>
         (for all I in A'Range(1) =>
            (if A(I,J) = 1 then (for all K in A'Range(1) => I = K or else A(K,J) = 0))
         )
      );
      
   procedure Unity_Permutation_Is_Idempotent (U : Permutation_Matrix) is null;
   
end Permutation_Matrices;
