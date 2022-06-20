with Text_IO; use Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Floats is
   
   X : Float := -1.27;
   
begin
   
   Put (X);
   New_Line;
   
   Put (Float'Remainder (X,1.0));
   New_Line;
   
   Put (X - Float'Floor (X));
   New_Line;
   
end Floats;
