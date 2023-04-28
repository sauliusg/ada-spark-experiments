with Text_IO;          use Text_IO;
with Ada.Strings.Maps; use Ada.Strings.Maps;

package body Symops is
   
   pragma Inline (Put);
   
   procedure Put (S : Symop) is
   begin
      Put_Line ("Symmetry operator:");
      Put (Matrix (S));
   end;
   
   procedure Parse (Text : in String; S : out Symop) is separate;
   
end Symops;
