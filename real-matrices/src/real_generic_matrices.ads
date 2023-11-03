generic
   type Real is digits <>;

package Real_Generic_Matrices with Spark_Mode Is
   
   type Real_Matrix is 
     array (Integer range <>, Integer range <>) of Real;
   
   function Trace (M : Real_Matrix) return Real;

   function Submatrix
     (
      M : Real_Matrix;
      P, Q : Integer
     ) return Real_Matrix;

   function Transpose (M : in Real_Matrix) return Real_Matrix;

   function "*" (A, B : Real_Matrix) return Real_Matrix
     with
     Pre => (A'First(2) = B'First(1) and then A'Last(2) = B'Last(1)) or else
       raise CONSTRAINT_ERROR with
         "Matrices for multiplication have incompatible structure",
     
     Post => 
       ("*"'Result'First(1) = A'First(1) and then "*"'Result'Last(1) = A'Last(1))
         and then
       ("*"'Result'First(2) = B'First(2) and then "*"'Result'Last(2) = B'Last(2));
     
  function "+" (A, B : Real_Matrix) return Real_Matrix
    with
    Pre =>
      ((A'First(1) = B'First(1) and then A'Last(1) = B'Last(1)) or else
        raise CONSTRAINT_ERROR with
          "Matrices for addition must have the same number of rows")
        and then
      ((A'First(2) = B'First(2) and then A'Last(2) = B'Last(2)) or else
        raise CONSTRAINT_ERROR with
          "Matrices for addition must have the same number of columns");


  function "-" (A, B : Real_Matrix) return Real_Matrix
    with    
    Pre =>
      ((A'First(1) = B'First(1) and then A'Last(1) = B'Last(1)) or else
        raise CONSTRAINT_ERROR with
          "Matrices for subtraction must have the same number of rows")
        and then
      ((A'First(2) = B'First(2) and then A'Last(2) = B'Last(2)) or else
        raise CONSTRAINT_ERROR with
           "Matrices for subtraction must have the same number of columns");
     
   procedure Put_Matrix (M : Real_Matrix);
      
   procedure Put_Matrix_Line (M : Real_Matrix);
      
end;
