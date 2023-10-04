with Integer_Matrices; use Integer_Matrices;

package Lazy_Check_TU Is
   
   -- Check if the matrix is total unimodular in a naive way, but
   --  checking all sub-determinants.
   
   function Is_Total_Unimodular (A : Integer_Matrix) return Boolean;
   
end;
