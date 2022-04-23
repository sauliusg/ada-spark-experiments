package body PDB_Atoms is
   
   Default_B_Factor : constant Float := 0.0;
   Default_Occupancy : constant Float := 1.0;
   
   procedure Get_Atom (A : out PDB_Atom; PDB_Line : in String) is
      pragma Assert (PDB_Line'First = 1);  -- PDB line indices start from 1
      pragma Assert (PDB_Line'Last >= 54); -- At least coordinates MUST be provided
   begin
      if PDB_Line (1..6) = "ATOM  " then
         A.Kind := PDB_Atom_Kind'(ATOM);
      elsif PDB_Line (1..6) = "HETATM" then
         A.Kind := PDB_Atom_Kind'(HETATM);
      else
         raise Incorrect_PDB_Atom_Keyword 
           with "Unexpected keyword encountered in PDB line """ &
           PDB_Line (1..20) & "..."", " & 
           "expected 'ATOM  ' or 'HETATM' at the beginning of the line";
      end if;
      
      A.Serial_Number := Integer'Value (PDB_Line (7..11));
      A.Atom_Name := PDB_Line (13..16);
      A.Alt_Location := PDB_Line (17..17);
      A.Residue_Name := PDB_Line (18..20);
      A.Chain := PDB_Line (22..22);
      A.Residue_Number := Integer'Value (PDB_Line (23..26));
      A.Insertion_Code := PDB_Line (27..27);
      A.X := Float'Value (PDB_Line (31..38));
      A.Y := Float'Value (PDB_Line (39..46));
      A.Z := Float'Value (PDB_Line (47..54));
      
      if PDB_Line'Last >= 60 then
         A.Occupancy := Float'Value (PDB_Line (55..60));
      else
         A.Occupancy := Default_Occupancy;
      end if;
      
      if PDB_Line'Last >= 66 then
         A.B_Factor := Float'Value (PDB_Line (61..66));
      else
         A.B_Factor := Default_B_Factor;
      end if;
      
      if PDB_Line'Last >= 76 then
         A.Segment := PDB_Line (73..76);
      else
         A.Segment := "    ";
      end if;
      
      if PDB_Line'Last >= 78 then
         A.Chem_Type := PDB_Line (77..78);
      else
         A.Chem_Type := A.Atom_Name (1..2);
      end if;
      
      if PDB_Line'Last >= 80 then
         if PDB_Line (79) in '0' .. '9' then
            A.Charge := Integer'Value (PDB_Line (79..79));
         end if;
         if PDB_Line (80) = '-' then
            A.Charge := - A.Charge;
         end if;
      end if;
           
   end;
   
end PDB_Atoms;
