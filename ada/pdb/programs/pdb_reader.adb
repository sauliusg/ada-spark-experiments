with Text_IO;   use Text_IO;
with PDB_Atoms; use PDB_Atoms;

procedure PDB_Reader is
   
   A : PDB_Atom;
   
begin
   A.Atomic_Number := 1;
   A.Charge := -1;
   
   Put_Line ("Ada PDB Atom Reader");
end PDB_Reader;
