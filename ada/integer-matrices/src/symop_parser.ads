with Symmetry_Operation; use Symmetry_Operation;

package Symop_Parser is
   
  -- Parse symmetry operation descriptions provided in the Jones
  --  faithful notation, as coordinates of a general position.
   
   function Parse_Symop (S : in String) return
     Symmetry_Operation.Symmetry_Operation;
   
end Symop_Parser;
