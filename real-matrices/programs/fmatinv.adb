with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;

with Real_Generic_Matrices;
with Real_Generic_Matrix_File;

with Ada.Numerics.Real_Arrays;

with Ada.Command_Line;    use Ada.Command_Line;

procedure FMatInv is
   
   package Float_Matrices is new Real_Generic_Matrices (Float);
   package Float_Matrix_File is new Real_Generic_Matrix_File 
     (
      Float,
      Float_Matrices,
      Ada.Float_Text_IO.Get
     );
   
   use Float_Matrices, Float_Matrix_File;
   
   function Inverse (M : Real_Matrix) return Real_Matrix
   is
      I : Ada.Numerics.Real_Arrays.Real_Matrix :=
        Ada.Numerics.Real_Arrays.Inverse
        (
         Ada.Numerics.Real_Arrays.Real_Matrix (M)
        );
   begin
      return Float_Matrices.Real_Matrix (I);
   end;

begin
   
   for I in 1 .. Argument_Count loop
      declare
         File_Name : String := Argument (I);
         M : Real_Matrix := Load_Real_Matrix (File_Name);
         Inv : Real_Matrix
           (
            M'First(1) .. M'Last(1),
            M'First(2) .. M'Last(2)
           );
      begin
         
         pragma Assert (M'First (1) = M'First(2));
         pragma Assert (M'Last (1) = M'Last(2));
         
         Inv := Inverse (M);
         
         Put_Matrix (Inv);
         New_Line;
      end;
   end loop;
   
end;
