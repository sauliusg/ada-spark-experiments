package PDB_Atoms is
   
   -- An atomic number of an atom; physically it is the number of
   --  protons in the nucleus, or number of electrons in a neutral
   --  atom:
   type Atomic_Number_Type is new Positive;
   
   type PDB_Atom_Kind is (ATOM, HETATM);
   
   type PDB_Atom is record
      Kind : PDB_Atom_Kind;
      X, Y, Z : Float;
      Atomic_Number : Atomic_Number_Type;
      Serial_Number : Integer;
      Atom_Name : String (1..4);
      Atom_Type : String (1..2);
      Residue_Number : Integer;
      Residue_Name : String (1..3);
      Chain : String (1..1);
      Segment : String (1..4);
      Charge : Float range -10.0 .. +10.0;
   end record;
   
end PDB_Atoms;
