with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Nested is
   A : Integer := 1;
begin
   declare
      A : Integer := Nested.A + 2;
   begin
      declare
         A : Integer := Nested.A + 3;
      begin
         Put_Line ("Innermost:");
         Put (A);
         New_Line;
      end;
      Put (A);
      New_Line;
   end;
   Put (A);
   New_Line;
end Nested;
