with Unities; use Unities;

package Ternary_Matrices with Spark_Mode is

   type Ternary_Matrix is 
     array (Integer range <>, Integer range <>) of Unity_Integers;
   
   function "*" (A, B : Ternary_Matrix) return Ternary_Matrix;
   
end Ternary_Matrices;
