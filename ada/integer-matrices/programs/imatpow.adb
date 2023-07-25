with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;

with Ada.Command_Line;          use Ada.Command_Line;

procedure IMatPow is
   
   Power : Integer;
   
begin
   
   Power := Integer'Value (Argument (1));
   
   declare
      File_Name : String := Argument (2);
      M : Integer_Matrix := Load_Integer_Matrix (File_Name);
      Result : Integer_Matrix (M'Range(1), M'Range(2));
   begin
      for I in Result'Range(1) loop
         for J in Result'Range(1) loop
            if I = J then
               Result (I,J) := 1;
            else
               Result (I,J) := 0;
            end if;
         end loop;
      end loop;
      
      for I in 1 .. Power loop
         Result := Result * M;
      end loop;
      
      Put_Matrix (Result);
      New_Line;
   end;
   
end;
