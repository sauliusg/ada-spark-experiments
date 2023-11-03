with Ada.Text_IO; use Ada.Text_IO;
with Ada.Long_Float_Text_IO;

with Real_Generic_Matrices;
with Real_Generic_Matrix_File;

with Ada.Numerics.Generic_Real_Arrays;

with Ada.Command_Line; use Ada.Command_Line;

procedure DMatInv is
   
   package Float_Matrices is new Real_Generic_Matrices (Long_Float);
   package Float_Matrix_File is new Real_Generic_Matrix_File 
     (
      Long_Float,
      Float_Matrices,
      Ada.Long_Float_Text_IO.Get
     );
   
   use Float_Matrices, Float_Matrix_File;
   
   package Long_Float_Arrays is new
     Ada.Numerics.Generic_Real_Arrays (Long_Float);
   
   function Inverse (M : Real_Matrix) return Real_Matrix
   is
      I : Long_Float_Arrays.Real_Matrix :=
        Long_Float_Arrays.Inverse
        (
         Long_Float_Arrays.Real_Matrix (M)
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
