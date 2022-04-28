with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Maps;  use Ada.Strings.Maps;

package body PDBx_Atoms is
   
   Default_B_Factor : constant Float := 0.0;
   Default_Occupancy : constant Float := 1.0;
   
   procedure Get_Atom (A : out PDBx_Atom; PDBx_Line : in String) is
      pragma Assert (PDBx_Line'First = 1, "PDBx line indices MUST start from 1");
      
      Whitespace : constant Character_Set := To_Set (' ');
      F : Positive := 1; -- first
      L : Natural;       -- last
      
      function Get_Integer_Token (S : String) return Integer is
         Value : Integer;
      begin
         Find_Token (S, Whitespace, F, Test => Outside, First => F, Last => L);
         Value := Integer'Value (S (F..L));
         F := L + 1;
         return Value;
      end;
      
      function Get_String_Token (S : String) return String is
         I : Integer;
      begin
         Find_Token (S, Whitespace, F, Test => Outside, First => F, Last => L);
         I := F;
         F := L + 1;
         return S (I..L);
      end;
      
      function Get_Unbounded_String_Token (S : String) return Unbounded_String is
      begin
         return To_Unbounded_String (Get_String_Token (S));
      end;
      
   begin
      
      declare
         Keyword : String := Get_String_Token (PDBx_Line);
      begin
         if Keyword = "ATOM" then
            A.Kind := PDBx_Atom_Kind'(ATOM);
         elsif Keyword = "HETATM" then
            A.Kind := PDBx_Atom_Kind'(HETATM);
         else
            raise Incorrect_PDBx_Atom_Keyword 
              with "Unexpected keyword encountered in PDBx line """ &
              PDBx_Line (1..20) & "..."", " & 
              "expected 'ATOM  ' or 'HETATM' at the beginning of the line";
         end if;
      end;
      
-- saulius@starta pdb/ $ grep ^ATOM ~/struct/pdb/models/GroEL/1XCK.cif | head -2
-- ATOM   1     N N   . ALA A  1 1   ? 27.953  72.360  22.316  1.00 25.59  ? 2    ALA A N   1 
-- ATOM   2     C CA  . ALA A  1 1   ? 26.809  71.425  22.134  1.00 26.04  ? 2    ALA A CA  1 
      
      A.Serial_Number := Get_Integer_Token (PDBx_Line);
      A.Chem_Type := Get_Unbounded_String_Token (PDBx_Line);
      A.Atom_Name := Get_Unbounded_String_Token (PDBx_Line);
      A.Alt_Location := Get_Unbounded_String_Token (PDBx_Line);
      A.Residue_Name := Get_Unbounded_String_Token (PDBx_Line);
      A.Chain := Get_Unbounded_String_Token (PDBx_Line);
      A.Entity_Number := Get_Integer_Token (PDBx_Line);
      A.Residue_Number := Get_Integer_Token (PDBx_Line);
      -- A.Insertion_Code := PDB_Line (27..27);
      -- A.X := Float'Value (PDB_Line (31..38));
      -- A.Y := Float'Value (PDB_Line (39..46));
      -- A.Z := Float'Value (PDB_Line (47..54));
      -- 
      -- if PDB_Line'Last >= 60 then
      --    A.Occupancy := Float'Value (PDB_Line (55..60));
      -- else
      --    A.Occupancy := Default_Occupancy;
      -- end if;
      -- 
      -- if PDB_Line'Last >= 66 then
      --    A.B_Factor := Float'Value (PDB_Line (61..66));
      -- else
      --    A.B_Factor := Default_B_Factor;
      -- end if;
      -- 
      -- if PDB_Line'Last >= 76 then
      --    A.Segment := PDB_Line (73..76);
      -- else
      --    A.Segment := "    ";
      -- end if;
      -- 
      -- if PDB_Line'Last >= 78 then
      --    A.Chem_Type := PDB_Line (77..78);
      -- else
      --    A.Chem_Type := A.Atom_Name (1..2);
      -- end if;
      -- 
      -- if PDB_Line'Last >= 80 then
      --    if PDB_Line (79) in '0' .. '9' then
      --       A.Charge := Integer'Value (PDB_Line (79..79));
      --    end if;
      --    if PDB_Line (80) = '-' then
      --       A.Charge := - A.Charge;
      --    end if;
      -- end if;
           
   end;
   
end PDBx_Atoms;
