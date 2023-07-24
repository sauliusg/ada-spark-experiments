with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;

with Ada.Command_Line;    use Ada.Command_Line;

procedure IMatTranspose is
   
begin
   
   for I in 1 .. Argument_Count loop
      declare
         File_Name : String := Argument (I);
         M : Integer_Matrix := Load_Integer_Matrix (File_Name);         
         T : Integer_Matrix := Transpose (M);
      begin
         Put_Matrix (T);
         New_Line;
      end;
   end loop;
   
end;
