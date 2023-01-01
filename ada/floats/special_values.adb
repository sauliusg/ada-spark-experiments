pragma Ada_2022;

with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

with Ada.Numerics.Complex_Elementary_Functions;
use Ada.Numerics.Complex_Elementary_Functions;

with Ada.Numerics.Complex_Types;
use Ada.Numerics.Complex_Types;

procedure Special_Values is
   
   X : Float :=  1.0;
   Y : Float :=  0.0;
   Z : Float := -1.0;
   T, U : Float;
   
   procedure Put_Separator with Inline is
   begin
      -- Put ("; ");
      New_Line;
   end;
   
begin
   
   Put ("X = "); Put (X); Put_Separator;
   Put ("Y = "); Put (Y); Put_Separator;
   Put ("Z = "); Put (Z);
   New_Line;
   
   Put ("X/Y = "); Put (X/Y);
   New_Line;
   
   Put ("Sqrt (X) = "); Put (Sqrt (X));
   New_Line;
   New_Line;
   
   T := -X/Y;
   U := X/Y;
   
   Put ("T = "); Put (T); Put_Separator;
   Put ("U = "); Put (U);
   New_Line;
   Put ("T/U = "); Put (T/U);
   New_Line;
   New_Line;
   
   Put ("Z = "); Put (Z);
   New_Line;
   Put ("Sqrt (Z) = "); Put (Sqrt ((Z, 0.0))'Image);
   New_Line;
   
end Special_Values;
