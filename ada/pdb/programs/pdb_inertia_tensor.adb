with Ada.Text_IO;         use Ada.Text_IO;
with Perly_Reader;        use Perly_Reader;
with PDB_Atoms;           use PDB_Atoms;
with PDB_Atom_Printer;    use PDB_Atom_Printer;
with Ada.Strings;         use Ada.Strings;
with Ada.Strings.Fixed;   use Ada.Strings.Fixed;

with Ada.Long_Float_Text_IO;    use Ada.Long_Float_Text_IO;
with Ada.Environment_Variables; use Ada.Environment_Variables;

with Ada.Containers.Vectors;
  
procedure PDB_Inertia_Tensor is
   
   type Inertia_Tensor is array (1..3, 1..3) of Long_Float;
   
   type Atom_Mass_Record is record
      Atom_Symbol : String (1..2);
      Mass : Long_Float;
   end record;
   
   Atom_Mass : constant array (Integer range <>) of Atom_Mass_Record :=
     (
      -- From:
      -- URL: svn://cod.ibt.lt/cif-tools/trunk/src/lib/perl5/COD/AtomProperties.pm
      -- Repository Root: svn://cod.ibt.lt/cif-tools
      -- Repository UUID: 04be6746-3802-0410-999d-98508da1e98c
      -- Revision: 9258
      ("Ac", 227.000),    ("Ds", 271.000),    ("Mg",  24.305),    ("Rn", 222.000),
      ("Ag", 107.868),    ("Dy", 162.500),    ("Mn",  54.938),    ("Ru", 101.070),
      ("Al",  26.982),    ("Er", 167.260),    ("Mo",  95.940),    ("S ",  32.066),
      ("Am", 243.000),    ("Es", 252.000),    ("Mt", 268.000),    ("Sb", 121.760),
      ("Ar",  39.948),    ("Eu", 151.964),    ("N ",  14.007),    ("Sc",  44.956),
      ("As",  74.922),    ("F ",  18.998),    ("Na",  22.991),    ("Se",  78.960),
      ("At", 210.000),    ("Fe",  55.845),    ("Nb",  92.906),    ("Sg", 266.000),
      ("Au", 196.967),    ("Fm", 257.000),    ("Nd", 144.240),    ("Si",  28.086),
      ("B ",  10.811),    ("Fr", 223.000),    ("Ne",  20.180),    ("Sm", 150.360),
      ("Ba", 137.327),    ("Ga",  69.723),    ("Ni",  58.693),    ("Sn", 118.710),
      ("Be",   9.012),    ("Gd", 157.250),    ("No", 259.000),    ("Sr",  87.620),
      ("Bh", 264.000),    ("Ge",  72.610),    ("Np", 237.000),    ("Ta", 180.948),
      ("Bi", 208.980),    ("H ",   1.008),    ("O ",  15.999),    ("Tb", 158.925),
      ("Bk", 247.000),    ("He",   4.003),    ("Os", 190.230),    ("Tc",  98.000),
      ("Br",  79.904),    ("Hf", 178.490),    ("P ",  30.974),    ("Te", 127.600),
      ("C ",  12.011),    ("Hg", 200.590),    ("Pa", 231.036),    ("Th", 232.038),
      ("Ca",  40.078),    ("Ho", 164.930),    ("Pb", 207.200),    ("Ti",  47.867),
      ("Cd", 112.411),    ("Hs", 269.000),    ("Pd", 106.420),    ("Tl", 204.383),
      ("Ce", 140.116),    ("I ", 126.904),    ("Pm", 145.000),    ("Tm", 168.934),
      ("Cf", 251.000),    ("In", 114.818),    ("Po", 210.000),    ("U ", 238.029),
      ("Cl",  35.453),    ("Ir", 192.217),    ("Pr", 140.908),    ("V ",  50.942),
      ("Cm", 247.000),    ("K ",  39.098),    ("Pt", 195.078),    ("W ", 183.840),
      ("Co",  58.933),    ("Kr",  83.800),    ("Pu", 244.000),    ("Xe", 131.290),
      ("Cr",  51.996),    ("La", 138.906),    ("Ra", 226.000),    ("Y ",  88.906),
      ("Cs", 132.905),    ("Li",   6.941),    ("Rb",  85.468),    ("Yb", 173.040),
      ("Cu",  63.546),    ("Lr", 262.000),    ("Re", 186.207),    ("Zn",  65.390),
      ("D ",   2.014),    ("Lu", 174.967),    ("Rf", 261.000),    ("Zr",  91.224),
      ("Db", 262.000),    ("Md", 258.000),    ("Rh", 102.906)
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
   
   I : Inertia_Tensor := (others => (others => 0.0));
   
   package PDB_Atom_Vector is new Ada.Containers.Vectors (Natural, PDB_Atom);
   
   use PDB_Atom_Vector;
   
   Atoms : PDB_Atom_Vector.Vector;
   
   Use_Single_Mass : Boolean := False;
   Mass : Long_Float;
   
begin
   
   -- check whether a single mass is to be used:
   if Exists ("PDB_INERTIA_TENSOR_MASS") then
      Use_Single_Mass := True;
      Mass := Long_Float'Value (Value ("PDB_INERTIA_TENSOR_MASS"));
   end if;
   
   -- load all atoms into a vector:
   while not End_Of_All_Files loop
      declare
         PDB_Line : String := Get_Current_File_Line;
         A : PDB_Atom;
      begin
         if PDB_Line'Last > 6 and then
           (PDB_Line (1..6) = "ATOM  " or else PDB_Line (1..6) = "HETATM") then
            Get_Atom (A, PDB_Line);
            Append (Atoms, A);
         end if;
      end;
   end loop;
   
   declare
      N : Ada.Containers.Count_Type := Length (Atoms);
      M : Long_Float;
      CX : Long_Float := 0.0;
      CY : Long_Float := 0.0;
      CZ : Long_Float := 0.0;
      X, Y, Z : Long_Float;
   begin
      
      -- Find center of mass;
      for A of Atoms loop
         CX := CX + Long_Float (A.X);
         CY := CY + Long_Float (A.Y);
         CZ := CZ + Long_Float (A.Z);
      end loop;
      
      CX := CX / Long_Float (N);
      CY := CY / Long_Float (N);
      CZ := CZ / Long_Float (N);
      
      -- Calculate the inertia tensor components:
      for A of Atoms loop
         
         if Use_Single_Mass then
            M := Mass;
         else
            M := Lookup_Atomic_Mass (A.Chem_Type);
         end if;
         
         -- Put (A.Chem_Type);
         -- Put (ASCII.HT);
         -- Put (M,2,6,3);
         -- New_Line;
         
         -- Calculate the inertia tensor:
         -- https://en.wikipedia.org/wiki/Inertia_Tensor
         X := Long_Float (A.X) - CX;
         Y := Long_Float (A.Y) - CY;
         Z := Long_Float (A.Z) - CZ;
         
         I (1,1) := I (1,1) + M * (X**2 + Y**2);
         I (2,2) := I (2,2) + M * (X**2 + Z**2);
         I (3,3) := I (3,3) + M * (Y**2 + Z**2);
         
         I (1,2) := I (1,2) - M * X * Y;
         I (1,3) := I (1,2) - M * X * Z;
         I (2,3) := I (1,2) - M * Y * Z;
         
      end loop;
   end;
   
   I (2,1) := I (1,2);
   I (3,1) := I (1,3);
   I (3,2) := I (2,3);
   
   Put ("INERTIA ");
   Put (I (1,1), 2, 6, 3);
   Put (" ");
   Put (I (2,2), 2, 6, 3);
   Put (" ");
   Put (I (2,2), 2, 6, 3);
   Put (" ");
   Put (I (1,2), 2, 6, 3);
   Put (" ");
   Put (I (1,3), 2, 6, 3);
   Put (" ");
   Put (I (2,3), 2, 6, 3);
   New_Line;
   
end PDB_Inertia_Tensor;
