package Matrices is
   
   type Matrix is array (Integer range <>, Integer range <>) of Float;
   
   function "*" (A, B : Matrix) return Matrix;
   
end Matrices;
