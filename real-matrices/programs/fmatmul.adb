with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;

with Real_Generic_Matrices;
with Real_Generic_Matrix_File;

with Ada.Command_Line;          use Ada.Command_Line;

with Ada.Unchecked_Deallocation;

procedure FMatMul is
   
   package Float_Matrices is new Real_Generic_Matrices (Float);
   package Float_Matrix_File is new Real_Generic_Matrix_File 
     (
      Float,
      Float_Matrices,
      Ada.Float_Text_IO.Get
     );
   
   use Float_Matrices, Float_Matrix_File;
   
   type Access_Float_Matrix is access Float_Matrices.Real_Matrix;
   
   Result : Access_Float_Matrix;
   
   procedure Free is 
      new Ada.Unchecked_Deallocation (Real_Matrix, Access_Float_Matrix);
   
   File : File_Type;
   
begin
   
   for I in 1 .. Argument_Count loop
      Open (File, In_File, Argument (I));
      while not End_Of_File (File) loop
         declare
            File_Name : String := Argument (I);
            M : Real_Matrix := Load_Real_Matrix (File);
         begin
            if Result = null then
               Result := new Real_Matrix'(M);
            else
               declare
                  Product : Real_Matrix := Result.all * M;
               begin
                  Free (Result);
                  Result := 
                    new Real_Matrix (Product'Range (1), Product'Range (2));
                  Result.all := Product;
               end;
            end if;
         end;
         Skip_To_Next_Matrix (File);
      end loop;
      Close (File);
   end loop;
   
   Put_Matrix (Result.all);
   Free (Result);
end;
