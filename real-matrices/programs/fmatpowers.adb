with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;

with Real_Generic_Matrices;
with Real_Generic_Matrix_File;

with Ada.Command_Line;          use Ada.Command_Line;

procedure FMatPowers is
   
   package Float_Matrices is new Real_Generic_Matrices (Float);
   package Float_Matrix_File is new Real_Generic_Matrix_File 
     (
      Float,
      Float_Matrices,
      Ada.Float_Text_IO.Get
     );
   
   use Float_Matrices, Float_Matrix_File;
   
   Max_Power : Integer;
   Power : Integer;
   
   File : File_Type;
   Empty_Line : Boolean := False;
   
begin
   
   Max_Power := Integer'Value (Argument (1));
   
   for I in 2 .. Argument_Count loop
      Open (File, In_File, Argument (I));
      while not End_Of_File (File) loop
         declare
            M : Real_Matrix := Load_Real_Matrix (File);
            
            Unity : Real_Matrix (M'Range(1), M'Range(2)) :=
              (others => (others => 0.0));
         
            Result : Real_Matrix := Unity;
         begin
            for I in Unity'Range(1) loop
               Unity (I,I) := 1.0;
            end loop;
   
            if Empty_Line then
               New_Line;
            end if;
            
            Result := Unity;
         
            for Power in 1 .. Max_Power loop
               Result := Result * M;      
               Put (Power'Image);
               Put (ASCII.HT);
               Put_Matrix_Line (Result);
               New_Line;
               exit when Result = Unity;
            end loop;
            
            Skip_To_Next_Matrix (File, Empty_Line);
         end;
      end loop;
      Close (File);
      if I < Argument_Count then
         New_Line;
      end if;
   end loop;
   
end;
