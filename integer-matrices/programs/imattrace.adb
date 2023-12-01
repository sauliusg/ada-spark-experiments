with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;

with Ada.Command_Line;          use Ada.Command_Line;
with Option_Processor;    use Option_Processor;
with File_Selector;       use File_Selector;

procedure IMatTrace is
   
   procedure Help is
      procedure P (S : String) renames Put_Line;
   begin
      P ("Calculate traces of matrices");
      P ("USAGE:");
      P ("    " & Command_Name & " --options input.mat");
   end;
   
   Options : Option_Array :=
     (
      1 => Help_Option("-h", "--help")
     );
   
   subtype File_Access is File_Selector.File_Access;
   File : File_Access;
   
begin
   
   Process_Options (Options, Help'Access);
   
   for I in 1 .. File_Name_Count loop
      File := Select_File (I);
      while not End_Of_File (File.all) loop
         declare
            M : Integer_Matrix := Load_Integer_Matrix (File.all);
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
         Skip_To_Next_Matrix (File.all);
      end loop;
      Close (File);
   end loop;
   
exception
   when HELP_PRINTED => null;
      
end;
