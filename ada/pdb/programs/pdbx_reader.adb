with Ada.Text_IO;         use Ada.Text_IO;
with Perly_Reader;        use Perly_Reader;
with PDBx_Atoms;          use PDBx_Atoms;
with PDBx_Atom_Printer;   use PDBx_Atom_Printer;

procedure PDBx_Reader is
   
begin
   while not End_Of_All_Files loop
      declare
         PDBx_Line : String := Get_Current_File_Line;
         A : PDBx_Atom;
      begin
         
         if PDBx_Line'Last > 6 and then
           (PDBx_Line (1..6) = "ATOM  " or else PDBx_Line (1..6) = "HETATM") then
            
            Get_Atom (A, PDBx_Line);
            Print_PDBx_Atom (A);
            New_Line;
            
         end if;
      end;
   end loop;
   
end PDBx_Reader;
