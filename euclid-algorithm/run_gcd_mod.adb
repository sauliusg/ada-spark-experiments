with Ada.Command_Line;    use Ada.Command_Line;
with Text_IO; use Text_IO;
with GCD_Mod;     use GCD_Mod;

procedure Run_GCD_Mod is
   I, J : Integer;
begin
   I := 15;
   J := 25;
   
   if Argument_Count >= 2 then
      I := Integer'Value (Argument(1));
      J := Integer'Value (Argument(2));
   end if;
   
   Put_Line(Integer'Image(I));
   Put_Line(Integer'Image(J));
   Put_Line(Integer'Image(GCD_Mod.GCD(I,J)));
end;
