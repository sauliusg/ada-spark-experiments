with Ada.Command_Line;    use Ada.Command_Line;
with Text_IO; use Text_IO;
with GCD_Rec; use GCD_Rec;

procedure Run_GCD_Rec is
   I, J : Integer;
begin
   I := 15;
   J := 25;
   
   if Argument_Count >= 2 then
      I := Integer'Value (Argument(1));
      J := Integer'Value (Argument(2));
   end if;
   
   Put_Line (Integer'Image (I));
   Put_Line (Integer'Image (J));
   Put_Line (Integer'Image (GCD(I,J)));
end;
