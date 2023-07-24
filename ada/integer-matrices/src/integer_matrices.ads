package Integer_Matrices is
   
   type Integer_Matrix is 
     array (Integer range <>, Integer range <>) of Integer;   
   
   function "*" (A, B : Integer_Matrix) return Integer_Matrix;
      
   procedure Put_Matrix (M : Integer_Matrix);
      
end;
