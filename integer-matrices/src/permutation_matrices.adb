pragma Ada_2022;

package body Permutation_Matrices is
   
   function Length (P : Permutation_Matrix) return Positive is
   begin
      return P.A'Length (1);
   end;

   function Unity (N : Positive) return Permutation_Matrix is
      P : Permutation_Matrix (N) := 
        (
         N => N, 
         A => (for I in 1 .. N => (for J in 1 .. N => (if I = J then 1 else 0)))
        );
   begin
      return P;
   end;
   
   function "*" (P1, P2 : Permutation_Matrix) return Permutation_Matrix is
      R : Permutation_Matrix := P1;
   begin
      for I in R.A'Range(1) loop
         for J in R.A'Range(2) loop
            R.A (I,J) := 0;
            for K in P1.A'Range(2) loop
               R.A (I,J) := R.A (I,J) + P1.A (I,K) * P2.A (K,J);
            end loop;
         end loop;
      end loop;
      return R;
   end;
   
   function Each_Row_Has_Single_Unity (A : Permutation_Matrix_Array) return Boolean 
   is
      (for all I in A'Range(1) =>
         (
          (for all J in A'Range(2) =>
             (if A(I,J) = 1 then (for all K in A'Range(2) => J = K or else A(I,K) = 0))
          ) and then
        (
         for some J in A'Range(2) => A(I,J) = 1
        )
         )
      );
   
   function Each_Column_Has_Single_Unity (A : Permutation_Matrix_Array) return Boolean 
   is
      (for all I in A'Range(2) =>
         (for all J in A'Range(1) =>
            (if A(I,J) = 1 then (for all K in A'Range(1) => I = K or else A(K,J) = 0))
         )
      );
   
   function Each_Row_Has_Single_Unity (P : Permutation_Matrix) return Boolean is
      type Sum_Array is array (1 .. P.N) of Natural;
      Sum : Sum_Array := (others => 0);
   begin
      for I in P.A'Range(1) loop
         for J in P.A'Range(2) loop
            Sum (I) := Sum (I) + Natural (P.A (I,J));
         end loop;
      end loop;
      return (for all S of Sum => S = 1);
   end;
   
   function Each_Column_Has_Single_Unity (P : Permutation_Matrix) return Boolean is
      type Sum_Array is array (1 .. P.N) of Natural;
      Sum : Sum_Array := (others => 0);
   begin
      for I in P.A'Range(2) loop
         for J in P.A'Range(1) loop
            Sum (I) := Sum (I) + Natural (P.A (I,J));
         end loop;
      end loop;
      return (for all S of Sum => S = 1);
   end;
   
   procedure Unity_Permutation_Is_Idempotent (U : Permutation_Matrix) is null;
   
end Permutation_Matrices;
