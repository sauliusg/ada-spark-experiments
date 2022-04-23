with Text_IO;   use Text_IO;
with PDB_Atoms; use PDB_Atoms;

procedure PDB_Reader is
   
   A : PDB_Atom;
   
   Default_Charge : Integer := +1;
   
begin
   A.Atomic_Number := 1;
   Default_Charge := Default_Charge - 1;
   A.Charge := Default_Charge;
   
   Put_Line ("Ada PDB Atom Reader");
end PDB_Reader;
