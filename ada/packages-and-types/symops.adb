with Text_IO; use Text_IO;

package body Symops is
   
   pragma Inline (Put);
   
   procedure Put (S : Symop) is
   begin
      Put_Line ("Symmetry operator:");
      Put (Matrix (S));
   end;
   
end Symops;
