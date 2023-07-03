with Unities; use Unities;

package Ternary_Matrices with Spark_Mode is

   type Ternary_Matrix is 
     array (Integer range <>, Integer range <>) of Unity_Integers;
   
   function "*" (A, B : Ternary_Matrix) return Ternary_Matrix
     with
     Pre => A'First(2) = B'First(1) and A'Last(2) = B'Last(1),
     Post => 
     ("*"'Result'First(1) = A'First(1) and "*"'Result'Last(1) = A'Last(1))
       and then
     ("*"'Result'First(2) = B'First(2) and "*"'Result'Last(2) = B'Last(2));
   
end Ternary_Matrices;
