with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;

with Ada.Command_Line;          use Ada.Command_Line;
with Ada.Directories;

with Ada.Unchecked_Deallocation;

procedure IMatMul is
   
   type Operation_Type is (ADD, SUB);
   
   Operation : Operation_Type := ADD;
   
   type Access_Integer_Matrix is access Integer_Matrix;
   
   Result : Access_Integer_Matrix;
   
   procedure Free is 
      new Ada.Unchecked_Deallocation (Integer_Matrix, Access_Integer_Matrix);
   
begin
   
   if Ada.Directories.Simple_Name (Command_Name) = "imatsub" then
      Operation := SUB;
   end if;
   
   for I in 1 .. Argument_Count loop
      declare
         File_Name : String := Argument (I);
         M : Integer_Matrix := Load_Integer_Matrix (File_Name);
      begin
         if Result = null then
            Result := new Integer_Matrix (M'Range(1), M'Range(2));
            Result.all := M;
         else
            case Operation is
               when ADD => Result.all := Result.all + M;
               when SUB => Result.all := Result.all - M;
            end case;
         end if;
      end;
   end loop;
   
   Put_Matrix (Result.all);
   New_Line;
   Free (Result);
end;
