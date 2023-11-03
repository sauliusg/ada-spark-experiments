with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;

with Real_Generic_Matrices;
with Real_Generic_Matrix_File;

with Ada.Numerics.Real_Arrays;
use  Ada.Numerics.Real_Arrays;

with Ada.Command_Line;    use Ada.Command_Line;

procedure FMatDet is
   
   package Float_Matrices is new Real_Generic_Matrices (Float);
   package Float_Matrix_File is new Real_Generic_Matrix_File 
     (
      Float,
      Float_Matrices,
      Ada.Float_Text_IO.Get
     );
   
   use Float_Matrices, Float_Matrix_File;
   
   function Det (M : Ada.Numerics.Real_Arrays.Real_Matrix) return Float 
     renames Ada.Numerics.Real_Arrays.Determinant;
   
   function Det (M : Float_Matrices.Real_Matrix) return Float 
     is (Det (Ada.Numerics.Real_Arrays.Real_Matrix (M)));
     
   pragma Inline (Det);
     
begin
   
   for I in 1 .. Argument_Count loop
      declare
         File_Name : String := Argument (I);
         M : Float_Matrices.Real_Matrix := Load_Real_Matrix (File_Name);
         D : Float;
      begin
         
         pragma Assert (M'First (1) = M'First(2));
         pragma Assert (M'Last (1) = M'Last(2));
         
         D := Det (M);
         
         Put (Float'Image (D));
         Put (ASCII.HT);
         Put_Matrix_Line (M);
         New_Line;
      end;
   end loop;
   
end;
