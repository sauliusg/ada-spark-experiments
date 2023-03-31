with Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Ada.Long_Float_Text_IO;
use Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Ada.Long_Float_Text_IO;

procedure Synthesis_Integer is
   
   X : Integer := 1;
   NY : Integer := 0; -- Numerator
   DY : Integer := 1; -- Denominator
   
   Z : Integer := 2**12;
   
begin
   
   while (X < Z) loop
      X := 2 * X;
      NY := NY + 2 * DY;
      DY := DY * 2;
      Put_Line ("Y = " & NY'Image & " /" & DY'Image);
   end loop;
   
   Put_Line ("X = " & X'Image);
   Put_Line ("Y = " & NY'Image & " /" & DY'Image);
   Put_Line ("Z = " & Z'Image);
   New_Line;
   
   Put (((NY - 2 * DY) * Z) / DY + 2);
   New_Line;
end;
