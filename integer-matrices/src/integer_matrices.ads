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
     
     Pre => (A'First(2) = B'First(1) and then A'Last(2) = B'Last(1)) or else
       raise CONSTRAINT_ERROR with
         "Matrices for multiplication have incompatible structure",
     
     Post => 
       ("*"'Result'First(1) = A'First(1) and then "*"'Result'Last(1) = A'Last(1))
         and then
       ("*"'Result'First(2) = B'First(2) and then "*"'Result'Last(2) = B'Last(2));
     
  function "+" (A, B : Integer_Matrix) return Integer_Matrix
    with
    
    Pre =>
      ((A'First(1) = B'First(1) and then A'Last(1) = B'Last(1)) or else
        raise CONSTRAINT_ERROR with
          "Matrices for addition must have the same number of rows")
        and then
      ((A'First(2) = B'First(2) and then A'Last(2) = B'Last(2)) or else
        raise CONSTRAINT_ERROR with
          "Matrices for addition must have the same number of columns");


  function "-" (A, B : Integer_Matrix) return Integer_Matrix
    with
    
    Pre =>
      ((A'First(1) = B'First(1) and then A'Last(1) = B'Last(1)) or else
        raise CONSTRAINT_ERROR with
          "Matrices for subtraction must have the same number of rows")
        and then
      ((A'First(2) = B'First(2) and then A'Last(2) = B'Last(2)) or else
        raise CONSTRAINT_ERROR with
           "Matrices for subtraction must have the same number of columns");
     
   procedure Put_Matrix (M : Integer_Matrix);
      
   procedure Put_Matrix_Line (M : Integer_Matrix);
      
end;
