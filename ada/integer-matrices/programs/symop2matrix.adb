with Integer_Matrices;   use Integer_Matrices;
with Symmetry_Operation; use Symmetry_Operation;
with Symop_Parser;       use Symop_Parser;
with Ada.Command_Line;   use Ada.Command_Line;

procedure Symop2matrix is
begin
   for I in 1 .. Argument_Count loop
      Put (Parse_Symop (Argument (I)));
   end loop;
end Symop2matrix;
