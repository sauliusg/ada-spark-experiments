with Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Ada.Long_Float_Text_IO;
use Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Ada.Long_Float_Text_IO;

procedure Synthesis_Long_Float is
   
   X : Integer := 1;
   Y : Long_Float := 0.0;
   
   Z : Integer := 2**12;
   
begin
   
   while (X < Z) loop
      X := 2 * X;
      Y := Y / 2.0 + 1.0;
      Put_Line ("Y = " & Y'Image);
   end loop;
   
   Put_Line ("X = " & X'Image);
   Put_Line ("Y = " & Y'Image);
   Put_Line ("Z = " & Z'Image);
   New_Line;
   
   Put ((Y - 2.0) * Long_Float (Z) + 2.0);
   New_Line;
   New_Line;
   Put ((Integer (Y) - 2) * Z + 2);
   New_Line;
end;
