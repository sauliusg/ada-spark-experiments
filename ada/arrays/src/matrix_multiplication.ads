generic 
   type Matrix_Element is private;
   Zero : Matrix_Element;
   with function "*" (X, Y : Matrix_Element) return Matrix_Element is <>;
   with function "+" (X, Y : Matrix_Element) return Matrix_Element is <>;
     
package Matrix_Multiplication is
   
     type Matrix is array (Integer range <>, Integer range <>) of Matrix_Element;
     
     procedure Multiply (M1, M2 : in Matrix; Result : out Matrix );
     
     function Product (M1, M2 : Matrix) return Matrix;
     
     function "*" (M1, M2 : Matrix) return Matrix with Inline;
   
end Matrix_Multiplication;
