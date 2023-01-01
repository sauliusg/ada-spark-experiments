with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Floats is
   
   X : Float := 1.0;
   Y : Float := 0.0;
   
begin
   
   Put ("X = "); Put (X); Put (" Y = "); Put (Y);
   New_Line;
   
   Put ("X/Y = "); Put (X/Y);
   New_Line;
   
end Floats;
