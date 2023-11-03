with Ada.Text_IO;      use Ada.Text_IO;
with Integer_Matrices; use Integer_Matrices;

package Integer_Matrix_File is
   
   function Load_Integer_Matrix ( File : in File_Type ) return Integer_Matrix;
   
   function Load_Integer_Matrix ( File_Name : String ) return Integer_Matrix;
   
   procedure Skip_To_Next_Matrix (File : File_Type);
   
   procedure Skip_To_Next_Matrix (File : File_Type; Empty_Line : out Boolean);
      
end;
