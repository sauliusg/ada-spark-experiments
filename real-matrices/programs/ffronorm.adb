with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;

with Real_Generic_Matrices;
with Real_Generic_Matrix_File;

with Ada.Command_Line;    use Ada.Command_Line;

with Ada.Numerics.Long_Long_Elementary_Functions;
use Ada.Numerics.Long_Long_Elementary_Functions;

procedure FFroNorm is
   
   -- Calculate Frobenious norm of all matrices in the input stream.
   
   package Float_Matrices is new Real_Generic_Matrices (Float);
   package Float_Matrix_File is new Real_Generic_Matrix_File 
     (
      Float,
      Float_Matrices,
      Ada.Float_Text_IO.Get
     );
   
   use Float_Matrices, Float_Matrix_File;
   
   File : File_Type;
   
   function Frobenius_Norm (A : Real_Matrix) return Float is
      Sum_Of_Squares : Long_Long_Float := 0.0;
   begin
      for I in A'Range(1) loop
         for J in A'Range(2) loop
            Sum_Of_Squares := Sum_Of_Squares + Long_Long_Float (A(I,J))**2;
         end loop;
      end loop;
      return Float(Sqrt (Sum_Of_Squares));
   end;
   
   Empty_Line : Boolean := False;
   
begin
   
   for I in 1 .. Argument_Count loop
      Open (File, In_File, Argument (I));
      Empty_Line := False;
      while not End_Of_File (File) loop
         declare
            M : Real_Matrix := Load_Real_Matrix (File);
         begin
            if Empty_Line then
               New_Line;
            end if;
            Put (Float'Image(Frobenius_Norm (M)));
            Put (ASCII.HT);
            Put_Matrix_Line (M);
            New_Line;
            Skip_To_Next_Matrix (File, Empty_Line);
         end;
      end loop;
      Close (File);
      if I < Argument_Count then
         New_Line;
      end if;
   end loop;
   
end;
