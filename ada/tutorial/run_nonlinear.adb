with Ada.Text_IO; use Ada.Text_IO;
with Nonlinear;

procedure Run_Nonlinear is
   A, B, C : Positive;
   X1, X2 : Natural;
begin
   
   A := 23;
   B := 17;
   C := 8;
   
   Nonlinear (A, B, C, R1 => X1, R2 => X2);
     
   Put_Line ("A  = " & A'Image);
   Put_Line ("B  = " & B'Image);
   Put_Line ("C  = " & C'Image);
   New_Line;
   
   Put_Line ("X1 = " & X1'Image);
   Put_Line ("X2 = " & X2'Image);
end;
