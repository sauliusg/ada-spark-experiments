with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;
with Lazy_Determinant;    use Lazy_Determinant;

with Ada.Command_Line;    use Ada.Command_Line;

procedure IMatDet is
   
begin
   
   for I in 1 .. Argument_Count loop
      declare
         File_Name : String := Argument (I);
         M : Integer_Matrix := Load_Integer_Matrix (File_Name);
         D : Integer;
      begin
         
         pragma Assert (M'First (1) = M'First(2));
         pragma Assert (M'Last (1) = M'Last(2));
         
         D := Det (M);
         
         Put (Integer'Image (D));
         Put (ASCII.HT);
         Put_Matrix_Line (M);
         New_Line;
      end;
   end loop;
   
end;
