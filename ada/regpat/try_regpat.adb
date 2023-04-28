with Ada.Text_IO; use Ada.Text_IO;
with GNAT.Regpat; use GNAT.Regpat;

procedure Try_Regpat is
   
   P : String := "^[-+][0-9]+$";
   R : Pattern_Matcher := Compile (P);
   
   S1 : String := "+3471";
   S2 : String := "+34.71";
   
begin
   
   if Match (R, S1) then
      Put_Line (S1 & " matches """ & P & """");
   end if;
   
   if not Match (R, S2) then
      Put_Line (S2 & " does not match """ & P & """");
   end if;
   
   if Match (Compile ("[-+]\d+\.\d+"), S2) then
      Put_Line (S2 & " matches number regexp");
   end if;
   
end;
