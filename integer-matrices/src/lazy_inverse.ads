with Integer_Matrices; use Integer_Matrices;

package Lazy_Inverse with Spark_Mode Is
   
   function Inverse (M : Integer_Matrix) return Integer_Matrix
     with
     Pre => M'Length(1) = M'Length(2);
   
end;
