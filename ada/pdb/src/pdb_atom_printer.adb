with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Strings.Fixed;   use Ada.Strings.Fixed;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;
with PDB_Atoms;           use PDB_Atoms;

package body PDB_Atom_Printer is
   
   -- Print all data in the PDB_Atom record for debug purposes.
   procedure Print_PDB_Atom (A : PDB_Atom) is
   begin
      Put (PDB_Atom_Kind'Image (A.Kind));
      Put ((6 - PDB_Atom_Kind'Image(A.Kind)'Length) * " ");
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
   end Print_PDB_Atom;
   
end PDB_Atom_Printer;
