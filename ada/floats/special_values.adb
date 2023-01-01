with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

with Ada.Numerics.Generic_Elementary_Functions;

procedure Special_Values is
   
   X : Float :=  1.0;
   Y : Float :=  0.0;
   Z : Float := -1.0;
   
   package Math is new Ada.Numerics.Generic_Elementary_Functions (Float);
   use Math;
   
begin
   
   Put ("X = "); Put (X); Put (" ");
   Put ("Y = "); Put (Y); Put (" ");
   Put ("Z = "); Put (Z);
   New_Line;
   
   Put ("X/Y = "); Put (X/Y);
   New_Line;
   
   Put ("Sqrt (Z) = "); Put (Sqrt (Z));
   New_Line;
   
end Special_Values;
