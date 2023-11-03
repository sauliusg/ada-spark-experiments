with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;

with Real_Generic_Matrices;
with Real_Generic_Matrix_File;

with Ada.Command_Line;    use Ada.Command_Line;

procedure FMatTranspose is
   
   package Float_Matrices is new Real_Generic_Matrices (Float);
   package Float_Matrix_File is new Real_Generic_Matrix_File 
     (
      Float,
      Float_Matrices,
      Ada.Float_Text_IO.Get
     );
   
   use Float_Matrices, Float_Matrix_File;
   
begin
   
   for I in 1 .. Argument_Count loop
      declare
         File_Name : String := Argument (I);
         M : Float_Matrices.Real_Matrix := Load_Real_Matrix (File_Name);
         T : Float_Matrices.Real_Matrix := Transpose (M);
      begin
         Put_Matrix (T);
         New_Line;
      end;
   end loop;
   
end;
