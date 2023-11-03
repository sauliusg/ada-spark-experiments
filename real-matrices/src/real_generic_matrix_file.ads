with Ada.Text_IO; use Ada.Text_IO;
with Real_Generic_Matrices;

generic
   type Real is digits <>;
   with package Real_Matrices is new Real_Generic_Matrices (Real);
   with procedure Get (File : in File_Type; Element : out Real; Width : in Field := 0);
     
package Real_Generic_Matrix_File is
   
   use Real_Matrices;
   
   function Load_Real_Matrix ( File : in File_Type ) return Real_Matrix;
   
   function Load_Real_Matrix ( File_Name : String ) return Real_Matrix;
   
   procedure Skip_To_Next_Matrix (File : File_Type);
   
   procedure Skip_To_Next_Matrix (File : File_Type; Empty_Line : out Boolean);
      
end;
