with Unities; use Unities;

package Ternary_Matrices with Spark_Mode is

   type Ternary_Matrix is 
     array (Integer range <>, Integer range <>) of Unity_Integers;
   
   function "*" (A, B : Ternary_Matrix) return Ternary_Matrix
     with
     Pre => A'First(2) = B'First(1) and A'Last(2) = B'Last(1);
   
end Ternary_Matrices;
