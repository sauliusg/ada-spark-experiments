with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Integer_Matrix_File is
   
   function Load_Integer_Matrix ( File : in File_Type ) return Integer_Matrix is
      M, N : Integer;
   begin
      Get (File, M);
      Get (File, N);
      
      declare
         Matrix : Integer_Matrix (1..M, 1..N);
      begin
         for I in Matrix'Range(1) loop
            for J in Matrix'Range(2) loop
               Get (File, Matrix (I,J));
            end loop;
         end loop;
         return Matrix;
      end;
   end;
   
   function Load_Integer_Matrix ( File_Name : String ) return Integer_Matrix is
      File : File_Type;
   begin
      Open (File, In_File, File_Name);
      declare
         M : Integer_Matrix := Load_Integer_Matrix (File);
      begin
         Close (File);
         return M;
      end;
   end;
   
end;
