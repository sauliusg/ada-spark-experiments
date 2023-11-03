with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;

with Real_Generic_Matrices;
with Real_Generic_Matrix_File;

with Ada.Command_Line;          use Ada.Command_Line;
with Ada.Directories;

with Ada.Unchecked_Deallocation;

procedure IMatAdd is
   
   package Float_Matrices is new Real_Generic_Matrices (Float);
   package Float_Matrix_File is new Real_Generic_Matrix_File 
     (
      Float,
      Float_Matrices,
      Ada.Float_Text_IO.Get
     );
   
   use Float_Matrices, Float_Matrix_File;
   
   subtype Real_Matrix is Float_Matrices.Real_Matrix;
   
   type Operation_Type is (ADD, SUB);
   
   Operation : Operation_Type := ADD;
   
   type Access_Real_Matrix is access Real_Matrix;
   
   Result : Access_Real_Matrix;
   
   procedure Free is 
      new Ada.Unchecked_Deallocation (Real_Matrix, Access_Real_Matrix);
   
begin
   
   if Ada.Directories.Simple_Name (Command_Name) = "fmatsub" then
      Operation := SUB;
   end if;
   
   for I in 1 .. Argument_Count loop
      declare
         File_Name : String := Argument (I);
         M : Real_Matrix := Load_Real_Matrix (File_Name);
      begin
         if Result = null then
            Result := new Real_Matrix'(M);
         else
            case Operation is
               when ADD => Result.all := Result.all + M;
               when SUB => Result.all := Result.all - M;
            end case;
         end if;
      end;
   end loop;
   
   Put_Matrix (Result.all);
   Free (Result);
end;
