with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;
with Lazy_Determinant;    use Lazy_Determinant;

with Ada.Command_Line;    use Ada.Command_Line;
with Ada.Directories;

procedure IGenFill is
   
   M, N : Integer;
   Value : Integer := 0;
   
begin
   
   M := Integer'Value (Argument(1));
   N := Integer'Value (Argument(2));
   
   if Ada.Directories.Simple_Name (Command_Name) = "igenzero" then
      Value := 0;
   else
      Value := Integer'Value (Argument(3));
   end if;
   
   declare
      A : Integer_Matrix (1..M, 1..N) :=
        (others => (others => 0));
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
