with Ada.Text_IO;              use Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;
with Ada.Integer_Text_IO;      use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;        use Ada.Float_Text_IO;
with PDBx_Atoms;               use PDBx_Atoms;

package body PDBx_Atom_Printer is
   
   -- Print all data in the PDBx_Atom record for debug purposes.
   procedure Print_PDBx_Atom (A : PDBx_Atom) is
   begin
      Put (PDBx_Atom_Kind'Image (A.Kind));
      Put (" ");
      Put (A.Serial_Number, 5);
      Put (" ");
      Put (A.Atom_Name);
      Put (ASCII.HT);
      Put (A.Alt_Location);
      Put (" ");
      Put (A.Residue_Name);
      Put (" ");
      Put (A.Chain);
      Put (" ");
      Put (A.Entity_Number, 4);
      Put (" ");
      Put (A.Residue_Number, 4);
      Put (" ");
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
      Put (A.Segment);
   end Print_PDBx_Atom;
   
end PDBx_Atom_Printer;
