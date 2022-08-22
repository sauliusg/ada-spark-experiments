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
   
   function Add (X, Y : in Integer; Z : out Integer) return Integer is
   begin
      Z := X + Y;
      return Z;
   end;
   
   A : Integer := 12;
   B : Integer := 42;
   C : Integer;
   
begin
   -- Init (X =: B); -- does not compile
   Init (X => B);
   
   Put ("A = "); Put (A); New_Line;
   Put ("B = "); Put (B); New_Line;
   
   New_Line;
   
   -- Swap ( X :=: A, Y :=: B); -- does not compile
   Swap ( X => A, Y => B);
   
   Put (Add (A, B, C));
   New_Line;
   
   Put ("A = "); Put (A); New_Line;
   Put ("B = "); Put (B); New_Line;
   Put ("C = "); Put (C); New_Line;
   
end;
