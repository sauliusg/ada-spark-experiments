package Integer_Matrices with Spark_Mode Is
   
   type Integer_Matrix is 
     array (Integer range <>, Integer range <>) of Integer;   
   
   function Trace (M : Integer_Matrix) return Integer;

   function Submatrix
     (
      M : Integer_Matrix;
      P, Q : Integer
     ) return Integer_Matrix;

   function Transpose (M : in Integer_Matrix) return Integer_Matrix;

   function "*" (A, B : Integer_Matrix) return Integer_Matrix
     with
     Pre => A'First(2) = B'First(1) and A'Last(2) = B'Last(1),
     Post => 
     ("*"'Result'First(1) = A'First(1) and "*"'Result'Last(1) = A'Last(1))
       and then
     ("*"'Result'First(2) = B'First(2) and "*"'Result'Last(2) = B'Last(2));
     
  function "+" (A, B : Integer_Matrix) return Integer_Matrix
    with
    Pre =>
      A'First(1) = B'First(1) and A'Last(1) = B'Last(1) and
      A'First(2) = B'First(2) and A'Last(2) = B'Last(2);
    
  function "-" (A, B : Integer_Matrix) return Integer_Matrix
    with
    Pre =>
      A'First(1) = B'First(1) and A'Last(1) = B'Last(1) and
      A'First(2) = B'First(2) and A'Last(2) = B'Last(2);
     
   procedure Put_Matrix (M : Integer_Matrix);
      
   procedure Put_Matrix_Line (M : Integer_Matrix);
      
end;
