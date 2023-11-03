with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;

with Real_Generic_Matrices;
with Real_Generic_Matrix_File;

with Ada.Command_Line;    use Ada.Command_Line;
with Ada.Directories;

procedure FGenFill is
   
   package Float_Matrices is new Real_Generic_Matrices (Float);
   package Float_Matrix_File is new Real_Generic_Matrix_File 
     (
      Float,
      Float_Matrices,
      Ada.Float_Text_IO.Get
     );
   
   use Float_Matrices, Float_Matrix_File;
   
   M, N : Integer;
   Value : Float := 0.0;
   
begin
   
   M := Integer'Value (Argument(1));
   N := Integer'Value (Argument(2));
   
   if Ada.Directories.Simple_Name (Command_Name) = "fgenzero" then
      Value := 0.0;
   else
      Value := Float'Value (Argument(3));
   end if;
   
   declare
      A : Real_Matrix (1..M, 1..N) := (others => (others => 0.0));
   begin
         
      for I in A'Range(1) loop
         for J in A'Range(2) loop
            A(I,J) := Value;
         end loop;
      end loop;
         
      Put_Matrix (A);
      New_Line;
      
   end;
   
end;
