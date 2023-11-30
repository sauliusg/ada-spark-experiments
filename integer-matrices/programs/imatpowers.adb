with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;

with Ada.Command_Line;          use Ada.Command_Line;
with Option_Processor;    use Option_Processor;
with File_Selector;       use File_Selector;

procedure IMatPowers is
   
   procedure Help (Option_String : String; Position : in out Positive) is
      procedure P (S : String) renames Put_Line;
   begin
      P ("Calculate powers of matrices.");
      New_Line;
      P ("USAGE:");
      P ("    " & Command_Name & " --max-power 10 input.mat");
      New_Line;
      P ("where the first argument ""10"" is the maximum power");
      P ("of the matrix to compute.");
      New_Line;
   end;
   
   Max_Power_Option : Option_Value_Access :=
     new Option_Value_Type'(INTEGER_OPT, Integer_Value => 10);
   
   Number_Powers : Option_Value_Access :=
     new Option_Value_Type'(BOOLEAN_TRUE_OPT, Boolean_Value => True);
   
   Options : Option_Array :=
     (
      Help_Option("-h", "--help",          Help'Access),
      Option ("-m", "--max-power",         Max_Power_Option),
      Option ("-n", "--number-powers",     Number_Powers),
      Option ("-n-", "--no-number-powers", BOOLEAN_FALSE_OPT, Number_Powers),
      Option ("+n",  "",                   BOOLEAN_FALSE_OPT, Number_Powers)
     );
   
   Max_Power : Integer;
   
   File : File_Selector.File_Access;
   Empty_Line : Boolean := False;
   
begin
   
   Process_Options (Options);
   
   Max_Power := Max_Power_Option.Integer_Value;
   
   for I in 1 .. File_Name_Count loop
      File := Select_File (I);
      while not End_Of_File (File.all) loop
         declare
            M : Integer_Matrix := Load_Integer_Matrix (File.all);
            
            Unity : Integer_Matrix (M'Range(1), M'Range(2)) :=
              (others => (others => 0));
         
            Result : Integer_Matrix := Unity;
         begin
            for I in Unity'Range(1) loop
               Unity (I,I) := 1;
            end loop;
   
            if Empty_Line then
               New_Line;
            end if;
            
            Result := Unity;
         
            for Power in 1 .. Max_Power loop
               Result := Result * M;
               if Number_Powers.Boolean_Value = True then
                  Put (Power'Image);
                  Put (ASCII.HT);
               end if;
               Put_Matrix_Line (Result);
               New_Line;
               exit when Result = Unity;
            end loop;
            
            Skip_To_Next_Matrix (File.all, Empty_Line);
         end;
      end loop;
      Close (File);
      if I < File_Name_Count then
         New_Line;
      end if;
   end loop;
   
exception
   when HELP_PRINTED => null;
   
end;
