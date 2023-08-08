with Integer_Matrices; use Integer_Matrices;

package Symop_Parser is
   
  -- Parse symmetry operation descriptions provided in the Jones
  --  faithful notation, as coordinates of a general position.
   
   function Parse_Symop (S : in String) return Integer_Matrix;
   
end Symop_Parser;
