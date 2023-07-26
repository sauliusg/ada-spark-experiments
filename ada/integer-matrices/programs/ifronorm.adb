with Ada.Text_IO;         use Ada.Text_IO;
with Integer_Matrices;    use Integer_Matrices;
with Integer_Matrix_File; use Integer_Matrix_File;

with Ada.Command_Line;    use Ada.Command_Line;

with Ada.Numerics.Long_Long_Elementary_Functions;
use Ada.Numerics.Long_Long_Elementary_Functions;

procedure IFroNorm is
   
   -- Calculate Frobenious norm of all matrices in the input stream.
   
   File : File_Type;
   
   function Frobenius_Norm (A : Integer_Matrix) return Float is
      Sum_Of_Squares : Long_Long_Float := 0.0;
   begin
      for I in A'Range(1) loop
         for J in A'Range(2) loop
            Sum_Of_Squares := Sum_Of_Squares + Long_Long_Float (A(I,J))**2;
         end loop;
      end loop;
      return Float(Sqrt (Sum_Of_Squares));
   end;
   
begin
   
   for I in 1 .. Argument_Count loop
      Open (File, In_File, Argument (I));
      while not End_Of_File (File) loop
         declare
            M : Integer_Matrix := Load_Integer_Matrix (File);
         begin
            Put (Float'Image(Frobenius_Norm (M)));
            Put (ASCII.HT);
            Put_Matrix_Line (M);
            New_Line;
            Skip_To_Next_Matrix (File);
         end;
      end loop;
      Close (File);
   end loop;
   
end;
