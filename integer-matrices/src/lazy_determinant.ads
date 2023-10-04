with Integer_Matrices; use Integer_Matrices;

package Lazy_Determinant with Spark_Mode Is
   
   function Det (M : Integer_Matrix) return Integer
     with
     Pre => M'Length(1) = M'Length(2);
   
private
   
   function Det2 (M : Integer_Matrix) return Integer
     with
     Pre =>
     M'Length(1) = 2 and M'Length(2) = 2 and
       M'First(1) = 1 and M'First(2) = 1
     ;
      
   function Det3 (M : Integer_Matrix) return Integer
     with
     Pre =>
     M'Length(1) = 3 and M'Length(2) = 3 and
       M'First(1) = 1 and M'First(2) = 1
     ;

end;
