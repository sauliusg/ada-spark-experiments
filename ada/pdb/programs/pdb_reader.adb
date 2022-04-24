with Ada.Text_IO;         use Ada.Text_IO;
with Perly_Reader;        use Perly_Reader;
with PDB_Atoms;           use PDB_Atoms;
with PDB_Atom_Printer;    use PDB_Atom_Printer;

procedure PDB_Reader is
   
begin
   while not End_Of_All_Files loop
      declare
         PDB_Line : String := Get_Current_File_Line;
         A : PDB_Atom;
      begin
         
         if PDB_Line'Last > 6 and then
           (PDB_Line (1..6) = "ATOM  " or else PDB_Line (1..6) = "HETATM") then
            
            Get_Atom (A, PDB_Line);
            Print_PDB_Atom (A);
            New_Line;
            
         end if;
      end;
   end loop;
   
end PDB_Reader;
