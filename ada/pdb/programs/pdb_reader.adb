with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Strings.Fixed;   use Ada.Strings.Fixed;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;
with PDB_Atoms;           use PDB_Atoms;
with GNAT.Command_Line;   use GNAT.Command_Line;
with Ada.Command_Line;    use Ada.Command_Line;

procedure PDB_Reader is
   
   A : PDB_Atom;
   
   Default_Charge : constant Integer := 0;
   
   package Perly_Reader is
      function Get_Current_Line return String;
      function End_Of_All_Files return Boolean;
   private
      Is_STDIN : Boolean := False;
      Current_File : File_Type;
      Current_Argument : Integer := 0;
   end Perly_Reader;         
         
   package body Perly_Reader is
      
      function Get_Current_Line return String is
      begin
         if Argument_Count = 0 then
            return Get_Line (Standard_Input);
         else
            if Current_Argument = 0 or else
              (Is_STDIN and then End_Of_File (Standard_Input)) or else
              (Current_Argument < Argument_Count and then End_Of_File (Current_File)) then
               if not Is_STDIN and then Current_Argument > 0 then
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
               return Get_Line (Standard_Input);
            else
               return Get_Line (Current_File);
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
               if End_Of_File (Current_File) then
                  return True;
               else
                  return False;
               end if;
            end if;
         end if;
         return False;
      end;

   end Perly_Reader;
   
   use Perly_Reader;
   
begin
   while not End_Of_All_Files loop
      declare
         PDB_Line : String := Get_Current_Line;
      begin
         
         if PDB_Line'Last > 6 and then
           (PDB_Line (1..6) = "ATOM  " or else PDB_Line (1..6) = "HETATM") then
            A.Charge := Default_Charge;
         
            Get_Atom (A, PDB_Line);
         
            Put (A.Kind'Image);
            Put ((6 - A.Kind'Image'Length) * " ");
            Put (" ");
            Put (A.Serial_Number, 5);
            Put (" ");
            Put (A.Atom_Name);
            Put (" ");
            Put (A.Alt_Location);
            Put (A.Residue_Name);
            Put (" ");
            Put (A.Chain);
            Put (" ");
            Put (A.Residue_Number, 4);
            Put (A.Insertion_Code);
            Put (" ");
            Put (A.X);
            Put (" ");
            Put (A.Y);
            Put (" ");
            Put (A.Z);
            Put (" ");
            Put (A.Occupancy);
            Put (" ");
            Put (A.B_Factor);
            Put (" ");
            if A.Segment /= "    " then
               Put (A.Segment);
            else
               Put ("****");
            end if;
            Put (" ");
            Put (A.Chem_Type);
            Put (" ");
            Put (Integer (A.Atomic_Number), 3);
            Put (" ");
            Put (A.Charge, 2);
            New_Line;
         end if;
      end;
   end loop;
   
end PDB_Reader;
