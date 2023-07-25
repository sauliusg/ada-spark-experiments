with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;

with Ada.Command_Line;          use Ada.Command_Line;

procedure IMatPowers is
   
   Max_Power : Integer;
   Power : Integer;
   
begin
   
   Max_Power := Integer'Value (Argument (1));
   
   for I in 2 .. Argument_Count loop
      declare
         File_Name : String := Argument (I);
         M : Integer_Matrix := Load_Integer_Matrix (File_Name);
         
         Unity : Integer_Matrix (M'Range(1), M'Range(2)) :=
           (others => (others => 0));
         
         Result : Integer_Matrix := Unity;
         
      begin
         for I in Unity'Range(1) loop
            Unity (I,I) := 1;
         end loop;
         
         Result := Unity;
         
         for Power in 1 .. Max_Power loop
            Result := Result * M;      
            Put (Power'Image);
            Put (ASCII.HT);
            Put_Matrix_Line (Result);
            New_Line;
            exit when Result = Unity;
         end loop;
      end;
   end loop;
   
end;
