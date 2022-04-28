with Ada.Strings.Unbounded;  use Ada.Strings.Unbounded;

package PDBx_Atoms is
   
   -- An atomic number of an atom; physically it is the number of
   --  protons in the nucleus, or number of electrons in a neutral
   --  atom. Atomc_Number can be assigned value '0' if the atom
   --  describe is not a physical atom and can not be unambiguously
   --  assigned its atomic number.
   type Atomic_Number_Type is new Natural;
   
   type PDBx_Atom_Kind is (ATOM, HETATM);
   
   Incorrect_PDBx_Atom_Keyword : exception;   
   
   type PDBx_Atom is record
      Kind : PDBx_Atom_Kind;
      X, Y, Z : Float;
      B_Factor : Float;
      Occupancy : Float;
      Atomic_Number : Atomic_Number_Type := 0;
      Serial_Number : Integer;
      Entity_Number : Integer;
      Atom_Name : Unbounded_String;
      Chem_Type : Unbounded_String;
      Residue_Name : Unbounded_String;
      Residue_Number : Integer;
      Insertion_Code : Unbounded_String;
      Alt_Location : Unbounded_String;
      Chain : Unbounded_String;
      Segment : Unbounded_String;
      Charge : Integer range -9 .. +9 := 0;
   end record;
   
   procedure Get_Atom (A : out PDBx_Atom; PDBx_Line : in String);
   
end PDBx_Atoms;
