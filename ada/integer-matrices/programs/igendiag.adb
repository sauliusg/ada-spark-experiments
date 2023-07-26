with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;
with Lazy_Determinant;    use Lazy_Determinant;

with Ada.Command_Line;    use Ada.Command_Line;
with Ada.Directories;

procedure IGenDiag is
   
   Order : Integer;
   
   Value : Integer := 1;
   
begin
   
   Order := Integer'Value (Argument(1));
   
   if Ada.Directories.Simple_Name (Command_Name) = "igenunity" then
      Value := 1;
   elsif Ada.Directories.Simple_Name (Command_Name) = "igenzero" then
      Value := 0;
   else
      Value := Integer'Value (Argument(2));
   end if;
   
   declare
      M : Integer_Matrix (1..Order, 1..Order) :=
        (others => (others => 0));
   begin
         
      for I in M'Range(1) loop
         M(I,I) := Value;
      end loop;
         
      Put_Matrix (M);
      New_Line;
      
   end;
   
end;
