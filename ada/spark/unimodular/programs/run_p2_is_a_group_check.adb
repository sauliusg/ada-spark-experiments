pragma Ada_2022;

with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with Ternary_Matrices;     use Ternary_Matrices;
with Ternary_Matrix_Group; use Ternary_Matrix_Group;

procedure Run_P2_Is_A_Group_Check is
   
   M : Ternary_Matrix_3x3;   
   
begin
   
   -- null;
   
   M  := Dyad_Z_Axis_Matrix * Dyad_Z_Axis_Matrix;
   
   Put (Dyad_Z_Axis_Matrix'Image);
   New_Line;
   
   Put (M'Image);
   New_Line;
   
end Run_P2_Is_A_Group_Check;
