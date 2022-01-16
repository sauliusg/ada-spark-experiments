with Ada.Command_Line;    use Ada.Command_Line;
with Text_IO; use Text_IO;
with GCD_Mod;     use GCD_Mod;

procedure Run_Mod is
   I, J : Integer;
begin
   I := 15;
   
   if Argument_Count >= 1 then
      I := Integer'Value (Argument(1));
   end if;
   
   J := 0 mod I;
   
   Put_Line(Integer'Image(I));
   Put_Line(Integer'Image(J));
end;
