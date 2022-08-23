with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 

procedure Main is
   
   procedure Swap (X, Y : in out Integer) is separate;
   
   procedure Init (X : out Integer) is
   begin
      X := 43;
   end;
   
   A : Integer := 12;
   B : Integer := 42;
   C : Integer;
   
begin
   Init (X => C);
   
   Put ("A = "); Put (A); New_Line;
   Put ("B = "); Put (B); New_Line;
   
   New_Line;
   
   Swap ( A, B );
   Swap ( B, C );
   
   Put ("A = "); Put (A); New_Line;
   Put ("B = "); Put (B); New_Line;
   Put ("C = "); Put (C); New_Line;
   
end;
