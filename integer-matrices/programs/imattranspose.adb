with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;

with Ada.Command_Line;    use Ada.Command_Line;
with Option_Processor;    use Option_Processor;
with File_Selector;       use File_Selector;

procedure IMatTranspose is
   
   procedure Help (Option_String : String; Position : in out Positive) is
      procedure P (S : String) renames Put_Line;
   begin
      P ("Calculate transpose matrices");
      P ("USAGE:");
      P ("    " & Command_Name & " --options input.mat");
   end;
   
   Options : Option_Array :=
     (
      1 => Help_Option("-h", "--help", Help'Access)
     );
   
begin
   
   Process_Options (Options);
   
   for I in 1 .. File_Name_Count loop
      declare
         subtype File_Access is File_Selector.File_Access;
         File : File_Access := Select_File (I);
         M : Integer_Matrix := Load_Integer_Matrix (File.all);
         T : Integer_Matrix := Transpose (M);
      begin
         Put_Matrix (T);
         New_Line;
      end;
   end loop;
   
exception
   when HELP_PRINTED => null;
      
end;
