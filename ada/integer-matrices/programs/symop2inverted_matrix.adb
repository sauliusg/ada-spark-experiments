with Text_IO;            use Text_IO;
with Integer_Matrices;   use Integer_Matrices;
with Symmetry_Operation; use Symmetry_Operation;
with Symop_Parser;       use Symop_Parser;
with Ada.Command_Line;   use Ada.Command_Line;

procedure Symop2Inverted_Matrix is
begin
   for I in 1 .. Argument_Count loop
      Put (Inverse (Parse_Symop (Argument (I))));
      if I < Argument_Count then
         New_Line;
      end if;
   end loop;
end Symop2Inverted_Matrix;
