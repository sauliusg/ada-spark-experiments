package PDB_Atoms is   
   
   -- An atomic number of an atom; physically it is the number of
   --  protons in the nucleus, or number of electrons in a neutral
   --  atom. Atomc_Number can be assigned value '0' if the atom
   --  describe is not a physical atom and can not be unambiguously
   --  assigned its atomic number.
   type Atomic_Number_Type is new Natural;
   
   type PDB_Atom_Kind is (ATOM, HETATM);
   
   Incorrect_PDB_Atom_Keyword : exception;   
   
   type PDB_Atom is record
      Kind : PDB_Atom_Kind;
      X, Y, Z : Float;
      B_Factor : Float;
      Occupancy : Float;
      Atomic_Number : Atomic_Number_Type := 0;
      Serial_Number : Integer;
      Atom_Name : String (1..4);
      Chem_Type : String (1..2);
      Residue_Name : String (1..3);
      Residue_Number : Integer;
      Insertion_Code : String (1..1);
      Alt_Location : String (1..1);
      Chain : String (1..1);
      Segment : String (1..4);
      Charge : Integer range -9 .. +9 := 0;
   end record;
   
   procedure Get_Atom (A : out PDB_Atom; PDB_Line : in String);
   
end PDB_Atoms;
