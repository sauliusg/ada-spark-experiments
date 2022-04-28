with Ada.Text_IO;         use Ada.Text_IO;
with Perly_Reader;        use Perly_Reader;
with PDB_Atoms;           use PDB_Atoms;
with PDB_Atom_Printer;    use PDB_Atom_Printer;
with Ada.Strings;         use Ada.Strings;
with Ada.Strings.Fixed;   use Ada.Strings.Fixed;

with Ada.Long_Float_Text_IO;   use Ada.Long_Float_Text_IO;

procedure PDB_Inertia_Tensor is
   
   type Inertia_Tensor is array (1..3, 1..3) of Long_Float;
   
   I : Inertia_Tensor;
   
   type Atom_Mass_Record is record
      Atom_Symbol : String (1..2);
      Mass : Long_Float;
   end record;
   
   Atom_Mass : constant array (Integer range <>) of Atom_Mass_Record :=
     (
      -- From https://webelements.com/:
      ("H ", 1.008),  ("He", 4.0026),
      ("Li", 6.94),   ("Be", 9.0122), ("B ", 10.81),  ("C ", 12.011),
      ("N ", 14.007), ("O ", 15.999), ("F ", 18.998), ("Ne", 20.180),
      ("Na", 22.990), ("Mg", 24.305), ("Al", 26.982), ("Si", 28.085),
      ("P ", 30.974), ("S ", 32.06),  ("Cl", 35.45),  ("Ar", 39.948),
      ("K ", 39.098), ("Ca", 40.078), ("Sc", 44.956), ("Ti", 47.867)
     );
   
   function Lookup_Atomic_Mass (Atom_Symbol : String) return Long_Float is
   begin
      for I in Atom_Mass'Range loop
         if Trim (Atom_Symbol, Side => Both) =
           Trim (Atom_Mass(I).Atom_Symbol, Side => Both) then
            return Atom_Mass(I).Mass;
         end if;
      end loop;
      return 12.011; -- assume Carbon by default...
   end;
   
begin
   while not End_Of_All_Files loop
      declare
         PDB_Line : String := Get_Current_File_Line;
         A : PDB_Atom;
         M : Long_Float;
      begin
         
         if PDB_Line'Last > 6 and then
           (PDB_Line (1..6) = "ATOM  " or else PDB_Line (1..6) = "HETATM") then
            
            Get_Atom (A, PDB_Line);
            
            M := Lookup_Atomic_Mass (A.Chem_Type);
            
            Put (A.Chem_Type);
            Put (ASCII.HT);
            Put (M,2,6,3);
            New_Line;
            
         end if;
      end;
   end loop;
   
end PDB_Inertia_Tensor;
