with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;
with Lazy_Determinant;    use Lazy_Determinant;

with Ada.Command_Line;    use Ada.Command_Line;
with Option_Processor;    use Option_Processor;
with File_Selector;       use File_Selector;

procedure IMatDet is
   
   procedure Help is
      procedure P (S : String) renames Put_Line;
   begin
      P ("Calculate determinant of a matrix");
      P ("USAGE:");
      P ("    " & Command_Name & " --options input.mat");
   end;
   
   Options : Option_Array :=
     (
      1 => Help_Option("-h", "--help")
     );
   
begin
   
   Process_Options (Options, Help'Access);
   
   for I in 1 .. File_Name_Count loop
      declare
         subtype File_Access is File_Selector.File_Access;
         File : File_Access := Select_File (I);
         M : Integer_Matrix := Load_Integer_Matrix (File.all);
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
   
exception
   when HELP_PRINTED => null;
      
end;
