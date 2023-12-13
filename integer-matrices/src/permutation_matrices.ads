pragma Ada_2022;

package Permutation_Matrices with SPARK_Mode is
   
   type One_Or_Zero is range 0 .. 1;
   
   type Permutation_Matrix (N : Positive) is private;
   
   function Length (P : Permutation_Matrix) return Positive;
   
   function Unity (N : Positive) return Permutation_Matrix;
   
   -- function "*" (P1, P2 : Permutation_Matrix) return Permutation_Matrix;
   
   -- Lemma:
     
   -- procedure Unity_Permutation_Is_Idempotent (U : Permutation_Matrix)
   --   with
   --   Ghost,
   --   Post => (U * U = U);
     
private
   
   type Permutation_Matrix_Array is array (Positive range <>, Positive range <>) of One_Or_Zero;
   
   pragma Pack (Permutation_Matrix_Array);
   
   function Unity (N : Positive) return Permutation_Matrix_Array
     with
     Post => Is_Permutation_Matrix (Unity'Result);
   
   type Permutation_Matrix (N : Positive) is record
      A : Permutation_Matrix_Array (1 .. N, 1 .. N) := Unity (N);
   end record
     with Type_Invariant => Is_Permutation_Matrix (Permutation_Matrix);
 
   function Each_Row_Has_Unity (A : Permutation_Matrix_Array) return Boolean
     with Ghost;
     
   function Each_Column_Has_Unity (A : Permutation_Matrix_Array) return Boolean
     with Ghost;
     
   function Each_Row_Has_At_Most_One_Unity (A : Permutation_Matrix_Array) return Boolean
     with Ghost;
   
   function Each_Column_Has_At_Most_One_Unity (A : Permutation_Matrix_Array) return Boolean
     with Ghost;
   
   function Each_Row_Has_One_Unity (A : Permutation_Matrix_Array) return Boolean is
      (Each_Row_Has_Unity (A) and then Each_Row_Has_At_Most_One_Unity (A))
        with Ghost;
   
   function Each_Column_Has_One_Unity (A : Permutation_Matrix_Array) return Boolean is
      (Each_Column_Has_Unity (A) and then Each_Column_Has_At_Most_One_Unity (A))
        with Ghost;
   
   function Is_Permutation_Matrix (A : Permutation_Matrix_Array) return Boolean is
      (Each_Row_Has_One_Unity (A) and then Each_Column_Has_One_Unity (A))
        with Ghost;

   function Is_Permutation_Matrix (P : Permutation_Matrix) return Boolean is
      (Is_Permutation_Matrix (P.A))
        with Ghost;
     
end Permutation_Matrices;
