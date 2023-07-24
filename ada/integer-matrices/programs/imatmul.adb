with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;

with Ada.Command_Line;          use Ada.Command_Line;

procedure IMatMul is
   
   Result : access Integer_Matrix;
   
begin
   
   for I in 1 .. Argument_Count loop
      declare
         File_Name : String := Argument (I);
         M : Integer_Matrix := Load_Integer_Matrix (File_Name);
      begin
         if Result = null then
            Result := new Integer_Matrix (M'Range(1), M'Range(2));
            Result.all := M;
         else
            Result.all := Result.all * M;
         end if;
      end;
   end loop;
   
   Put_Matrix (Result.all);
   New_Line;
end;
