generic 
   type Matrix_Element is range <>;
     
package Matrix_Multiplication is
   
     type Matrix is array (Integer range <>, Integer range <> ) of Matrix_Element;
     
     procedure Multiply (M1, M2 : in Matrix; Result : out Matrix );
     
     -- function "*" (M1, M2 : Matrix) return Matrix;
   
end Matrix_Multiplication;
