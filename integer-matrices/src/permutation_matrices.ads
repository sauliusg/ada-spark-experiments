pragma Ada_2022;

package Permutation_Matrices with SPARK_Mode is
   
   type One_Or_Zero is range 0 .. 1;
   
   type Permutation_Matrix (N : Positive) is private;
   
   function Length (P : Permutation_Matrix) return Positive;
   
   function Unity (N : Positive) return Permutation_Matrix;
   
   function "*" (P1, P2 : Permutation_Matrix) return Permutation_Matrix;
   
   -- Lemma
     
   procedure Unity_Permutation_Is_Idempotent (U : Permutation_Matrix)
     with
     Ghost,
     Post => (U * U = U);
     
private
   
   type Permutation_Matrix_Array is array (Positive range <>, Positive range <>) of One_Or_Zero;
   
   pragma Pack (Permutation_Matrix_Array);
   
   type Permutation_Matrix (N : Positive) is record
      A : Permutation_Matrix_Array (1 .. N, 1 .. N); -- :=
      -- [for I in 1 .. N => (for J in 1 .. N => 0)];
   end record
     with Type_Invariant => Is_Permutation_Matrix (Permutation_Matrix);
      
   function Each_Row_Has_Single_Unity (A : Permutation_Matrix_Array) return Boolean
     with Ghost;
   
   function Each_Row_Has_Single_Unity (P : Permutation_Matrix) return Boolean
     with Ghost;
   
   function Each_Column_Has_Single_Unity (P : Permutation_Matrix) return Boolean
     with Ghost;
   
   -- function Is_Permutation_Matrix (P : Permutation_Matrix) return Boolean is
   --   (Each_Row_Has_Single_Unity (P) and then Each_Column_Has_Single_Unity (P))
   --   with Ghost;
     
   function Is_Permutation_Matrix (P : Permutation_Matrix) return Boolean is
     (Each_Row_Has_Single_Unity (P.A))
     with Ghost;
     
end Permutation_Matrices;
