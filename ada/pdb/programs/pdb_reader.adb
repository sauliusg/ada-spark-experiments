with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Strings.Fixed;   use Ada.Strings.Fixed;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;
with PDB_Atoms;           use PDB_Atoms;

procedure PDB_Reader is
   
   A : PDB_Atom;
   
   Default_Charge : constant Integer := 0;
   
begin
   while not End_Of_File (Standard_Input) loop
      declare
         PDB_Line : String := Get_Line (Standard_Input);
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
