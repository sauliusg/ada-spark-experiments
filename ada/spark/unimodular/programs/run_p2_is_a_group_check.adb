with Text_IO; use Text_IO;

with Ternary_Matrices;     use Ternary_Matrices;
with Ternary_Matrix_Group; use Ternary_Matrix_Group;

procedure Run_P2_Is_A_Group_Check is
   
   M : Ternary_Matrix_3x3;
   
begin
   
   -- null;
   
   M  := Dyad_Z_Axis_Matrix * Dyad_Z_Axis_Matrix;
   
end Run_P2_Is_A_Group_Check;
