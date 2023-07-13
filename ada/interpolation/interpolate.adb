pragma Ada_2022;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Interpolate is
   I : Integer := 21;
   S : String := "Hi, Ada!";
begin
   Put_Line ("the string is " & S'Image & " and the value is " & I'Image);
   -- Not yet implemented in FSF gcc 12:
   -- Put_Line (f"the string is {S} and the value is {I}");
end;
