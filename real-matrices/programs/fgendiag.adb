with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO;

with Real_Generic_Matrices;
with Real_Generic_Matrix_File;

with Ada.Command_Line; use Ada.Command_Line;
with Ada.Directories;

procedure FGenDiag is
   
   package Float_Matrices is new Real_Generic_Matrices (Float);
   package Float_Matrix_File is new Real_Generic_Matrix_File 
     (
      Float,
      Float_Matrices,
      Ada.Float_Text_IO.Get
     );
   
   use Float_Matrices, Float_Matrix_File;
   
   Order : Integer;
   
   Value : Float := 1.0;
   
begin
   
   Order := Integer'Value (Argument(1));
   
   if Ada.Directories.Simple_Name (Command_Name) = "fgenunity" then
      Value := 1.0;
   else
      Value := Float'Value (Argument(2));
   end if;
   
   declare
      M : Float_Matrices.Real_Matrix (1..Order, 1..Order) :=
        (others => (others => 0.0));
   begin
         
      for I in M'Range(1) loop
         M(I,I) := Value;
      end loop;
         
      Put_Matrix (M);
      New_Line;
      
   end;
   
end;
