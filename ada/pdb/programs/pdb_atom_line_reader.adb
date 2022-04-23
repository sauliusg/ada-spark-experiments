with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Strings.Fixed;   use Ada.Strings.Fixed;

with Perly_Reader;        use Perly_Reader;

procedure PDB_Atom_Line_Reader is
   
begin
   while not End_Of_All_Files loop
      declare
         PDB_Line : String := Get_Current_File_Line;
      begin
         if PDB_Line'Last > 6 and then
           (PDB_Line (1..6) = "ATOM  " or else PDB_Line (1..6) = "HETATM")
         then
            Put_Line (PDB_Line);
         end if;
      end;
   end loop;
   
end PDB_Atom_Line_Reader;
