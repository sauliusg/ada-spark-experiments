with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;

with Real_Generic_Matrices;
with Real_Generic_Matrix_File;

with Ada.Command_Line;          use Ada.Command_Line;

procedure FMatPow is
   
   package Float_Matrices is new Real_Generic_Matrices (Float);
   package Float_Matrix_File is new Real_Generic_Matrix_File 
     (
      Float,
      Float_Matrices,
      Ada.Float_Text_IO.Get
     );
   
   use Float_Matrices, Float_Matrix_File;
   
   Power : Integer;
   
   File : File_Type;
   
   Empty_Line : Boolean := False;
   
begin
   
   Power := Integer'Value (Argument (1));
   
   for I in 2 .. Argument_Count loop
      Open (File, In_File, Argument (I));
      Empty_Line := False;
      while not End_Of_File (File) loop
         declare
            M : Real_Matrix := Load_Real_Matrix (File);
            Result : Real_Matrix (M'Range(1), M'Range(2));
         begin
            if Empty_Line then
               New_Line;
            end if;
            
            for I in Result'Range(1) loop
               for J in Result'Range(1) loop
                  if I = J then
                     Result (I,J) := 1.0;
                  else
                     Result (I,J) := 0.0;
                  end if;
               end loop;
            end loop;
      
            for I in 1 .. Power loop
               Result := Result * M;
            end loop;
            
            Put_Matrix (Result);
            Skip_To_Next_Matrix (File, Empty_Line);
         end;
      end loop;
      Close (File);
      if I < Argument_Count then
         New_Line;
      end if;
   end loop;
   
end;
