with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;

with Ada.Command_Line;          use Ada.Command_Line;

with Ada.Unchecked_Deallocation;

procedure IMatMul is
   
   type Access_Integer_Matrix is access Integer_Matrix;
   
   Result : Access_Integer_Matrix;
   
   procedure Free is 
      new Ada.Unchecked_Deallocation (Integer_Matrix, Access_Integer_Matrix);
   
   File : File_Type;
   
begin
   
   for I in 1 .. Argument_Count loop
      Open (File, In_File, Argument (I));
      while not End_Of_File (File) loop
         declare
            File_Name : String := Argument (I);
            M : Integer_Matrix := Load_Integer_Matrix (File);
         begin
            if Result = null then
               Result := new Integer_Matrix (M'Range(1), M'Range(2));
               Result.all := M;
            else
               declare
                  Product : Integer_Matrix := Result.all * M;
               begin
                  Free (Result);
                  Result := 
                    new Integer_Matrix (Product'Range (1), Product'Range (2));
                  Result.all := Product;
               end;
            end if;
         end;
         Skip_To_Next_Matrix (File);
      end loop;
      Close (File);
   end loop;
   
   Put_Matrix (Result.all);
   New_Line;
   Free (Result);
end;
