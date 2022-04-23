with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Strings.Fixed;   use Ada.Strings.Fixed;
with GNAT.Command_Line;   use GNAT.Command_Line;
with Ada.Command_Line;    use Ada.Command_Line;

procedure PDB_Atom_Line_Reader is
   
   package Perly_Reader is
      function Get_Current_File_Line return String;
      function End_Of_All_Files return Boolean;
   private
      Is_STDIN : Boolean := False;
      Current_File : File_Type;
      Current_Argument : Integer := 0;
   end Perly_Reader;         
         
   package body Perly_Reader is
      
      function Get_Current_File_Line return String is
      begin
         if Argument_Count = 0 then
            return Get_Line (Standard_Input);
         else
            if Current_Argument = 0 or else
              (Is_STDIN and then End_Of_File (Standard_Input)) or else
              (Current_Argument < Argument_Count 
                 and then not Is_STDIN 
                 and then End_Of_File (Current_File))
            then
               if not Is_STDIN and then Current_Argument > 0
               then
                  Close (Current_File);
               end if;
               
               Current_Argument := Current_Argument + 1;
               
               if Argument (Current_Argument) = "-" then
                  Is_STDIN := True;
               else
                  Is_STDIN := False;
                  Open (Current_File, In_File, Argument (Current_Argument));
               end if;
            end if;
            if Is_STDIN then
               if not End_Of_File (Standard_Input) then
                  return Get_Line (Standard_Input);
               else
                  return "";
               end if;
            else
               if not End_Of_File (Current_File) then
                  return Get_Line (Current_File);
               else
                  return "";
               end if;
            end if;
         end if;
      end;
      
      function End_Of_All_Files return Boolean is
      begin
         if Argument_Count = 0 then
            return End_Of_File (Standard_Input);
         elsif Current_Argument = Argument_Count then
            if Is_STDIN then
               return End_Of_File (Standard_Input);
            else
               return End_Of_File (Current_File);
            end if;
         end if;
         return False;
      end;

   end Perly_Reader;
   
   use Perly_Reader;
   
begin
   while not End_Of_All_Files loop
      declare
         PDB_Line : String := Get_Current_File_Line;
      begin
         if PDB_Line'Last > 6 and then
           (PDB_Line (1..6) = "ATOM  " or else PDB_Line (1..6) = "HETATM")
         then
            Put (PDB_Line);
         end if;
      end;
   end loop;
   
end PDB_Atom_Line_Reader;
