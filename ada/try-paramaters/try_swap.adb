with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 

procedure Try_Swap is
   
   procedure Swap (X, Y : in out Integer) is
      T : Integer;
   begin
      T := X; X := Y; Y := T;
   end;
   
   procedure Init (X : out Integer) is
   begin
      X := 43;
   end;
   
   A : Integer := 12;
   B : Integer := 42;
   
begin
   Init (X => B);
   
   Put ("A = "); Put (A); New_Line;
   Put ("B = "); Put (B); New_Line;
   
   New_Line;
   
   Swap ( X => A, Y => B);
   
   Put ("A = "); Put (A); New_Line;
   Put ("B = "); Put (B); New_Line;
   
end;
