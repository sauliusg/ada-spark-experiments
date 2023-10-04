with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;

with Ada.Command_Line;          use Ada.Command_Line;

procedure IMatTrace is
   
begin
   
   for I in 1 .. Argument_Count loop
      declare
         File_Name : String := Argument (I);
         M : Integer_Matrix := Load_Integer_Matrix (File_Name);
         T : Integer;
      begin
         
         pragma Assert (M'First (1) = M'First(2));
         pragma Assert (M'Last (1) = M'Last(2));
         
         T := Trace (M);
         
         Put (Integer'Image (T));
         Put (ASCII.HT);
         Put_Matrix_Line (M);
         New_Line;
      end;
   end loop;
   
end;
